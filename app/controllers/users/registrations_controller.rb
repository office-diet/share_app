# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      render :new and return
    end
   session["devise.regist_data"] = {user: @user.attributes}
   session["devise.regist_data"][:user]["password"] = params[:user][:password]
   @address = Address.new
   render :new_address  
  end
  
  def create_address
    @address = Address.new(address_params)
    unless @address.valid?
      render :new_address and return
    end
    unless params[:card_token]
      render :new_address and return
    end

    user = User.create(session["devise.regist_data"]["user"])
    address = Address.create(address_params.merge( user_id: user.id ))
    
    Payjp.api_key = ENV["PAYJP_SECURITY_KEY"] 
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params[:card_token] 
    )    
    card = Card.create( # トークン化されたカード情報を保存する
      card_token: params[:card_token], # カードトークン
      customer_token: customer.id, # 顧客トークン
      user_id: user.id # ログインしているユーザー
    )
    sign_in(:user, user)
    # session["devise.regist_data"]["user"].clear
    redirect_to root_path
  end

  protected
 
  def address_params
    params.permit(:postal_code, :prefecture_id, :town, :address, :building, :tel).merge(name: "#{session["devise.regist_data"]["user"]["family_name"]} #{session["devise.regist_data"]["user"]["first_name"]}")
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

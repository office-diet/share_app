class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = Cart.includes(:item).where( user_id: current_user.id ).order(updated_at: "desc")
  end
  
  def create
    cart = Cart.where(cart_params).first_or_initialize
    cart.save
    redirect_to action: :index
  end
  
  def destroy
    cart = Cart.find(params[:id])
    if cart.user_id = current_user.id
      cart.destroy
    end
    redirect_to action: :index
  end
  
  def update
    cart = Cart.find(params[:id])
    if cart.user_id = current_user.id
      if params[:buy] == "true"
        cart.update(buy: false)
      else
        cart.update(buy: true)
      end
    end
    redirect_to action: :index
  end

  private

  def cart_params
    params.permit( :item_id).merge( user_id: current_user.id)
  end
end
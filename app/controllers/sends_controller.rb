class SendsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @sends_items = Send.includes(:item).where( user_id: current_user.id).order(updated_at: "desc")
  end

  def new
    @cart_items = Cart.includes(:item).where( user_id: current_user.id, buy: true ).order(updated_at: "desc")
    @addresses = Address.where(user_id: current_user.id)
  end

  def create
    carts = Cart.where( user_id: current_user.id, buy: true )
    carts.each do |cart|
      Send.create(item_id: cart.item_id, user_id: current_user.id, address_id: params[:address_id])
      cart.destroy
    end
    redirect_to root_path
  end

  def update
    send = Send.find(params[:id])
    send.update(return: true)
    redirect_to sends_path
  end
end

class ItemsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @items = Item.where(product_id: params[:product_id])
  end
end

class ProductsController < ApplicationController
  def index
    item_ids = Send.select(:item_id)
    product_ids = Item.where.not(id: item_ids).select(:product_id).distinct
    @products = Product.where(id: product_ids).page(params[:page]).per(20)
  end

  def search
    @products = Product.where("NAME LIKE '%#{params[:key]}%'").page(params[:page]).per(20)
  end
end

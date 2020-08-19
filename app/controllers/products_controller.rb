class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(20)
  end

  def search
    @products = Product.where("NAME LIKE '%#{params[:key]}%'").page(params[:page]).per(20)
  end
end

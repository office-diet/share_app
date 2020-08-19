class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(20)
  end
end

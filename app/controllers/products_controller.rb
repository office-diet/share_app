class ProductsController < ApplicationController
  def index
    @product = Produxt.alll
  end
end

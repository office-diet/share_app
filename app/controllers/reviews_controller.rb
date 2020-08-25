class ReviewsController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @reviews = Review.includes(:user).where(product_id: params[:product_id])
  end
  
  def create
    Review.create(review_params.merge( user_id: current_user.id, product_id: params[:product_id] ))
    redirect_to action: :index
  end
  
  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to action: :index
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:star, :title, :text)
  end

end

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def confirm
  end

  def create
    product = Product.find(params[:product_id])
    review = product.reviews_new
    review.save_review(review, review_params)
    redirect_to product_url(product)
  end

  def show
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to products_url
  end

  private
    def review_params
      params.require(:review).permit(:content, :product_id, :user_id).
             merge(user_id: current_user.id, product_id: params[:product_id])
    end
end

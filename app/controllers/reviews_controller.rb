class ReviewsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]

  def show
    @product = load_product
  	@review = Review.new
  end

  def create
    @product = load_product
  	@review = @product.reviews.build(review_params)
  	@review.user = current_user

  	if @review.save
  		redirect_to product_review_path(@product, @review), notice: 'Review created successfully'
  	else
  		render 'products/show'
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private
  def review_params
  	params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end
end

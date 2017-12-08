class ReviewsController < ApplicationController

  before_action :require_login

   def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.description = params[:description]
    @review.user_id = current_user.id if current_user
    if @review.save!
      redirect_to @review.product
    else
      redirect :back
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to @review.product
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def require_login
      unless logged_in?
        redirect_to login_url # halts request cycle
      end
    end
end

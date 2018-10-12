class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find_by(id: params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save!
      redirect_to :back
    else
      @status = true
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    if @review.user_id == current_user.id
      @review.destroy
    end
    redirect_to :back
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login'
    end
  end

end

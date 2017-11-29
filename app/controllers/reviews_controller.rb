class ReviewsController < ApplicationController
  before_action :set_restaurant, only:[:new]
  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to restaurant_path(Restaurant.find(@review.restaurant_id))
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end

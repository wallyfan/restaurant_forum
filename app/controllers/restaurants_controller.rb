class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all 
  end

  def show
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

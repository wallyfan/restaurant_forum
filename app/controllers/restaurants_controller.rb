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

  def favorite
    @restaurant = Restaurant.find(params[:id])
    Favorite.create(restaurant: @restaurant, user: current_user)
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

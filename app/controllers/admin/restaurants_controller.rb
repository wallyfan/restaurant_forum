class Admin::RestaurantsController < ApplicationController

  before_action :authenticate_admin
  before_action :set_restaurant, only: [:show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "餐廳資訊建立成功"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "建立餐廳資訊失敗"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "餐廳資訊更新成功"
      redirect_to admin_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "更新失敗"
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

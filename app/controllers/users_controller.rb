class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @commented_restaurants = @user.restaurants.uniq
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

end

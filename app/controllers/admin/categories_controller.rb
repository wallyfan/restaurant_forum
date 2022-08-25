class Admin::CategoriesController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
  @categories = Category.all
    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
  end

  def create
  @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "新餐廳分類已建立"
      redirect_to admin_categories_path

    else
      @categories = Category.all
      render :index
    end
  end

def update
  @category = Category.find(params[:id])
  if @category.update(category_params)
    redirect_to admin_categories_path
    flash[:notice] = "餐廳分類名稱修改成功"
  else
    @categories = Category.all
    render :index
  end
end


private

def category_params
  params.require(:category).permit(:name)
end


end

class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:update, :destroy]

  def index
  @categories = Category.all
  # 這裡是new or edit 的form所需要的值，如果有url有id就將form帶入edit，沒有就new。
    if params[:id]
      set_category
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
  if @category.update(category_params)
    redirect_to admin_categories_path
    flash[:notice] = "餐廳分類名稱修改成功"
  else
    @categories = Category.all
    render :index
  end
end


def destroy
  @category.destroy
  flash[:alert] = "餐廳分類刪除成功"
  redirect_to admin_categories_path
end

private

def category_params
  params.require(:category).permit(:name)
end

def set_category
  @category = Category.find(params[:id])
end


end

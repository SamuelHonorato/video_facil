class CategoriesController < ApplicationController

  def index
    @categories_all = Category.order(created_at: :desc)
    @category_new = Category.new
  end

  def new
    value = params.require(:category).permit(:name, :favorite)
    category = Category.new value

    if category.save
      redirect_to categories_url
    else
      redirect_to categories_url
    end
  end

  def destroy
    id = params[:id]
    Category.destroy id
    redirect_to categories_url
  end

end

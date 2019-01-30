class CategoriesController < ApplicationController

  def index
    @categories_all = Category.order(created_at: :desc)
    @category_new = Category.new
  end

  def new
    value = params.require(:category).permit(:name, :favorite)
    @category_new = Category.new value

    if @category_new.save
      flash[:add] = "Categoria #{@category_new.name.upcase} adicionada com sucesso!"
      redirect_to categories_url
    else
      render :index
    end
  end

  def destroy
    id = params[:id]
    Category.destroy id
    flash[:remove] = "Categoria removida com sucesso!"
    redirect_to categories_url
  end

end

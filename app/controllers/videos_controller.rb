class VideosController < ApplicationController

  def index
    @categories_favorite = Category.where(favorite: true).order(created_at: :desc)
  end

  def new
    @video_new = Video.new
    @category_all = Category.order(name: :asc)
  end

  def create
    value = params.require(:video).permit(:title, :url, :category_id)
    if value[:url].include? "="
      value[:url] = value[:url].split('=').last
    else
      value[:url] = value[:url].split('/').last
    end

    value[:url] = "https://www.youtube.com/embed/#{value[:url]}"

    Video.create value

    redirect_to root_url
  end

  def show
    id = params[:id]
    @video_show = Video.where(id: id).first
    @comment_new = Comment.new

  end

  def destroy
    id = params[:id]
    Video.destroy id
    redirect_to root_url
  end

end

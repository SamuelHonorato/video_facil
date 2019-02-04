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

    if (value[:url].include? "=") && (value[:url].length != 0)
      value[:url] = value[:url].split('=').last
      value[:url] = "https://www.youtube.com/embed/#{value[:url]}"
    elsif (value[:url].include? "/") && (value[:url].length != 0)
      value[:url] = value[:url].split('/').last
      value[:url] = "https://www.youtube.com/embed/#{value[:url]}"
    end

    @video_new = Video.new value

    if @video_new.save
      flash[:video_add] = "Vídeo criado com sucesso."
      redirect_to videos_path
    else
      @category_all = Category.order(name: :asc)
      render :new
    end
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

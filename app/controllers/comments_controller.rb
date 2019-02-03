class CommentsController < ApplicationController

  def new
    value = params.require(:comment).permit(:author, :message)
    value[:video_id] = params[:video_id]

    Comment.create value
    redirect_to root_url
  end

end

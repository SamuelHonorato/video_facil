class CommentsController < ApplicationController

  def new
    id = params[:video_id]
    value = params.require(:comment).permit(:author, :message)
    value[:video_id] = id

    Comment.create value
    redirect_to controller: 'videos', action: 'show', id: id
  end

end

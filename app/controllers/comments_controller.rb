class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @spot = Spot.find(params[:spot_id])
    if @comment.save
      CommentChannel.broadcast_to @spot, { comment: @comment, user: @comment.user }
      
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end

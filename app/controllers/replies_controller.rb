class RepliesController < ApplicationController
  def index
    @comment = Comment.find(params[:comment_id])
    @replies = @comment.replies
  end

  def create
    @parent_comment = Comment.find(params[:comment_id])
    @new_comment = current_user.comments.new(reply_params)
    @new_comment.parent = @parent_comment
    @new_comment.topic = @parent_comment.topic
    @saved = @new_comment.save ? true : false
    @errors = @new_comment.errors.full_messages.join(';') unless @saved
  end

  private

  def reply_params
    params.require(:comment).permit(:body)
  end
end
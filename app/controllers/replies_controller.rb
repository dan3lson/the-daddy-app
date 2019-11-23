class RepliesController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @replies = @comment.replies
  end
end
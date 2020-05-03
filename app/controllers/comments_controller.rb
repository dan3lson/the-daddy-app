# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @root_comments = Comment.root.latest
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @saved = @comment.save
    @errors = @comment.errors.full_messages.join('; ').html_safe unless @saved
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image)
  end
end

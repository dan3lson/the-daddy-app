# frozen_string_literal: true

# RepliesController
class RepliesController < ApplicationController
  def index
    @comment = Comment.find(params[:comment_id])
    @replies = @comment.replies.latest
  end

  def create
    @parent_comment = Comment.find(params[:comment_id])
    options = reply_params.dup.merge({ parent_id: @parent_comment.id })

    reply =
      CreateReply.new(current_user, options)
        .subscribe(MailerListener.new)
        .post

    if reply.persisted?
      @saved = true
    else
      @errors = reply.errors.full_messages.join(';')
    end
  end

  private

  def reply_params
    params.require(:comment).permit(:body)
  end
end

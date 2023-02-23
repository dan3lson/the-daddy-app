# frozen_string_literal: true

# CreateReply posts new comments as a response to another comment.
class CreateReply
  include Wisper::Publisher

  attr_reader :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end

  def post
    reply = build_reply

    broadcast(:successful_reply, reply.id) if reply.save

    reply
  end

  private

  def parent_comment
    @parent_comment ||= Comment.find(params[:parent_id])
  end

  def build_reply
    reply = user.comments.new(params)
    reply.topic = parent_comment.topic

    reply
  end
end

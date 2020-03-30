# frozen_string_literal: true

# CreateReply posts new comments as a response to another comment.
class CreateReply
  include Wisper::Publisher

  def post
    create_reply
  end

  private

  attr_reader :user, :params

  def initialize(user, params)
    @user = user
    @params = params
  end

  def create_reply
    reply = build_reply

    broadcast(:successful_reply, reply.id) if reply.save

    reply
  end

  def parent_comment
    @parent_comment ||= Comment.find(params[:parent_id])
  end

  def build_reply
    reply = user.comments.new(params)
    reply.topic = parent_comment.topic

    reply
  end
end

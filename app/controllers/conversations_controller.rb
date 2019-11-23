# frozen_string_literal: true

class ConversationsController < ApplicationController
  def index
    @root_comments = Comment.root
    @topics = Topic.all
  end
end

# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @root_comments = Comment.root
    @topics = Topic.all
    @new_comment = Comment.new
  end
end

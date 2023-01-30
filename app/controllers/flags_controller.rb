# frozen_string_literal: true

class FlagsController < ApplicationController
  before_action :set_comment, only: %i[create destroy]

  def create
    current_user.flags.create!(comment: @comment)
  end

  def destroy
    current_user.flags.find_by!(comment: @comment).destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end

# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :set_comment, only: %i[create destroy]

  def create
    @reaction = current_user.reactions.new(reactionable: @comment, emoji: Emoji.like_emoji)
    @reaction.save
  end

  def destroy
    @reaction = current_user.reactions.find_by(reactionable: @comment, emoji: Emoji.like_emoji)
    @reaction.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  # Only allow a list of trusted parameters through.
  def reaction_params
    params.require(:reaction).permit(:emoji_id, :reactionable_id, :reactionable_type)
  end
end

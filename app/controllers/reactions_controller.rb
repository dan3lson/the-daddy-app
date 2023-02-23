# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :set_common_instance_vars, only: %i[create destroy]

  def create
    model = reaction_params[:reactionable_type].constantize
    @emoji = Emoji.find_by(emoji: reaction_params[:emoji])
    @reactionable = model.find(reaction_params[:reactionable_id])
    @reaction = current_user.reactions.new(reactionable: @reactionable, emoji: @emoji)
    @reaction.save
    @reaction_count = @reactionable.public_send(@reaction_count_method_name)
  end

  def destroy
    @reaction = current_user.reactions.find(params[:id])
    @reactionable = @reaction.reactionable
    @emoji = @reaction.emoji
    @reaction.destroy
    @reaction_count = @reactionable.public_send(@reaction_count_method_name)
  end

  private

  def set_common_instance_vars
    @cta = reaction_params[:cta]
    @reaction_count_method_name = reaction_params[:reaction_count_method_name]
  end

  def reaction_params
    params
      .require(:reaction)
      .permit(:cta, :emoji, :reactionable_id, :reactionable_type, :reaction_count_method_name)
  end
end

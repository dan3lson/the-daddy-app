# frozen_string_literal: true

module Onboarding
  class CommentsController < ApplicationController
    include Wisper::Publisher

    before_action :subscribe_to_events

    def create
      current_user.comments.create!(body: comment_params[:body])

      redirect_to signed_in_root_path
    rescue ActiveRecord::RecordInvalid => e
      broadcast(
        :alert,
        OpenStruct.new(
          additional_data: {body: comment_params[:body]},
          current_user_id: current_user.id,
          message: e.message,
          type: :error
        )
      )
    end

    private

    def subscribe_to_events
      subscribe(MailerListener.new)
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end

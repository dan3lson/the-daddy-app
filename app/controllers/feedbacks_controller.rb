# frozen_string_literal: true

class FeedbacksController < ApplicationController
  layout "layouts/application_signed_in"

  def index
    @feedback = Feedback.new
    @feedbacks = Feedback.latest
  end

  # TODO: render js so @feedbacks on line 20 doesn't need to be fetched again
  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    @feedback.kind = :general

    if @feedback.save
      redirect_to feedbacks_path, success: "Thanks for your feedback"
    else
      @errors = @feedback.errors.full_messages.join(";")
      @feedbacks = Feedback.latest

      render :index
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end

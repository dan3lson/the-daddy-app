# frozen_string_literal: true

class CommentsController < ApplicationController
  include Wisper::Publisher

  layout "layouts/application_signed_in"

  before_action :subscribe_to_events

  def index
    @root_comments = Comment.root.latest
    @comment = Comment.new
  end

  def create
    # TODO: extract the QOTD code and change this to:
    # if params[:question_of_the_day_id].present?
    #   CreateQuestionOfTheDay.call(
    #     question_id: params[:question_of_the_day_id],
    #     user: current_user
    #   )
    # end

    if params[:question_of_the_day_id].present?
      @question_of_the_day = QuestionOfTheDay.find(params[:question_of_the_day_id])
      response = current_user.users_question_of_the_days.new(question_of_the_day: @question_of_the_day)

      unless response.save
        broadcast(
          :alert,
          OpenStruct.new(
            additional_data: {
              body: comment_params[:body],
              question_of_the_day_id: params[:question_of_the_day_id]
            },
            current_user_id: current_user.id,
            message: response.errors.full_messages.join("; "),
            type: :error
          )
        )
      end
    end

    @comment = current_user.comments.new(comment_params)
    @saved = @comment.save
    @errors = @comment.errors.full_messages.join("; ").html_safe unless @saved
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :image)
  end

  def subscribe_to_events
    subscribe(MailerListener.new)
  end
end

# frozen_string_literal: true

class UsersQuestionOfTheDaysController < ApplicationController
  layout "layouts/application_signed_in"

  before_action :set_question_of_the_day

  def new
    @users_question_of_the_day = UsersQuestionOfTheDay.new
  end

  def create
    @users_question_of_the_day =
      current_user
        .users_question_of_the_days
        .new(question_of_the_day: @question_of_the_day)
    @comment =
      current_user
        .comments
        .new(
          users_question_of_the_day_params.merge(
            users_question_of_the_day: @users_question_of_the_day
          )
        )

    if @comment.save && @users_question_of_the_day.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_question_of_the_day
    @question_of_the_day = QuestionOfTheDay.today
  end

  def users_question_of_the_day_params
    params.require(:users_question_of_the_day).permit(:body)
  end
end

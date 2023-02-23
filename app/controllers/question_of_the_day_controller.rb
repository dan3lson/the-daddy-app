# frozen_string_literal: true

class QuestionOfTheDayController < ApplicationController
  def show
    @question_of_the_day = QuestionOfTheDay.today
  end
end

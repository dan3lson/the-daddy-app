# frozen_string_literal: true

class UsersQuestionOfTheDay < ApplicationRecord
  belongs_to :question_of_the_day
  belongs_to :user
end

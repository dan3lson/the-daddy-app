# frozen_string_literal: true

FactoryBot.define do
  factory :users_question_of_the_day do
    question_of_the_day
    user
  end
end

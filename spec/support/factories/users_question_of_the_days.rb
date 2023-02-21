# frozen_string_literal: true

FactoryBot.define do
  factory :users_question_of_the_day do
    question_of_the_day
    user

    after(:create) do |users_question_of_the_day, _evaluator|
      create(
        :comment,
        user: users_question_of_the_day.user,
        users_question_of_the_day: users_question_of_the_day
      )
    end
  end
end

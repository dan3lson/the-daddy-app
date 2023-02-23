# frozen_string_literal: true

FactoryBot.define do
  factory :question_of_the_day do
    day { Date.current }
    question { Faker::Lorem.sentence }
  end
end

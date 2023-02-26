# frozen_string_literal: true

FactoryBot.define do
  factory :question_of_the_day do
    day { Time.current.in_time_zone(Lib::Constants::TIME_ZONES[:pacific]) }
    question { Faker::Lorem.sentence }
  end
end

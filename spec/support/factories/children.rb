# frozen_string_literal: true

FactoryBot.define do
  factory :child do
    first_name { "Danelson Jr." }
    gender { :male }
    birthdate { DateTime.strptime("07/21/2019", "%m/%d/%Y").to_date }

    association :daddy, factory: :user
  end
end

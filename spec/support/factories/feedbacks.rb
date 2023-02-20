# frozen_string_literal: true

FactoryBot.define do
  factory :feedback do
    body { Faker::Lorem.sentence }
    kind { :feature_request }

    user
  end
end

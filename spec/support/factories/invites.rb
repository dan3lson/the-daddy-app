# frozen_string_literal: true

FactoryBot.define do
  factory :invite do
    sequence(:email) { |i|  "guest#{i}@email.com" }

    user

    trait(:from_guest) do
      user { nil }
    end
  end
end

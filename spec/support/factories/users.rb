# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { "Danelson Sr." }
    city { "Bronx" }
    password { "password" }
    sequence(:email) { |i| "email+#{i}@thedaddyapp.com" }

    factory :daddy_with_babies do
      transient do
        babies_count { 1 }
      end

      after(:create) do |user, evaluator|
        create_list(:baby, evaluator.babies_count, daddy: user)
      end
    end

    trait :with_liked_comment do
      after(:create) do |user, _evaluator|
        create(:reaction, user: user)
      end
    end
  end
end

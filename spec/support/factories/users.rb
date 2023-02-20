# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { "Danelson Sr." }
    city { "Bronx" }
    password { "password" }
    sequence(:email) { |i| "email+#{i}@thedaddyapp.com" }

    factory :daddy_with_children do
      transient do
        children_count { 1 }
      end

      after(:create) do |user, evaluator|
        create_list(:child, evaluator.children_count, daddy: user)
      end
    end

    trait :with_liked_comment do
      after(:create) do |user, _evaluator|
        create(:reaction, user: user)
      end
    end

    trait :with_upvoted_feedback do
      after(:create) do |user, _evaluator|
        create(:reaction, :for_feedback, user: user)
      end
    end

    trait :with_flagged_comment do
      after(:create) do |user, _evaluator|
        create(:flag, user: user)
      end
    end
  end
end

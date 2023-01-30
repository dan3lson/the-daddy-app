# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentences(number: rand(1..5)).join(" ") }

    user

    factory :comment_with_replies do
      transient do
        replies_count { 1 }
      end

      after(:create) do |comment, evaluator|
        create_list(:comment, evaluator.replies_count, parent: comment)
      end
    end

    factory :invalid_reply do
      body { "" }

      user { nil }
    end

    factory :comment_with_likes do
      transient do
        likes_count { 1 }
      end

      after(:create) do |comment, evaluator|
        emoji = create(:emoji)

        create_list(
          :reaction,
          evaluator.likes_count,
          reactionable: comment,
          emoji: emoji,
          user: create(:user)
        )
      end
    end

    factory :comment_with_flags do
      transient do
        flags_count { 1 }
      end

      after(:create) do |comment, evaluator|
        create_list(
          :flag,
          evaluator.flags_count,
          comment: comment,
          user: create(:user)
        )
      end
    end
  end
end

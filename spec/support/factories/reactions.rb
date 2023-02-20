# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    emoji
    for_comment
    user

    trait :for_comment do
      association :reactionable, factory: :comment
    end

    trait :for_feedback do
      upvote
      association :reactionable, factory: :feedback
    end

    trait :heart do
      association :emoji, :red_heart
    end

    trait :like do
      association :emoji, :thumbs_up_default
    end

    trait :upvote do
      association :emoji, :plus
    end
  end
end

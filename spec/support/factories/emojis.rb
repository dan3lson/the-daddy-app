# frozen_string_literal: true

FactoryBot.define do
  factory :emoji do
    thumbs_up_default

    trait :thumbs_up_default do
      sequence(:emoji) { |_i| "👍" }
      sequence(:name) { |_i| "thumbs-up-default" }
    end

    trait :red_heart do
      emoji { "❤️" }
      name { "red-heart" }
    end
  end
end

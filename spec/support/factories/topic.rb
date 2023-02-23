# frozen_string_literal: true

FactoryBot.define do
  factory :topic do
    sequence(:name) { |i| "Relationships+#{i}" }
  end
end

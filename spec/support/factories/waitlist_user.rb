# frozen_string_literal: true

FactoryBot.define do
  factory :waitlist_user do
    first_name { "Danelson Sr." }
    daddy_type { "first_timer" }
    sequence(:email) { |i| "email+#{i}@thedaddyapp.com" }
  end
end

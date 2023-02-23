# frozen_string_literal: true

FactoryBot.define do
  factory :registration do
    first_name { "Danelson Sr." }
    password { "password" }
    sequence(:email) { |i| "email+#{i}@thedaddyapp.com" }
    children {
      {
        "0" => {
          "first_name" => "Junior",
          "gender" => "male",
          "birthdate" => "2019/07/21"
        }
      }
    }

    factory :invalid_daddy_registration do
      email { "" }
    end

    factory :invalid_child_registration do
      children {
        {
          "0" => {
            "first_name" => "",
            "gender" => "",
            "birthdate" => "2019/07/21"
          }
        }
      }
    end

    trait :multiple_children do
      children {
        {
          "0" => {
            "first_name" => "Junior",
            "gender" => "male",
            "birthdate" => "2019/07/21"
          },
          "1" => {
            "first_name" => "Mariella",
            "gender" => "female",
            "birthdate" => "2021/07/21"
          }
        }
      }
    end
  end
end

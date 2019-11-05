FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    city       { 'Bronx' }
    password   { 'password' }
    admin      { false }

		sequence(:email) { |i| "email+#{i}@gmail.com" }
  end
end

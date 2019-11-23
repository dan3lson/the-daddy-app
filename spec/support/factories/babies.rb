FactoryBot.define do
  factory :baby do
    first_name { 'Danelson Jr.' }
    gender { :male }
    birthdate { DateTime.strptime('07/21/2019', "%m/%d/%Y").to_date }

    association :daddy, factory: :user
  end
end

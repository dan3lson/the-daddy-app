FactoryBot.define do
  factory :registration do
    first_name { 'Danelson Sr.' }
    city       { 'Bronx' }
    password   { 'password' }
		sequence(:email) { |i| "email+#{i}@thedaddyapp.com" }
    babies {
      [{ first_name: 'Junior', gender: :male, birthdate: '2019/07/21' }]
    }

    trait(:multiple_babies) do
      babies {
        [
          { first_name: 'Junior', gender: :male, birthdate: '2019/07/21' },
          { first_name: 'Mariella', gender: :female, birthdate: '2019/07/02' }
        ]
      }
    end
  end
end

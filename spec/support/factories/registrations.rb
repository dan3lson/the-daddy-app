FactoryBot.define do
  factory :registration do
    first_name { 'Danelson Sr.' }
    city       { 'Bronx' }
    password   { 'password' }
		sequence(:email) { |i| "email+#{i}@thedaddyapp.com" }
    babies {
      {
        '0' => {
          'first_name' => 'Junior',
          'gender' => 'male',
          'birthdate' => '2019/07/21'
        }
      }
    }

    factory :invalid_daddy_registration do
      city { '' }
      email { nil }
    end

    factory :invalid_baby_registration do
      babies {
        {
          '0' => {
            'first_name' => '',
            'gender' => nil,
            'birthdate' => '2019/07/21'
          }
        }
      }
    end

    trait :multiple_babies do
      babies {
        {
          '0' => {
            'first_name' => 'Junior',
            'gender' => 'male',
            'birthdate' => '2019/07/21'
          },
          '1' => {
            'first_name' => 'Mariella',
            'gender' => 'female',
            'birthdate' => '2021/07/21'
          }
        }
      }
    end
  end
end

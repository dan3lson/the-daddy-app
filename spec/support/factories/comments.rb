FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentences(number: rand(1..5)).join(' ') }

    user
    topic

    factory :comment_with_replies do
      transient do
        replies_count { 1 }
      end

      after(:create) do |comment, evaluator|
        create_list(:comment, evaluator.replies_count, parent: comment)
      end
    end
  end
end
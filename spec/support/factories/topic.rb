FactoryBot.define do
  factory :topic do
    sequence(:name) { |i| "Relationships+#{i}" }
  end
end

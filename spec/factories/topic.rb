include Faker

FactoryGirl.define do
  factory :topic do
      title Faker::Lorem:sentence
      topic
  end
end

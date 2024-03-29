FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@email.com" }
    password "12345678"
    sequence(:name) { |n| "Spencer Dixon #{n}" }
  end

  factory :identity do
    user
    provider "twitter"
    uid "233432234"
  end

  factory :family do
    sequence(:name) { |n| "Dixon #{n}" }
  end

  factory :family_membership do
    user
    family
  end

  factory :message_category do
    name 'general'
  end

  factory :family_message do
    user
    family
    message 'Lets go snowboarding today!'
    category 'general'
  end
end


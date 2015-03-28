FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@email.com" }
    password "12345678"
    name "Spencer Dixon"
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
end

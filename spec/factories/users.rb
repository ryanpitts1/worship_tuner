FactoryGirl.define do
  factory :user do |u|
    u.sequence(:name) { |n| "Example User #{n}" }
    u.sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation { |p| p.password }
    
    trait :admin do
      admin true
    end
  end
end
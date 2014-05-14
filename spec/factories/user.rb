FactoryGirl.define do
  factory :user do
    sequence(:username, 100) { |n| "Henry#{n}Ford" }
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end


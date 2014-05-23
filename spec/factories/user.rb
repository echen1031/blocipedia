FactoryGirl.define do
  factory :user do
    sequence(:username, 100) { |n| "Henry#{n}Ford" }
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    role "member"
    password "helloworld"
    password_confirmation "helloworld"
    premium false
    confirmed_at Time.now
  end

  factory :admin, parent: :user do
    role "admin"
  end

  factory :premium, parent: :user do
    premium true
  end
end


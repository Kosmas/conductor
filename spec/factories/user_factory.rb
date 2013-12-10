FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    name 'tester'
    email { generate(:email) }
    password 'password'
    password_confirmation	'password'

    factory :admin_user do
      admin true
    end
  end
end

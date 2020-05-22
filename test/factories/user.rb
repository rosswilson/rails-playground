FactoryBot.define do
  sequence :email do |n|
    "email-#{n}@example.com"
  end

  factory :user do
    name { "Test User" }
    email { generate(:email) }
    password { "password" }
  end
end

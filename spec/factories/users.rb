FactoryBot.define do
  factory :user do
    name { "nickname" }
    sequence(:email) { |n| "mail#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end

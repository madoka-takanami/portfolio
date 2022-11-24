FactoryBot.define do
  factory :restaurant do
    rst_type { :default }
    rst_name { "rst_name" }
    place { "place" }
    feature { "feature" }
    memo { "memo" }
    association :user
  end
end

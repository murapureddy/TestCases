FactoryBot.define do
  factory :post do
    title { "hello" }
    description { "hhh" }
    association :user
  end
end

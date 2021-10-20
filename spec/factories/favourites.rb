FactoryBot.define do
  factory :favourite do
    user_id { Faker::Number.number(digits: 2) }
    car_id { Faker::Number.number(digits: 2) }
  end
end
FactoryBot.define do
  factory :car do
    three_day_rental_price { Faker::Number.number(10) }
    one_week_rental_price { Faker::Number.number(10) }
    one_month_rental_price { Faker::Number.number(10) }
    delivery true
    fuel_type { Faker::Vehicle.fuel_type }
    rental_requirements { Faker::Lorem.paragraph }
    terms_and_conditions { Faker::Lorem.paragraph }
    rental_company { Faker::Vehicle.manufacture }
    model { Faker::Vehicle.model }
    manufacturer { Faker::Vehicle.manufacture }
    image_url { Faker::Creature::Animal.name }
    uploader { Faker::Number.number(digits: 2) }
    status 'available'
  end
end

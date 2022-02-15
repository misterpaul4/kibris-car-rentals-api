class CarSerializer < ActiveModel::Serializer
  attributes :id, 
  :three_day_rental_price, 
  :one_week_rental_price, 
  :one_month_rental_price, 
  :delivery, 
  :fuel_type, 
  :rental_requirements, 
  :terms_and_conditions, 
  :rental_company,
  :availability,
  :manufacturer,
  :model,
  :image_url,
  :daily_rental_price,
  :currency,
  :car_vin,
  :model_year,
  :uploader,
  :updated_at,
  :created_at
  # belongs_to :uploader, class_name: 'User'
  # has_many :favourites
end

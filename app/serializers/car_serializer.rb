class CarSerializer < ActiveModel::Serializer
  attributes :id, :three_day_rental_price, :one_week_rental_price, :one_month_rental_price, :delivery, :fuel_type, :rental_requirements, :terms_and_conditions, :rental_company,
             :status, :manufacturer, :model, :image_url
  # belongs_to :uploader, class_name: 'User'
  # has_many :favourites
end

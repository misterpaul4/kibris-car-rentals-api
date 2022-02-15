class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.decimal :three_day_rental_price
      t.decimal :one_week_rental_price
      t.decimal :one_month_rental_price
      t.decimal :daily_rental_price
      t.string :delivery, default: 'false'
      t.string :fuel_type
      t.text :rental_requirements, default: 'N/A'
      t.text :terms_and_conditions, default: 'N/A'
      t.string :rental_company
      t.string :availability, default: 'false'
      t.string :manufacturer
      t.string :model
      t.string :image_url
      t.string :currency
      t.string :car_vin
      t.integer :model_year

      t.references :uploader

      t.timestamps
    end
  end
end

class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.decimal :three_day_rental_price, precision: 18, scale: 2
      t.decimal :one_week_rental_price, precision: 18, scale: 2
      t.decimal :one_month_rental_price, precision: 18, scale: 2
      t.boolean :delivery
      t.string :fuel_type
      t.text :rental_requirements
      t.text :terms_and_conditions
      t.string :rental_company
      t.string :status
      t.string :manufacturer
      t.string :model

      t.references :uploader

      t.timestamps
    end
  end
end

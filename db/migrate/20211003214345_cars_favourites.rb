class CarsFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :cars_favourites, id: false do |t|
      t.integer :car_id
      t.integer :favourite_id
  end

  add_index :cars_favourites, :favourite_id
  add_index :cars_favourites, :car_id
end
end
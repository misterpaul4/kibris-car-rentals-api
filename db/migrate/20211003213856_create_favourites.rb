class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.references :user
      t.references :car
    end

    add_foreign_key :favourites, :users, column: :user_id
    add_foreign_key :favourites, :cars, column: :car_id
  end
end

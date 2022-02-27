class AddIndexToFavourites < ActiveRecord::Migration[6.1]
  def change
    add_index :favourites, [:user_id, :car_id], unique: true 
  end
end

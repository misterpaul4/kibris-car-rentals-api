class CreateWaitingLists < ActiveRecord::Migration[6.1]
  def change
    create_table :waiting_lists do |t|
      t.references :applicant
      t.references :car
      t.timestamps
    end

    add_foreign_key :waiting_lists, :users, column: :applicant_id
    add_foreign_key :waiting_lists, :cars, column: :car_id

    add_index :waiting_lists, [:applicant_id, :car_id], unique: true
  end
end

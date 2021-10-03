# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_03_200910) do

  create_table "cars", force: :cascade do |t|
    t.decimal "three_day_rental_price", precision: 18, scale: 2
    t.decimal "one_week_rental_price", precision: 18, scale: 2
    t.decimal "one_month_rental_price", precision: 18, scale: 2
    t.boolean "delivery"
    t.string "fuel_type"
    t.text "rental_requirements"
    t.text "terms_and_conditions"
    t.string "rental_company"
    t.string "status"
    t.string "manufacturer"
    t.string "model"
    t.integer "uploader_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uploader_id"], name: "index_cars_on_uploader_id"
  end

end

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

ActiveRecord::Schema.define(version: 2021_10_03_213856) do

  create_table "cars", force: :cascade do |t|
    t.decimal "three_day_rental_price"
    t.decimal "one_week_rental_price"
    t.decimal "one_month_rental_price"
    t.decimal "daily_rental_price"
    t.string "delivery", default: "false"
    t.string "fuel_type"
    t.text "rental_requirements", default: "N/A"
    t.text "terms_and_conditions", default: "N/A"
    t.string "rental_company"
    t.string "availability", default: "false"
    t.string "manufacturer"
    t.string "model"
    t.string "image_url"
    t.string "currency"
    t.string "car_vin"
    t.integer "model_year"
    t.integer "uploader_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uploader_id"], name: "index_cars_on_uploader_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "car_id"
    t.index ["car_id"], name: "index_favourites_on_car_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "company_name"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "favourites", "cars"
  add_foreign_key "favourites", "users"
end

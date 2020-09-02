# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_18_125334) do

  create_table "appointments", force: :cascade do |t|
    t.string "location"
    t.string "description_of_service"
    t.integer "customer_id"
    t.integer "hrs_id"
    t.integer "superhero_id"
    t.string "start_ampm"
    t.string "end_ampm"
    t.integer "end_time"
    t.integer "start_time"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "minimum_price"
    t.integer "maximum_price"
    t.integer "minimum_intelligence"
    t.integer "minimum_strength"
    t.integer "minimum_speed"
    t.integer "minimum_durability"
    t.integer "minimum_power"
    t.integer "minimum_combat"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "superheros", force: :cascade do |t|
    t.string "name"
    t.integer "intelligence"
    t.integer "strength"
    t.integer "speed"
    t.integer "durability"
    t.integer "power"
    t.integer "combat"
    t.string "img_url"
    t.integer "price"
    t.integer "website_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "alignment"
    t.string "alter_ego"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.boolean "is_hero", default: false
    t.string "name"
    t.integer "intelligence", default: 0
    t.integer "strength", default: 0
    t.integer "speed", default: 0
    t.integer "durability", default: 0
    t.integer "power", default: 0
    t.integer "combat", default: 0
    t.string "img_url"
    t.integer "price", default: 0
    t.boolean "is_premium"
    t.string "alignment"
  end

end

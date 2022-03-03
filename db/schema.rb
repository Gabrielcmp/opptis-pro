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

ActiveRecord::Schema.define(version: 2022_01_08_165052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.string "phone"
    t.string "address"
    t.string "formatted_address"
    t.date "birth_date"
    t.text "previous_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.boolean "restaurant_experience"
    t.bigint "user_id"
    t.string "photo"
    t.index ["user_id"], name: "index_candidates_on_user_id", unique: true
  end

  create_table "candidaturas", force: :cascade do |t|
    t.bigint "candidate_id"
    t.bigint "opening_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidaturas_on_candidate_id"
    t.index ["opening_id"], name: "index_candidaturas_on_opening_id"
  end

  create_table "openings", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.date "beginning_date"
    t.date "end_date"
    t.string "pref_sex"
    t.string "pref_age"
    t.boolean "previous_experience"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.string "shift"
    t.index ["restaurant_id"], name: "index_openings_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "cousine"
    t.string "phone"
    t.string "address"
    t.string "formatted_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "user_id"
    t.string "photo"
    t.string "manager_phone"
    t.string "manager_name"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_restaurants_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "name"
    t.string "token"
    t.datetime "token_expiry"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "users"
  add_foreign_key "candidaturas", "candidates"
  add_foreign_key "candidaturas", "openings"
  add_foreign_key "openings", "restaurants"
  add_foreign_key "restaurants", "users"
end

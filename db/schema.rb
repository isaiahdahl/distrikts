# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171123184520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "score_id"
    t.bigint "question_id"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["score_id"], name: "index_answers_on_score_id"
  end

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "continent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distrikts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "score_id"
    t.bigint "city_id"
    t.float "outline", default: [], array: true
    t.float "latitude"
    t.float "longitude"
    t.index ["city_id"], name: "index_distrikts_on_city_id"
    t.index ["score_id"], name: "index_distrikts_on_score_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "distrikt_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distrikt_id"], name: "index_matches_on_distrikt_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "address"
    t.string "phone"
    t.text "description"
    t.string "img_url"
    t.bigint "distrikt_id"
    t.bigint "score_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["distrikt_id"], name: "index_places_on_distrikt_id"
    t.index ["score_id"], name: "index_places_on_score_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "description"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "rating"
    t.text "description"
    t.bigint "user_id"
    t.bigint "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_reviews_on_place_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "artsy"
    t.integer "authentic"
    t.integer "trendy"
    t.integer "foodie"
    t.integer "walkability"
    t.integer "touristy"
    t.integer "shopping"
    t.integer "nightlife"
    t.integer "outdoor"
    t.integer "luxury"
    t.integer "weather"
    t.integer "zen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "score_id"
    t.index ["score_id"], name: "index_styles_on_score_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_user_answers_on_answer_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
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
    t.bigint "style_id"
    t.bigint "score_id"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.boolean "admin", default: false, null: false
    t.boolean "scout", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["score_id"], name: "index_users_on_score_id"
    t.index ["style_id"], name: "index_users_on_style_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "scores"
  add_foreign_key "distrikts", "cities"
  add_foreign_key "distrikts", "scores"
  add_foreign_key "matches", "distrikts"
  add_foreign_key "matches", "users"
  add_foreign_key "places", "distrikts"
  add_foreign_key "places", "scores"
  add_foreign_key "reviews", "places"
  add_foreign_key "reviews", "users"
  add_foreign_key "styles", "scores"
  add_foreign_key "user_answers", "answers"
  add_foreign_key "user_answers", "users"
  add_foreign_key "users", "scores"
  add_foreign_key "users", "styles"
end

# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160211141445) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
  end

  add_index "favorites", ["recipe_id"], name: "index_favorites_on_recipe_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "food_types", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  add_index "food_types", ["slug"], name: "index_food_types_on_slug"

  create_table "kitchens", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  add_index "kitchens", ["slug"], name: "index_kitchens_on_slug"

  create_table "kitchens_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kitchen_id"
  end

  add_index "kitchens_users", ["kitchen_id"], name: "index_kitchens_users_on_kitchen_id"
  add_index "kitchens_users", ["user_id"], name: "index_kitchens_users_on_user_id"

  create_table "preferences", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  add_index "preferences", ["slug"], name: "index_preferences_on_slug"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "kitchen_id"
    t.integer  "food_type_id"
    t.integer  "preference_id"
    t.integer  "serves"
    t.integer  "time"
    t.string   "difficulty"
    t.text     "ingredients"
    t.text     "steps"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "recipes", ["food_type_id"], name: "index_recipes_on_food_type_id"
  add_index "recipes", ["kitchen_id"], name: "index_recipes_on_kitchen_id"
  add_index "recipes", ["preference_id"], name: "index_recipes_on_preference_id"
  add_index "recipes", ["slug"], name: "index_recipes_on_slug"
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "city"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug"

  create_table "users_kitchens", force: :cascade do |t|
    t.integer "user_id"
    t.integer "kitchen_id"
  end

  add_index "users_kitchens", ["kitchen_id"], name: "index_users_kitchens_on_kitchen_id"
  add_index "users_kitchens", ["user_id"], name: "index_users_kitchens_on_user_id"

end

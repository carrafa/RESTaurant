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

ActiveRecord::Schema.define(version: 20151218172335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.string   "course"
    t.text     "description"
    t.integer  "price"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.integer  "vegetarian"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "seat_id"
    t.integer  "party_id"
    t.string   "seat"
    t.string   "status"
  end

  add_index "orders", ["dish_id"], name: "index_orders_on_dish_id", using: :btree
  add_index "orders", ["party_id"], name: "index_orders_on_party_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "parties", ["user_id"], name: "index_parties_on_user_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.integer  "dish_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "recipes", ["dish_id"], name: "index_recipes_on_dish_id", using: :btree
  add_index "recipes", ["ingredient_id"], name: "index_recipes_on_ingredient_id", using: :btree

  create_table "seats", force: :cascade do |t|
    t.string   "name"
    t.string   "allergies"
    t.string   "notes"
    t.integer  "vip_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "account"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "parties"
  add_foreign_key "parties", "users"
  add_foreign_key "recipes", "dishes"
  add_foreign_key "recipes", "ingredients"
end

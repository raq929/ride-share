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

ActiveRecord::Schema.define(version: 20151212221626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.decimal  "lat",        precision: 15, scale: 12, null: false
    t.decimal  "lng",        precision: 15, scale: 12, null: false
    t.string   "address",                              null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "ride_passengers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "ride_id",    null: false
  end

  add_index "ride_passengers", ["ride_id"], name: "index_ride_passengers_on_ride_id", using: :btree
  add_index "ride_passengers", ["user_id"], name: "index_ride_passengers_on_user_id", using: :btree

  create_table "rides", force: :cascade do |t|
    t.integer  "owner_id",            null: false
    t.string   "length"
    t.string   "event"
    t.integer  "spots_left",          null: false
    t.string   "departure_date_time"
    t.integer  "destination_id",      null: false
    t.integer  "start_point_id",      null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "ride_passengers", "rides"
  add_foreign_key "ride_passengers", "users"
end

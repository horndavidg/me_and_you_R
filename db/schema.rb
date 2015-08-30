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

ActiveRecord::Schema.define(version: 20150830224337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "connections", ["coupon_id"], name: "index_connections_on_coupon_id", using: :btree
  add_index "connections", ["user_id"], name: "index_connections_on_user_id", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.text     "description"
    t.integer  "price"
    t.string   "creator_id"
    t.string   "creator_name"
    t.string   "design_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "kudos", force: :cascade do |t|
    t.text     "description"
    t.string   "picture"
    t.integer  "points"
    t.datetime "date"
    t.string   "creator_id"
    t.string   "creator_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "picture"
    t.string   "match"
    t.integer  "score",                default: 0
    t.string   "name"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "match_id"
    t.integer  "match_request"
    t.boolean  "match_pending",        default: false
    t.boolean  "is_admin",             default: false
  end

  add_foreign_key "connections", "coupons"
  add_foreign_key "connections", "users"
end

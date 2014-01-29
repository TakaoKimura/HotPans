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

ActiveRecord::Schema.define(version: 20140129160702) do

  create_table "authentications", force: true do |t|
    t.integer  "bread_store_manager_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bread_store_managers", force: true do |t|
    t.string   "manager_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "bread_store_managers", ["email"], name: "index_bread_store_managers_on_email", unique: true
  add_index "bread_store_managers", ["reset_password_token"], name: "index_bread_store_managers_on_reset_password_token", unique: true

  create_table "bread_stores", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bread_store_manager_id"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "breads", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bread_store_id"
    t.boolean  "is_yakiagari"
    t.datetime "last_start_yakiagari_time"
    t.datetime "last_end_yakiagari_time"
  end

end

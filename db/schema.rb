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

ActiveRecord::Schema.define(version: 20160505092832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string   "street"
    t.string   "area_code"
    t.string   "house_number"
    t.string   "city"
    t.string   "hotline"
    t.boolean  "active"
    t.string   "airbnb_link"
    t.boolean  "contract"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "apartments", ["user_id"], name: "index_apartments_on_user_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.datetime "check_in"
    t.datetime "check_out"
    t.date     "expected_arrival"
    t.date     "expected_departure"
    t.string   "notes"
    t.boolean  "cleaned",            default: false
    t.integer  "amount"
    t.integer  "state"
    t.integer  "apartment_id"
    t.integer  "invoice_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "bookings", ["apartment_id"], name: "index_bookings_on_apartment_id", using: :btree
  add_index "bookings", ["invoice_id"], name: "index_bookings_on_invoice_id", using: :btree

  create_table "cleaning_invoices", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "rate"
    t.integer  "tax"
    t.integer  "total"
    t.time     "cleaning_time"
    t.boolean  "paid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "month"
    t.boolean  "paid"
    t.integer  "amount"
    t.integer  "fee"
    t.integer  "extra_fee"
    t.integer  "tax"
    t.integer  "total_amount"
    t.string   "notes"
    t.integer  "user_id"
    t.integer  "cleaning_invoice_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "invoices", ["cleaning_invoice_id"], name: "index_invoices_on_cleaning_invoice_id", using: :btree
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "review_cleanings", force: :cascade do |t|
    t.integer  "rating"
    t.string   "comment"
    t.integer  "cleaning_invoice_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "review_cleanings", ["cleaning_invoice_id"], name: "index_review_cleanings_on_cleaning_invoice_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "apartments", "users"
  add_foreign_key "bookings", "apartments"
  add_foreign_key "bookings", "invoices"
  add_foreign_key "invoices", "cleaning_invoices"
  add_foreign_key "invoices", "users"
  add_foreign_key "review_cleanings", "cleaning_invoices"
end

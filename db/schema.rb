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

ActiveRecord::Schema.define(version: 20170412142801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carrier_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carriers", force: :cascade do |t|
    t.string   "name"
    t.integer  "carrier_type_id"
    t.integer  "shipment_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["carrier_type_id"], name: "index_carriers_on_carrier_type_id", using: :btree
    t.index ["shipment_type_id"], name: "index_carriers_on_shipment_type_id", using: :btree
  end

  create_table "commodities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.string   "port_code"
    t.integer  "shipment_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "country_id"
    t.index ["country_id"], name: "index_ports_on_country_id", using: :btree
    t.index ["shipment_type_id"], name: "index_ports_on_shipment_type_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "carrier_id"
    t.integer  "shipment_category_id"
    t.decimal  "cost",                 precision: 10, scale: 2
    t.integer  "unit_of_measure_id"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "seller_id"
    t.integer  "commodity_id"
    t.boolean  "us_flag",                                       default: false
    t.index ["carrier_id"], name: "index_rates_on_carrier_id", using: :btree
    t.index ["commodity_id"], name: "index_rates_on_commodity_id", using: :btree
    t.index ["destination_id"], name: "index_rates_on_destination_id", using: :btree
    t.index ["origin_id"], name: "index_rates_on_origin_id", using: :btree
    t.index ["seller_id"], name: "index_rates_on_seller_id", using: :btree
    t.index ["shipment_category_id"], name: "index_rates_on_shipment_category_id", using: :btree
    t.index ["unit_of_measure_id"], name: "index_rates_on_unit_of_measure_id", using: :btree
  end

  create_table "shipment_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "shipment_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["shipment_type_id"], name: "index_shipment_categories_on_shipment_type_id", using: :btree
  end

  create_table "shipment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unit_of_measures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "carriers", "carrier_types"
  add_foreign_key "carriers", "shipment_types"
  add_foreign_key "ports", "countries"
  add_foreign_key "ports", "shipment_types"
  add_foreign_key "rates", "carriers"
  add_foreign_key "rates", "commodities"
  add_foreign_key "rates", "shipment_categories"
  add_foreign_key "rates", "unit_of_measures"
  add_foreign_key "shipment_categories", "shipment_types"
end

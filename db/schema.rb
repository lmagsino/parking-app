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

ActiveRecord::Schema.define(version: 20220307055419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parking_lots", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "flat_rate", precision: 15, scale: 4
    t.decimal "small_parking_rate", precision: 15, scale: 4
    t.decimal "medium_parking_rate", precision: 15, scale: 4
    t.decimal "large_parking_rate", precision: 15, scale: 4
    t.integer "entry_point"
    t.decimal "whole_day_rate", precision: 15, scale: 4
    t.integer "flat_rate_duration"
  end

  create_table "parking_slots", id: :serial, force: :cascade do |t|
    t.integer "parking_lot_id"
    t.integer "parking_type", default: 0
    t.string "status", default: "available"
    t.integer "location", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_lot_id"], name: "index_parking_slots_on_parking_lot_id"
  end

  create_table "parking_transactions", id: :serial, force: :cascade do |t|
    t.integer "parking_slot_id"
    t.integer "vehicle_id"
    t.decimal "amount"
    t.boolean "returning"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_slot_id"], name: "index_parking_transactions_on_parking_slot_id"
    t.index ["vehicle_id"], name: "index_parking_transactions_on_vehicle_id"
  end

  create_table "vehicles", id: :serial, force: :cascade do |t|
    t.string "plate_number"
    t.integer "vehicle_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

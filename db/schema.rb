# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_07_09_115203) do
  create_table "assets", force: :cascade do |t|
    t.string "asset_class"
    t.integer "asset_id"
    t.string "asset_size"
    t.string "asset_type"
    t.datetime "created_at", null: false
    t.integer "park_id", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_assets_on_asset_id", unique: true
    t.index ["park_id"], name: "index_assets_on_park_id"
  end

  create_table "districts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "district_name"
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "district_id", null: false
    t.string "location_description"
    t.string "park_category"
    t.integer "park_id"
    t.string "park_name"
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_parks_on_district_id"
    t.index ["park_id"], name: "index_parks_on_park_id", unique: true
  end

  add_foreign_key "assets", "parks"
  add_foreign_key "parks", "districts"
end

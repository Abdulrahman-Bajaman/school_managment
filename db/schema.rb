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

ActiveRecord::Schema[8.0].define(version: 2025_07_12_093407) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "schools", force: :cascade do |t|
    t.string "name_en", limit: 100, null: false
    t.string "name_ar", limit: 100, null: false
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["name_ar"], name: "index_schools_on_name_ar", unique: true
    t.index ["name_en"], name: "index_schools_on_name_en", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name", null: false
    t.integer "status", null: false
    t.bigint "school_id", null: false
    t.date "date_of_birth", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  add_foreign_key "students", "schools", on_delete: :cascade
end

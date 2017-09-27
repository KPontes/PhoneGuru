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

ActiveRecord::Schema.define(version: 20170922212029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "manages", force: :cascade do |t|
    t.integer "manager_id"
    t.integer "subordinate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id", "subordinate_id"], name: "index_manages_on_manager_id_and_subordinate_id", unique: true
  end

  create_table "numbers", force: :cascade do |t|
    t.string "number"
    t.string "cn"
    t.string "prefix"
    t.string "mcdu"
    t.string "countrycode"
    t.text "validation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "numbers_ruletypes", force: :cascade do |t|
    t.bigint "number_id", null: false
    t.bigint "ruletype_id", null: false
  end

  create_table "ruletypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "manages", "numbers", column: "manager_id"
  add_foreign_key "manages", "numbers", column: "subordinate_id"
  add_foreign_key "numbers_ruletypes", "numbers"
  add_foreign_key "numbers_ruletypes", "ruletypes"
end

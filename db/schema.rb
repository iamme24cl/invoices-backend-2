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

ActiveRecord::Schema.define(version: 2021_05_12_215509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "description"
    t.float "price"
    t.integer "quantity"
    t.datetime "payment_due"
    t.integer "payment_terms"
    t.string "status"
    t.string "client_name"
    t.string "client_email"
    t.string "client_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "total", default: 0.0
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_invoices_on_account_id"
  end

  add_foreign_key "invoices", "accounts"
end

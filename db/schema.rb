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

ActiveRecord::Schema.define(version: 2024_05_02_083053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255, null: false
    t.text "content", null: false
    t.boolean "is_active", default: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "display_from"
    t.datetime "display_until"
  end

  create_table "cities", force: :cascade do |t|
    t.text "name", null: false
    t.integer "prefecture_id", null: false
  end

  create_table "contact_form_entries", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "mail", limit: 255, null: false
    t.text "message", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "example", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gymrequests", primary_key: "request_id", id: :serial, force: :cascade do |t|
    t.text "name", null: false
    t.integer "city_id", null: false
    t.text "url", null: false
    t.text "status", default: "Pending", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "gyms", force: :cascade do |t|
    t.text "name", null: false
    t.integer "city_id", null: false
    t.text "url"
    t.datetime "update_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.text "message"
    t.string "status"
    t.datetime "notification_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_notifications_on_product_id"
  end

  create_table "prefectures", id: :integer, default: nil, force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.string "sku"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule_urls", force: :cascade do |t|
    t.text "schedule_url", null: false
    t.integer "gym_id", null: false
    t.datetime "update_at", default: -> { "CURRENT_DATE" }, null: false
    t.text "description"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "transaction_type"
    t.integer "quantity"
    t.datetime "transaction_date"
    t.string "operator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_transactions_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "inventories", "products"
  add_foreign_key "notifications", "products"
  add_foreign_key "transactions", "products"
end

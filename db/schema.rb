# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_17_083946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "restaurant", null: false
    t.string "phone"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.integer "delivery_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "email"
    t.text "about"
    t.text "faqs"
    t.text "privacy"
    t.text "terms"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "rider_user_id", null: false
    t.boolean "is_collected", default: false
    t.boolean "is_delivered", default: false
    t.datetime "time_collected"
    t.datetime "time_delivered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_deliveries_on_order_id"
    t.index ["rider_user_id", "order_id"], name: "index_deliveries_on_rider_user_id_and_order_id", unique: true
    t.index ["rider_user_id"], name: "index_deliveries_on_rider_user_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.boolean "is_active"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "section_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
    t.index ["section_id"], name: "index_menu_items_on_section_id"
  end

  create_table "menu_options", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.bigint "menu_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_single", default: false
    t.index ["menu_item_id"], name: "index_menu_options_on_menu_item_id"
  end

  create_table "order_item_options", force: :cascade do |t|
    t.bigint "menu_option_id", null: false
    t.bigint "order_item_id", null: false
    t.integer "quantity"
    t.integer "unit_price"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_option_id"], name: "index_order_item_options_on_menu_option_id"
    t.index ["order_item_id"], name: "index_order_item_options_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "menu_item_id", null: false
    t.integer "quantity"
    t.text "note"
    t.integer "unit_price"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cart_id"
    t.boolean "has_side"
    t.index ["cart_id"], name: "index_order_items_on_cart_id"
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "checkout_session_id"
    t.bigint "user_id", null: false
    t.bigint "cart_id", null: false
    t.integer "order_price"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_assigned", default: false
    t.string "state", default: "pending"
    t.integer "delivery_price"
    t.boolean "open", default: true
    t.datetime "order_time"
    t.bigint "restaurant_id"
    t.text "delivery_instructions"
    t.index ["cart_id", "user_id"], name: "index_orders_on_cart_id_and_user_id", unique: true
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "imagekey"
    t.string "website"
    t.bigint "admin_user_id"
    t.boolean "is_open", default: true
    t.string "street_address"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.string "country", default: "United Kingdom"
    t.time "monday_opens_at"
    t.time "tuesday_opens_at"
    t.time "wednesday_opens_at"
    t.time "thursday_opens_at"
    t.time "friday_opens_at"
    t.time "saturday_opens_at"
    t.time "sunday_opens_at"
    t.time "monday_closes_at"
    t.time "tuesday_closes_at"
    t.time "wednesday_closes_at"
    t.time "thursday_closes_at"
    t.time "friday_closes_at"
    t.time "saturday_closes_at"
    t.time "sunday_closes_at"
    t.string "stripe_account_id"
    t.boolean "is_onboarded", default: false
    t.boolean "is_published", default: false
    t.integer "min_spend"
    t.index ["admin_user_id"], name: "index_restaurants_on_admin_user_id"
  end

  create_table "rider_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_available", default: false
    t.boolean "is_active", default: true
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "rider", null: false
    t.index ["email"], name: "index_rider_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_rider_users_on_reset_password_token", unique: true
  end

  create_table "rider_work_areas", force: :cascade do |t|
    t.bigint "work_area_id", null: false
    t.bigint "rider_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rider_user_id", "work_area_id"], name: "index_rider_work_areas_on_rider_user_id_and_work_area_id", unique: true
    t.index ["rider_user_id"], name: "index_rider_work_areas_on_rider_user_id"
    t.index ["work_area_id"], name: "index_rider_work_areas_on_work_area_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
    t.bigint "restaurant_id"
    t.index ["order", "restaurant_id"], name: "index_sections_on_order_and_restaurant_id", unique: true
    t.index ["restaurant_id"], name: "index_sections_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "street_address"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.string "country", default: "United Kingdom"
    t.string "flat"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_areas", force: :cascade do |t|
    t.string "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deliveries", "orders"
  add_foreign_key "deliveries", "rider_users"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "menu_options", "menu_items"
  add_foreign_key "order_item_options", "menu_options"
  add_foreign_key "order_item_options", "order_items"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurants", "admin_users"
  add_foreign_key "rider_work_areas", "rider_users"
  add_foreign_key "rider_work_areas", "work_areas"
  add_foreign_key "sections", "restaurants"
end

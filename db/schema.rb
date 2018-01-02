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

ActiveRecord::Schema.define(version: 20180102071409) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "creator_id",             limit: 4
    t.integer  "updater_id",             limit: 4
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "areas", force: :cascade do |t|
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.string   "name",       limit: 255, null: false
    t.string   "pincode",    limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "balance_sheets", force: :cascade do |t|
    t.integer  "creator_id",      limit: 4
    t.integer  "updater_id",      limit: 4
    t.datetime "account_date",               null: false
    t.float    "open_balance",    limit: 24, null: false
    t.float    "income_balance",  limit: 24
    t.float    "expense_balance", limit: 24
    t.float    "close_balance",   limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name",               limit: 100,                   null: false
    t.string   "slug",               limit: 100
    t.string   "custom_domain",      limit: 100
    t.string   "custom_domain_type", limit: 100
    t.string   "redirect_domain",    limit: 100
    t.string   "prefix",             limit: 10,                    null: false
    t.text     "description",        limit: 65535
    t.string   "phone_number",       limit: 50
    t.string   "email",              limit: 50
    t.string   "site_description",   limit: 255
    t.string   "site_keywords",      limit: 255
    t.string   "site_title",         limit: 255
    t.string   "country_code",       limit: 255
    t.string   "string",             limit: 255
    t.string   "currency_code",      limit: 255
    t.string   "currency_sign",      limit: 255
    t.boolean  "is_active",                        default: true,  null: false
    t.boolean  "is_deleted",                       default: false, null: false
    t.boolean  "is_chain",                         default: true,  null: false
    t.integer  "creator_id",         limit: 4
    t.integer  "updater_id",         limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "logo_file_name",     limit: 255
    t.string   "logo_content_type",  limit: 255
    t.integer  "logo_file_size",     limit: 4
    t.datetime "logo_updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name", unique: true, using: :btree
  add_index "brands", ["prefix"], name: "index_brands_on_prefix", unique: true, using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.string   "name",       limit: 255, null: false
    t.integer  "state_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customer_accounts", force: :cascade do |t|
    t.integer  "customer_id",        limit: 4,                  null: false
    t.integer  "creator_id",         limit: 4
    t.integer  "updater_id",         limit: 4
    t.float    "debit_amount",       limit: 24,                 null: false
    t.string   "debit_bill_number",  limit: 255
    t.datetime "debit_bill_date",                               null: false
    t.float    "credit_amount",      limit: 24
    t.string   "credit_bill_number", limit: 255
    t.datetime "credit_bill_date"
    t.integer  "credit_by_id",       limit: 4
    t.boolean  "verified",                       default: true, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "brand_id",       limit: 4,     null: false
    t.integer  "creator_id",     limit: 4
    t.integer  "updater_id",     limit: 4
    t.string   "company_name",   limit: 255,   null: false
    t.string   "person_name",    limit: 255
    t.string   "mobile_number1", limit: 255
    t.string   "mobile_number2", limit: 255
    t.string   "mobile_number3", limit: 255
    t.text     "address",        limit: 65535
    t.integer  "city_id",        limit: 4
    t.integer  "area_id",        limit: 4
    t.string   "gst_number",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "brand_id",   limit: 4,                     null: false
    t.integer  "sender_id",  limit: 4,                     null: false
    t.integer  "subject",    limit: 4,     default: 0,     null: false
    t.text     "message",    limit: 65535
    t.boolean  "is_active",                default: true,  null: false
    t.boolean  "is_deleted",               default: false, null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "income_expenses", force: :cascade do |t|
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
    t.integer  "amount_type", limit: 4,     default: 0, null: false
    t.datetime "amount_date",                           null: false
    t.float    "amount",      limit: 24,                null: false
    t.integer  "customer_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "provider_id", limit: 4
    t.text     "detail",      limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "creator_id",      limit: 4
    t.integer  "updater_id",      limit: 4
    t.datetime "order_date",                                 null: false
    t.integer  "customer_id",     limit: 4,                  null: false
    t.integer  "product_id",      limit: 4,                  null: false
    t.integer  "total_bags",      limit: 4
    t.float    "price_per_kg",    limit: 24
    t.float    "total_kg",        limit: 24
    t.datetime "dispatched_date"
    t.boolean  "dispatched",                 default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "product_purchases", force: :cascade do |t|
    t.integer  "creator_id",    limit: 4
    t.integer  "updater_id",    limit: 4
    t.integer  "product_id",    limit: 4,  null: false
    t.integer  "provider_id",   limit: 4,  null: false
    t.datetime "purchase_date",            null: false
    t.integer  "total_bag",     limit: 4,  null: false
    t.float    "kg_per_bag",    limit: 24
    t.float    "amount_per_kg", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.string   "name",         limit: 255,             null: false
    t.integer  "product_type", limit: 4,   default: 0, null: false
    t.integer  "kilogram",     limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "providers", force: :cascade do |t|
    t.integer  "creator_id",     limit: 4
    t.integer  "updater_id",     limit: 4
    t.string   "name",           limit: 255,   null: false
    t.text     "address",        limit: 65535
    t.integer  "city_id",        limit: 4
    t.integer  "area_id",        limit: 4
    t.string   "mobile_number1", limit: 255
    t.string   "mobile_number2", limit: 255
    t.string   "mobile_number3", limit: 255
    t.string   "gst_number",     limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "resource_specs", force: :cascade do |t|
    t.string   "name",       limit: 100,                 null: false
    t.boolean  "limited",                default: false, null: false
    t.boolean  "is_active",              default: true,  null: false
    t.boolean  "is_deleted",             default: false, null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "resource_specs", ["name"], name: "index_resource_specs_on_name", unique: true, using: :btree

  create_table "resource_types", force: :cascade do |t|
    t.string   "name",       limit: 100,                 null: false
    t.boolean  "is_active",              default: true,  null: false
    t.boolean  "is_deleted",             default: false, null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "resource_types", ["name"], name: "index_resource_types_on_name", unique: true, using: :btree

  create_table "resources", force: :cascade do |t|
    t.integer  "resource_holder_id",    limit: 4,                   null: false
    t.string   "resource_holder_type",  limit: 255,                 null: false
    t.integer  "resource_spec_id",      limit: 4,                   null: false
    t.integer  "resource_type_id",      limit: 4,                   null: false
    t.string   "media_attachment_name", limit: 255
    t.boolean  "limited",                           default: false, null: false
    t.boolean  "is_active",                         default: true,  null: false
    t.boolean  "is_deleted",                        default: false, null: false
    t.integer  "creator_id",            limit: 4
    t.integer  "updater_id",            limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "media_file_name",       limit: 255
    t.string   "media_content_type",    limit: 255
    t.integer  "media_file_size",       limit: 4
    t.datetime "media_updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "brand_id",   limit: 4,                 null: false
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.boolean  "is_active",            default: true,  null: false
    t.boolean  "is_deleted",           default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "states", force: :cascade do |t|
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "creator_id",  limit: 4
    t.integer  "updater_id",  limit: 4
    t.integer  "product_id",  limit: 4, null: false
    t.datetime "stock_date",            null: false
    t.integer  "open_stock",  limit: 4
    t.integer  "stock_in",    limit: 4
    t.integer  "stock_out",   limit: 4
    t.integer  "close_stock", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "brand_id",               limit: 4,                   null: false
    t.integer  "role",                   limit: 4,   default: 0,     null: false
    t.integer  "creator_id",             limit: 4
    t.integer  "updater_id",             limit: 4
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "first_name",             limit: 50,                  null: false
    t.string   "last_name",              limit: 50,                  null: false
    t.string   "token",                  limit: 255
    t.boolean  "registered",                         default: false, null: false
    t.boolean  "intermediate",                       default: false, null: false
    t.boolean  "is_active",                          default: true,  null: false
    t.boolean  "is_deleted",                         default: false, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

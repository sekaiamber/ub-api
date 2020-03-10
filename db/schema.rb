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

ActiveRecord::Schema.define(version: 20181228084208) do

  create_table "account_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "user_id"
    t.integer "account_id"
    t.integer "reason"
    t.decimal "balance", precision: 36, scale: 18, default: "0.0"
    t.decimal "locked", precision: 36, scale: 18, default: "0.0"
    t.decimal "fee", precision: 36, scale: 18, default: "0.0"
    t.decimal "amount", precision: 36, scale: 18
    t.integer "modifiable_id"
    t.string "modifiable_type"
    t.integer "fun"
    t.datetime "created_at"
    t.index ["account_id", "reason"], name: "index_account_versions_on_account_id_and_reason"
    t.index ["account_id"], name: "index_account_versions_on_account_id"
    t.index ["modifiable_type", "modifiable_id"], name: "index_account_versions_on_modifiable_type_and_modifiable_id"
    t.index ["user_id", "reason"], name: "index_account_versions_on_user_id_and_reason"
    t.index ["user_id"], name: "index_account_versions_on_user_id"
  end

  create_table "accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "user_id"
    t.decimal "balance", precision: 36, scale: 18, default: "0.0"
    t.decimal "locked", precision: 36, scale: 18, default: "0.0"
    t.decimal "in", precision: 36, scale: 18
    t.decimal "out", precision: 36, scale: 18
    t.integer "default_withdraw_fund_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_type", default: 0
    t.index ["account_type"], name: "index_accounts_on_account_type"
    t.index ["user_id", "account_type"], name: "index_accounts_on_user_id_and_account_type", unique: true
  end

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "user_id"
    t.integer "activity_type"
    t.decimal "amount", precision: 36, scale: 18
    t.integer "order_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_activities_on_order_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "banners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "image"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.decimal "amount", precision: 36, scale: 18
    t.decimal "fee", precision: 36, scale: 18
    t.string "fund_uid"
    t.string "fund_extra"
    t.string "txid"
    t.integer "state", default: 0
    t.integer "confirmations"
    t.datetime "done_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_deposits_on_account_id"
    t.index ["fund_uid"], name: "index_deposits_on_fund_uid"
    t.index ["state"], name: "index_deposits_on_state"
    t.index ["user_id"], name: "index_deposits_on_user_id"
  end

  create_table "id_documents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "name"
    t.string "id_document_number"
    t.integer "user_id"
    t.string "idcard_person_info"
    t.string "idcard_cover"
    t.string "person_holding_idcard"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_apps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "name"
    t.string "version", limit: 50
    t.string "secret", limit: 32
    t.string "app_key", limit: 32
    t.date "deprecated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_key"], name: "index_mobile_apps_on_app_key"
    t.index ["name", "version"], name: "index_mobile_apps_on_name_and_version", unique: true
  end

  create_table "notices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "unlock_at"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "account_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.decimal "price", precision: 36, scale: 18
    t.decimal "reward", precision: 36, scale: 18
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text "allow_hours"
  end

  create_table "rails_admin_settings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.boolean "enabled", default: true
    t.string "kind", default: "string", null: false
    t.string "ns", default: "main"
    t.string "key", null: false
    t.text "raw"
    t.string "label"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_rails_admin_settings_on_key"
    t.index ["ns", "key"], name: "index_rails_admin_settings_on_ns_and_key", unique: true
  end

  create_table "staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.integer "from_id"
    t.integer "to_id"
    t.decimal "amount", precision: 36, scale: 18
    t.decimal "fee", precision: 36, scale: 18
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "index_transfers_on_from_id"
    t.index ["to_id"], name: "index_transfers_on_to_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "nickname"
    t.string "password_digest"
    t.string "invite_code"
    t.string "phone_number"
    t.integer "vip_level", default: 0
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "depth", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_token"
    t.index ["invite_code"], name: "index_users_on_invite_code", unique: true
    t.index ["lft"], name: "index_users_on_lft"
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["parent_id"], name: "index_users_on_parent_id"
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["rgt"], name: "index_users_on_rgt"
  end

  create_table "withdraws", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci" do |t|
    t.string "sn"
    t.integer "account_id"
    t.integer "user_id"
    t.decimal "amount", precision: 36, scale: 18
    t.decimal "fee", precision: 36, scale: 18
    t.string "fund_uid"
    t.datetime "done_at"
    t.string "txid"
    t.integer "state"
    t.decimal "sum", precision: 36, scale: 18
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

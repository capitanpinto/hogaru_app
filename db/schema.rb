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

ActiveRecord::Schema.define(version: 2019_11_15_043049) do

  create_table "orders", force: :cascade do |t|
    t.boolean "paid"
    t.float "price"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "serv_id"
    t.integer "pedido_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_relationships_on_pedido_id"
    t.index ["serv_id", "pedido_id"], name: "index_relationships_on_serv_id_and_pedido_id", unique: true
    t.index ["serv_id"], name: "index_relationships_on_serv_id"
  end

  create_table "services", force: :cascade do |t|
    t.float "price"
    t.integer "user_id", null: false
    t.boolean "paid"
    t.date "meeting_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "maid_id"
    t.string "address"
    t.integer "order_id"
    t.index ["user_id", "maid_id"], name: "index_services_on_user_id_and_maid_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "maid"
    t.date "retire_date"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "users"
  add_foreign_key "services", "users"
end

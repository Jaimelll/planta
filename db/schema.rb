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

ActiveRecord::Schema.define(version: 2019_08_01_142625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "periodo", default: 1, null: false
    t.integer "categoria", default: 3, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "details", force: :cascade do |t|
    t.string "codigo"
    t.string "descripcion"
    t.float "cantidad"
    t.integer "orden1"
    t.integer "orden2"
    t.bigint "element_id"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_details_on_admin_user_id"
    t.index ["element_id"], name: "index_details_on_element_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "orden1"
    t.integer "orden2"
    t.integer "fac1"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_elements_on_admin_user_id"
  end

  create_table "formulas", force: :cascade do |t|
    t.string "codigo"
    t.bigint "product_id"
    t.string "obs"
    t.float "cantidad"
    t.float "factor"
    t.integer "unidad"
    t.integer "seccion"
    t.float "pedido"
    t.integer "for1"
    t.integer "for2"
    t.float "for3"
    t.float "for4"
    t.string "for5"
    t.string "for6"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_formulas_on_admin_user_id"
    t.index ["product_id"], name: "index_formulas_on_product_id"
  end

  create_table "headers", force: :cascade do |t|
    t.date "fecha1"
    t.date "dateh01"
    t.date "dateh02"
    t.date "dateh03"
    t.integer "inth01"
    t.integer "inth02"
    t.integer "inth03"
    t.integer "inth04"
    t.integer "inth05"
    t.integer "inth06"
    t.integer "inth07"
    t.integer "inth08"
    t.string "strih01"
    t.string "strih02"
    t.string "strih03"
    t.string "strih04"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_headers_on_admin_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "descripcion"
    t.float "precio"
    t.float "costo"
    t.integer "unidad"
    t.integer "seccion"
    t.float "inventario"
    t.float "pedido"
    t.integer "clase"
    t.integer "familia"
    t.integer "nivel"
    t.date "fecha"
    t.integer "orden"
    t.integer "activo"
    t.bigint "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_products_on_admin_user_id"
  end

  add_foreign_key "details", "admin_users"
  add_foreign_key "details", "elements"
  add_foreign_key "elements", "admin_users"
  add_foreign_key "formulas", "admin_users"
  add_foreign_key "formulas", "products"
  add_foreign_key "headers", "admin_users"
  add_foreign_key "products", "admin_users"
end

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

ActiveRecord::Schema.define(version: 2022_09_22_025711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.bigint "congressmen_id", null: false
    t.float "vlrLiquido", null: false
    t.string "txtFornecedor"
    t.string "urlDocumento"
    t.datetime "datEmissao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["congressmen_id"], name: "index_budgets_on_congressmen_id"
  end

  create_table "congressmen", force: :cascade do |t|
    t.string "name", null: false
    t.integer "registration_code", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "budgets", "congressmen", column: "congressmen_id"
end

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

ActiveRecord::Schema.define(version: 2022_09_22_142238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.float "vlrLiquido", null: false
    t.string "txtFornecedor"
    t.string "urlDocumento"
    t.datetime "datEmissao"
    t.bigint "parliamentarian_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parliamentarian_id"], name: "index_budgets_on_parliamentarian_id"
  end

  create_table "parliamentarians", force: :cascade do |t|
    t.string "txNomeParlamentar", null: false
    t.integer "ideCadastro", null: false
    t.string "sgUF", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "budgets", "parliamentarians"
end

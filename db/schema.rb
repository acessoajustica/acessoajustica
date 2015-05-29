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

ActiveRecord::Schema.define(version: 20150529174014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calouros", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caso_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "casos", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "cliente_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "estagiario_id"
  end

  add_index "casos", ["cliente_id"], name: "index_casos_on_cliente_id", using: :btree
  add_index "casos", ["estagiario_id"], name: "index_casos_on_estagiario_id", using: :btree

  create_table "clientes", force: :cascade do |t|
    t.integer  "filhos_quantidade"
    t.string   "profissao_nome"
    t.string   "familia_quantidade"
    t.decimal  "familia_renda"
    t.integer  "contribuintes_quantidade"
    t.integer  "estado_civil_id"
    t.integer  "moradia_type_id"
    t.integer  "profissao_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "clientes", ["estado_civil_id"], name: "index_clientes_on_estado_civil_id", using: :btree
  add_index "clientes", ["moradia_type_id"], name: "index_clientes_on_moradia_type_id", using: :btree
  add_index "clientes", ["profissao_type_id"], name: "index_clientes_on_profissao_type_id", using: :btree

  create_table "estado_civils", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "estagiarios", force: :cascade do |t|
    t.string   "especialidade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "membros", force: :cascade do |t|
    t.date     "ano_faculdade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "actable_id"
    t.string   "actable_type"
  end

  create_table "moradia_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "nome_da_mae"
    t.string   "rg"
    t.string   "cor"
    t.string   "identidade_de_genero"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "actable_id"
    t.string   "actable_type"
  end

  create_table "profissao_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "relatos", force: :cascade do |t|
    t.string   "description"
    t.integer  "caso_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relatos", ["caso_id"], name: "index_relatos_on_caso_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "membro_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vareiros", force: :cascade do |t|
    t.string   "forum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "casos", "clientes"
  add_foreign_key "casos", "estagiarios"
  add_foreign_key "clientes", "estado_civils"
  add_foreign_key "clientes", "moradia_types"
  add_foreign_key "clientes", "profissao_types"
  add_foreign_key "relatos", "casos"
end

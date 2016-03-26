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

ActiveRecord::Schema.define(version: 20160326003247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atendimento_resultados", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "atendimento_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "atendimentos", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "cliente_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "estagiario_id"
    t.integer  "atendimento_type_id"
    t.integer  "atendimento_resultado_id"
    t.string   "initial_description"
    t.string   "detailed_description"
    t.string   "justification"
  end

  add_index "atendimentos", ["atendimento_resultado_id"], name: "index_atendimentos_on_atendimento_resultado_id", using: :btree
  add_index "atendimentos", ["atendimento_type_id"], name: "index_atendimentos_on_atendimento_type_id", using: :btree
  add_index "atendimentos", ["cliente_id"], name: "index_atendimentos_on_cliente_id", using: :btree
  add_index "atendimentos", ["estagiario_id"], name: "index_atendimentos_on_estagiario_id", using: :btree

  create_table "calouros", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "especialidades", force: :cascade do |t|
    t.string "description"
  end

  create_table "especialidades_atendimento_types", id: false, force: :cascade do |t|
    t.integer "especialidade_id"
    t.integer "atendimento_type_id"
  end

  add_index "especialidades_atendimento_types", ["atendimento_type_id"], name: "index_especialidades_atendimento_types_on_atendimento_type_id", using: :btree
  add_index "especialidades_atendimento_types", ["especialidade_id"], name: "index_especialidades_atendimento_types_on_especialidade_id", using: :btree

  create_table "estado_civils", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "estagiarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estagiarios_especialidades", id: false, force: :cascade do |t|
    t.integer "estagiario_id"
    t.integer "especialidade_id"
  end

  add_index "estagiarios_especialidades", ["especialidade_id"], name: "index_estagiarios_especialidades_on_especialidade_id", using: :btree
  add_index "estagiarios_especialidades", ["estagiario_id"], name: "index_estagiarios_especialidades_on_estagiario_id", using: :btree

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

  add_index "moradia_types", ["description"], name: "index_moradia_types_on_description", unique: true, using: :btree

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

  add_foreign_key "atendimentos", "atendimento_resultados"
  add_foreign_key "atendimentos", "atendimento_types"
  add_foreign_key "atendimentos", "clientes"
  add_foreign_key "atendimentos", "estagiarios"
  add_foreign_key "clientes", "estado_civils"
  add_foreign_key "clientes", "moradia_types"
  add_foreign_key "clientes", "profissao_types"
end

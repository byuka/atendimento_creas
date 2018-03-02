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

ActiveRecord::Schema.define(version: 20180301152514) do

  create_table "assistances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.boolean "ativo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "service_id", null: false
    t.bigint "technician_id", null: false
    t.bigint "person_id", null: false
    t.bigint "assistance_id"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assistance_id"], name: "index_attendances_on_assistance_id"
    t.index ["person_id"], name: "index_attendances_on_person_id"
    t.index ["service_id"], name: "index_attendances_on_service_id"
    t.index ["technician_id"], name: "index_attendances_on_technician_id"
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome", null: false
    t.date "data_nascimento"
    t.string "cpf"
    t.string "rg"
    t.string "endereco_logradouro"
    t.string "endereco_numero"
    t.string "endereco_bairro"
    t.string "naturalidade"
    t.string "nome_progenitor"
    t.string "nome_progenitora"
    t.string "etinia"
    t.string "escolaridade"
    t.text "obs"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome", null: false
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ativo", default: true
  end

  create_table "technicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "nome", null: false
    t.date "data_nascimento"
    t.integer "matricula"
    t.string "cargo"
    t.boolean "ativo", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendances", "assistances"
  add_foreign_key "attendances", "people"
  add_foreign_key "attendances", "services"
  add_foreign_key "attendances", "technicians"
end

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

ActiveRecord::Schema.define(version: 20161125184041) do

  create_table "carreras", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "espejos", force: :cascade do |t|
    t.integer  "mirror_id"
    t.integer  "reflector_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "espejos", ["mirror_id"], name: "index_espejos_on_mirror_id"
  add_index "espejos", ["reflector_id"], name: "index_espejos_on_reflector_id"

  create_table "mallas", force: :cascade do |t|
    t.string   "plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "carrera_id"
  end

  add_index "mallas", ["plan", "carrera_id"], name: "index_mallas_on_plan_and_carrera_id", unique: true

  create_table "modulos", force: :cascade do |t|
    t.text     "nombre"
    t.string   "codigo"
    t.integer  "creditos"
    t.integer  "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "malla_id"
  end

  create_table "presupuestos", force: :cascade do |t|
    t.integer  "monto"
    t.integer  "semestre"
    t.integer  "anio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profesor_dicta_seccions", force: :cascade do |t|
    t.integer  "anio"
    t.integer  "semestre"
    t.integer  "profesor_id"
    t.integer  "seccion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profesor_dicta_seccions", ["profesor_id"], name: "index_profesor_dicta_seccions_on_profesor_id"
  add_index "profesor_dicta_seccions", ["seccion_id"], name: "index_profesor_dicta_seccions_on_seccion_id"

  create_table "profesors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "rut"
    t.string   "telefono"
    t.string   "tipo"
    t.integer  "precioHora"
    t.float    "numHrs"
    t.float    "hrsDocencia"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seccions", force: :cascade do |t|
    t.integer  "modulo_id"
    t.string   "nombre"
    t.integer  "hrsLab"
    t.integer  "hrsCatedra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seccions", ["modulo_id"], name: "index_seccions_on_modulo_id"

  create_table "solicitar_seccions", force: :cascade do |t|
    t.string   "estado"
    t.integer  "anio"
    t.integer  "semestre"
    t.integer  "usuario_id"
    t.integer  "seccion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "solicitar_seccions", ["seccion_id"], name: "index_solicitar_seccions_on_seccion_id"
  add_index "solicitar_seccions", ["usuario_id"], name: "index_solicitar_seccions_on_usuario_id"

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "rut"
    t.string   "tipo"
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "activo",                 default: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130909183911) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "adherentes", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "apellidos"
    t.string   "nombres"
    t.string   "ci"
    t.string   "cc"
    t.date     "fecha_nacimiento"
    t.string   "domicilio"
    t.string   "telefono"
    t.string   "domicilio_cobro"
    t.string   "telefono_cobro"
    t.string   "email"
    t.string   "coordinadora"
    t.date     "fecha_solicitud"
    t.float    "cotizacion"
    t.integer  "localidad_id"
    t.integer  "comite_id"
    t.integer  "calle_principal_id"
    t.integer  "primera_lateral_id"
    t.integer  "segunda_lateral_id"
    t.boolean  "habilitado",               :default => true
    t.integer  "calle_principal_cobro_id"
    t.integer  "primera_lateral_cobro_id"
    t.integer  "segunda_lateral_cobro_id"
  end

  add_index "adherentes", ["apellidos"], :name => "index_adherentes_on_apellidos"
  add_index "adherentes", ["cc"], :name => "index_adherentes_on_cc", :unique => true
  add_index "adherentes", ["ci"], :name => "index_adherentes_on_ci", :unique => true
  add_index "adherentes", ["email"], :name => "index_adherentes_on_email"
  add_index "adherentes", ["nombres"], :name => "index_adherentes_on_nombres"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "calles", :force => true do |t|
    t.string   "nombre"
    t.integer  "localidad_id"
    t.boolean  "habilitado",   :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "comites", :force => true do |t|
    t.string   "nombre"
    t.boolean  "habilitado",   :default => true
    t.integer  "localidad_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "cuenta", :force => true do |t|
    t.integer  "mes"
    t.integer  "anio"
    t.float    "importe"
    t.boolean  "pagado",       :default => false
    t.integer  "adherente_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "cuenta", ["anio", "mes", "adherente_id"], :name => "index_cuenta_on_anio_and_mes_and_adherente_id", :unique => true

  create_table "localidads", :force => true do |t|
    t.string   "nombre"
    t.boolean  "habilitado", :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

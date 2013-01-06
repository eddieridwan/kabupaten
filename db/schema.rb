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

ActiveRecord::Schema.define(:version => 20130106130249) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "skype_handle"
    t.string   "twitter_handle"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "dt2_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kabupaten_translations", :force => true do |t|
    t.integer  "kabupaten_id"
    t.string   "locale"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "kabupaten_translations", ["kabupaten_id"], :name => "index_kabupaten_translations_on_kabupaten_id"
  add_index "kabupaten_translations", ["locale"], :name => "index_kabupaten_translations_on_locale"

  create_table "kabupatens", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "capital"
    t.integer  "area"
    t.integer  "population"
    t.integer  "province_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "health_indicators"
  end

  create_table "project_contact_mappings", :force => true do |t|
    t.integer "project_id"
    t.integer "contact_id"
    t.string  "contact_type"
  end

  create_table "project_kabupaten_mappings", :force => true do |t|
    t.integer "project_id"
    t.integer "kabupaten_id"
    t.string  "location_type"
  end

  create_table "project_sector_mappings", :force => true do |t|
    t.integer "project_id"
    t.integer "sector_id"
    t.string  "sector_type"
  end

  create_table "project_translations", :force => true do |t|
    t.integer  "project_id"
    t.string   "locale"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "project_translations", ["locale"], :name => "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], :name => "index_project_translations_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "province_translations", :force => true do |t|
    t.integer  "province_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "province_translations", ["locale"], :name => "index_province_translations_on_locale"
  add_index "province_translations", ["province_id"], :name => "index_province_translations_on_province_id"

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "area"
    t.integer  "population"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sector_translations", :force => true do |t|
    t.integer  "sector_id"
    t.string   "locale"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sector_translations", ["locale"], :name => "index_sector_translations_on_locale"
  add_index "sector_translations", ["sector_id"], :name => "index_sector_translations_on_sector_id"

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tolk_locales", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_locales", ["name"], :name => "index_tolk_locales_on_name", :unique => true

  create_table "tolk_phrases", :force => true do |t|
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", :force => true do |t|
    t.integer  "phrase_id"
    t.integer  "locale_id"
    t.text     "text"
    t.text     "previous_text"
    t.boolean  "primary_updated", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_translations", ["phrase_id", "locale_id"], :name => "index_tolk_translations_on_phrase_id_and_locale_id", :unique => true

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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end

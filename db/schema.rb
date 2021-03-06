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

ActiveRecord::Schema.define(version: 20151205004059) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icons"
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "description",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "city",          null: false
    t.string   "state",         null: false
    t.string   "country",       null: false
    t.string   "learning_mode"
  end

  create_table "programs", force: :cascade do |t|
    t.string  "title",          null: false
    t.string  "description"
    t.string  "level"
    t.integer "institution_id"
    t.string  "status"
    t.string  "certification"
    t.string  "duration"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "url"
  end

  create_table "redactor_assets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "institution_id", null: false
    t.integer  "user_id",        null: false
    t.string   "title",          null: false
    t.integer  "rating",         null: false
    t.string   "content",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "program_id",     null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.integer  "points",      null: false
    t.integer  "program_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  create_table "user_program_attendancies", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "program_id", null: false
    t.date    "start_date", null: false
    t.date    "end_date",   null: false
    t.string  "location"
    t.string  "url"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "location"
    t.string   "profile_photo"
    t.string   "description"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "webinar_id"
    t.integer  "qb_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  create_table "webinars", force: :cascade do |t|
    t.string   "name"
    t.string   "filepath"
    t.string   "participates", default: [],              array: true
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "webinars", ["user_id"], name: "index_webinars_on_user_id", using: :btree

  add_foreign_key "webinars", "users"
end

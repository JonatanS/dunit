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

ActiveRecord::Schema.define(version: 20150201000023) do

  create_table "beams", force: :cascade do |t|
    t.string   "revit_id"
    t.boolean  "done"
    t.text     "details"
    t.string   "section"
    t.string   "material"
    t.float    "angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  create_table "braces", force: :cascade do |t|
    t.string   "revit_id"
    t.boolean  "done"
    t.text     "details"
    t.string   "section"
    t.string   "material"
    t.float    "angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string   "revit_id"
    t.boolean  "done"
    t.text     "details"
    t.string   "section"
    t.string   "material"
    t.float    "angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.string   "level_name"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.string   "subject_type"
    t.integer  "subject_id"
    t.boolean  "hidden"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "resolved"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "floors", force: :cascade do |t|
    t.string   "revit_id"
    t.boolean  "done"
    t.text     "details"
    t.string   "level_name"
    t.string   "material"
    t.float    "thickness"
    t.string   "floor_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  create_table "foundations", force: :cascade do |t|
    t.string   "revit_id"
    t.boolean  "done"
    t.text     "details"
    t.string   "material"
    t.string   "foundation_type"
    t.float    "angle"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "project_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["project_id"], name: "index_memberships_on_project_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "payload"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "revit_id"
    t.string   "name"
    t.string   "number"
    t.string   "base_finish"
    t.string   "wall_finish"
    t.string   "ceiling_finish"
    t.string   "floor_finish"
    t.integer  "occupancy"
    t.float    "area"
    t.string   "level_name"
    t.float    "height"
    t.integer  "project_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "twitter_username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "walls", force: :cascade do |t|
    t.string   "revit_id"
    t.boolean  "done"
    t.text     "details"
    t.string   "wall_type"
    t.float    "height"
    t.float    "thickness"
    t.string   "material"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.string   "level_name"
  end

end

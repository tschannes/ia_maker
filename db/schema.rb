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

ActiveRecord::Schema.define(version: 20130822153359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "level0s", force: true do |t|
    t.string   "title"
    t.string   "overview"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "level1s", force: true do |t|
    t.string   "title"
    t.string   "overview"
    t.string   "description"
    t.integer  "level0_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "level2s", force: true do |t|
    t.string   "title"
    t.string   "overview"
    t.string   "description"
    t.integer  "level1_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mercury_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_title",    default: "Project Title"
    t.string   "project_subtitle", default: "Subtitle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quicklinks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree

end

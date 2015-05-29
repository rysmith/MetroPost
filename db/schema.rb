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

ActiveRecord::Schema.define(version: 20150529182841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commentlines", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "commentlines", ["comment_id"], name: "index_commentlines_on_comment_id", using: :btree
  add_index "commentlines", ["line_id"], name: "index_commentlines_on_line_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "comment_text"
    t.string   "comment_title"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "commentstops", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "commentstops", ["comment_id"], name: "index_commentstops_on_comment_id", using: :btree
  add_index "commentstops", ["stop_id"], name: "index_commentstops_on_stop_id", using: :btree

  create_table "lines", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "line_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stops", force: :cascade do |t|
    t.integer  "stop_id"
    t.string   "stop_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userlines", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "userlines", ["line_id"], name: "index_userlines_on_line_id", using: :btree
  add_index "userlines", ["user_id"], name: "index_userlines_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
  end

  create_table "userstops", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "userstops", ["stop_id"], name: "index_userstops_on_stop_id", using: :btree
  add_index "userstops", ["user_id"], name: "index_userstops_on_user_id", using: :btree

  add_foreign_key "commentlines", "comments"
  add_foreign_key "commentlines", "lines"
  add_foreign_key "commentstops", "comments"
  add_foreign_key "commentstops", "stops"
  add_foreign_key "userlines", "lines"
  add_foreign_key "userlines", "users"
  add_foreign_key "userstops", "stops"
  add_foreign_key "userstops", "users"
end

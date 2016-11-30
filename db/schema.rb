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

ActiveRecord::Schema.define(version: 20161130111931) do

  create_table "listtables", force: :cascade do |t|
    t.integer  "todolist_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "things"
    t.string   "note"
    t.string   "title"
    t.integer  "situation",           default: 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "status",              default: 0
  end

  add_index "listtables", ["todolist_id", "created_at"], name: "index_listtables_on_todolist_id_and_created_at"
  add_index "listtables", ["todolist_id"], name: "index_listtables_on_todolist_id"

  create_table "qalists", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "question1"
    t.string   "deadline1"
    t.integer  "tdid1"
    t.text     "question2"
    t.string   "deadline2"
    t.integer  "tdid2"
    t.text     "question3"
    t.string   "deadline3"
    t.integer  "tdid3"
    t.text     "question4"
    t.string   "deadline4"
    t.integer  "tdid4"
    t.text     "question5"
    t.string   "deadline5"
    t.integer  "tdid5"
    t.text     "question6"
    t.string   "deadline6"
    t.integer  "tdid6"
    t.text     "question7"
    t.string   "deadline7"
    t.integer  "tdid7"
    t.text     "question8"
    t.string   "deadline8"
    t.integer  "tdid8"
    t.text     "question9"
    t.string   "deadline9"
    t.integer  "tdid9"
    t.text     "question10"
    t.string   "deadline10"
    t.integer  "tdid10"
    t.text     "query0"
    t.string   "line0"
    t.integer  "tdnumber0",  default: 0
    t.text     "query1"
    t.string   "line1"
    t.integer  "tdnumber1",  default: 1
    t.text     "query2"
    t.string   "line2"
    t.integer  "tdnumber2",  default: 2
    t.text     "query3"
    t.string   "line3"
    t.integer  "tdnumber3",  default: 3
    t.text     "query4"
    t.string   "line4"
    t.integer  "tdnumber4",  default: 4
    t.text     "query5"
    t.string   "line5"
    t.integer  "tdnumber5",  default: 5
    t.text     "query6"
    t.string   "line6"
    t.integer  "tdnumber6",  default: 6
    t.text     "query7"
    t.string   "line7"
    t.integer  "tdnumber7",  default: 7
    t.text     "query8"
    t.string   "line8"
    t.integer  "tdnumber8",  default: 8
    t.text     "query9"
    t.string   "line9"
    t.integer  "tdnumber9",  default: 9
  end

  add_index "qalists", ["user_id", "created_at"], name: "index_qalists_on_user_id_and_created_at"
  add_index "qalists", ["user_id"], name: "index_qalists_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "todolists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "title"
    t.string   "things"
    t.string   "note"
    t.integer  "situation",           default: 0
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "approver"
    t.integer  "status",              default: 0
  end

  add_index "todolists", ["user_id", "created_at"], name: "index_todolists_on_user_id_and_created_at"
  add_index "todolists", ["user_id"], name: "index_todolists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

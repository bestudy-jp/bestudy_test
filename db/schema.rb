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

ActiveRecord::Schema.define(version: 20150505062721) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level",       default: 0, null: false
  end

  create_table "genre_user_relations", force: true do |t|
    t.integer  "genre_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.integer  "parent_genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_text_books", force: true do |t|
    t.integer  "text_book_id", null: false
    t.integer  "lesson_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
  end

  create_table "match_rates", force: true do |t|
    t.integer  "answer_id"
    t.integer  "lesson_id"
    t.float    "rate",       limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "text_book_id", null: false
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_pre_answers", force: true do |t|
    t.integer  "question_id", null: false
    t.integer  "answer_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question_type", null: false
    t.integer  "genre_id"
  end

  create_table "radar_points", force: true do |t|
    t.integer  "answer_id",              null: false
    t.string   "name",                   null: false
    t.integer  "point",      default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_books", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_purchases", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "lesson_id",  null: false
    t.integer  "price",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "detail_hash"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

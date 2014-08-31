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

ActiveRecord::Schema.define(version: 20140828212442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.boolean  "agree",      default: false
    t.text     "content"
    t.integer  "debate_id"
    t.integer  "user_id"
    t.integer  "vote_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debates", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "topic_id"
    t.integer  "user_id"
    t.integer  "votes_for",     default: 0
    t.integer  "votes_against", default: 0
    t.integer  "total_votes",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.boolean  "has_voted?"
    t.boolean  "agree",      default: false
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

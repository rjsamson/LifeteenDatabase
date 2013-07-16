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

ActiveRecord::Schema.define(version: 20130716020227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "street"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "contact_id"
  end

  create_table "catechetical_experiences", force: true do |t|
    t.date     "end_date"
    t.string   "grades"
    t.date     "start_date"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_date_events", force: true do |t|
    t.integer  "date_event_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_events", force: true do |t|
    t.integer  "event_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_ministries", force: true do |t|
    t.integer  "ministry_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "allergies"
    t.date     "background_check"
    t.date     "baptism"
    t.date     "birthday"
    t.boolean  "code_of_conduct"
    t.string   "college"
    t.string   "college_email"
    t.date     "confirmation"
    t.string   "diet_restrictions"
    t.string   "email"
    t.string   "email2"
    t.string   "facebook_id"
    t.date     "first_communion"
    t.date     "first_reconciliation"
    t.string   "gender"
    t.string   "graduating_class"
    t.boolean  "is_active"
    t.boolean  "is_group_or_parish"
    t.text     "life_experience"
    t.string   "phone"
    t.string   "cell"
    t.string   "fax"
    t.string   "work_phone"
    t.string   "myspace_id"
    t.string   "twitter_id"
    t.string   "youth_group_leader"
    t.string   "school"
    t.boolean  "safe_child_video_letter_sent"
    t.integer  "watched_safe_child_video"
    t.string   "medical"
  end

  create_table "date_event_types", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "date_events", force: true do |t|
    t.date     "event_date"
    t.integer  "date_event_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.binary   "bytes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filename"
    t.string   "filetype"
  end

  create_table "ministries", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

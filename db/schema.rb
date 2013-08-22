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

ActiveRecord::Schema.define(version: 20130821105036) do

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "assessment_date"
    t.string   "gender"
    t.string   "business_unit"
    t.text     "observation"
    t.integer  "score_1"
    t.integer  "score_2"
    t.integer  "score_3"
    t.integer  "score_4"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
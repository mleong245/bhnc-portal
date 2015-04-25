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

ActiveRecord::Schema.define(version: 20150424230957) do

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.string   "description"
    t.string   "full_description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                  default: "",    null: false
    t.string   "encrypted_password",                     default: "",    null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                  default: false, null: false
    t.boolean  "volunteer",                              default: false, null: false
    t.string   "street_address"
    t.string   "city"
    t.integer  "zip_code"
    t.string   "company"
    t.integer  "phone",                        limit: 8
    t.string   "date"
    t.string   "birth_date"
    t.string   "work_hours"
    t.string   "emergency_contact"
    t.string   "occupation"
    t.string   "employer"
    t.string   "work"
    t.string   "current"
    t.string   "past"
    t.integer  "emergency_phone_number",       limit: 8
    t.string   "referral"
    t.string   "languages"
    t.string   "extra_information"
    t.string   "license_check"
    t.string   "violations_check"
    t.string   "car_check"
    t.string   "license_number"
    t.string   "auto_insurance_policy_number"
    t.string   "class_b_license"
    t.string   "photograph_consent"
    t.string   "administrative"
    t.string   "recreational_assistant"
    t.string   "recreational_leader"
    t.string   "computer_lab"
    t.string   "brown_bag"
    t.string   "food_box"
    t.string   "food_distribution"
    t.string   "friendly_visitor"
    t.string   "sales_associate"
    t.string   "sorters"
    t.string   "handyperson"
    t.string   "intern"
    t.string   "lunch_service"
    t.string   "personal_driver"
    t.string   "translator"
    t.string   "other_interests"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

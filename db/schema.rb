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

ActiveRecord::Schema.define(version: 20150426022950) do

  create_table "available_hours", force: :cascade do |t|
    t.string "day_of_week"
    t.string "start"
    t.string "end"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.datetime "starts_at"
    t.datetime "end"
  end

  create_table "space_rental_requests", force: :cascade do |t|
    t.string   "location"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "approved",    default: false, null: false
    t.integer  "user_id"
    t.string   "description"
  end

  add_index "space_rental_requests", ["user_id"], name: "index_space_rental_requests_on_user_id"

  create_table "user_hours", force: :cascade do |t|
    t.integer "user_id"
    t.integer "available_hour_id"
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
    t.string   "license_number"
    t.string   "auto_insurance_policy_number"
    t.string   "other_interests"
    t.string   "professional_name"
    t.string   "professional_relationship"
    t.integer  "professional_phone",           limit: 8
    t.string   "personal_name"
    t.string   "personal_relationship"
    t.integer  "personal_phone",               limit: 8
    t.string   "time_commitment"
    t.string   "signature"
    t.string   "criminal_offense_explanation"
    t.date     "the_date"
    t.string   "birth_date"
    t.boolean  "contact_during_work_hours",              default: false, null: false
    t.boolean  "photograph_consent",                     default: false, null: false
    t.boolean  "criminal_offense",                       default: false, null: false
    t.boolean  "license_check",                          default: false, null: false
    t.boolean  "violations_check",                       default: false, null: false
    t.boolean  "car_check",                              default: false, null: false
    t.boolean  "class_b_license",                        default: false, null: false
    t.boolean  "administrative",                         default: false, null: false
    t.boolean  "recreational_assistant",                 default: false, null: false
    t.boolean  "recreational_leader",                    default: false, null: false
    t.boolean  "computer_lab",                           default: false, null: false
    t.boolean  "brown_bag",                              default: false, null: false
    t.boolean  "food_box",                               default: false, null: false
    t.boolean  "food_distribution",                      default: false, null: false
    t.boolean  "friendly_visitor",                       default: false, null: false
    t.boolean  "sales_associate",                        default: false, null: false
    t.boolean  "sorters",                                default: false, null: false
    t.boolean  "handyperson",                            default: false, null: false
    t.boolean  "intern",                                 default: false, null: false
    t.boolean  "lunch_service",                          default: false, null: false
    t.boolean  "personal_driver",                        default: false, null: false
    t.boolean  "translator",                             default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_events", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "volunteer_applications", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.string   "name",                           null: false
    t.boolean  "approved",       default: false, null: false
    t.string   "street_address",                 null: false
    t.string   "city",                           null: false
    t.string   "zip_code",                       null: false
    t.string   "phone",                          null: false
    t.string   "company",                        null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end

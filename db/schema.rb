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

ActiveRecord::Schema.define(version: 20160616024158) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "beneficaries", force: true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "relationship"
    t.boolean  "under_18"
    t.string   "percentage_of_assets"
    t.text     "specific_gifts"
    t.boolean  "distribute_lump_sum"
    t.boolean  "distribute_over_time"
    t.boolean  "give_at_death"
    t.string   "age_lump_sum"
    t.string   "age_first_distribution"
    t.string   "percent_first_distribution"
    t.string   "preceeding_death_distribution"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "guardian"
    t.string   "co_guardians"
    t.string   "successor_guardian"
    t.string   "spouse"
    t.string   "partner"
    t.string   "significant_other"
    t.boolean  "single"
    t.string   "age_second_distribution"
    t.string   "percent_second_distribution"
    t.string   "age_third_distribution"
    t.boolean  "another_beneficiary"
    t.string   "form_id"
  end

  create_table "charities", force: true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "streetaddress"
    t.string   "streetaddress2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "country"
    t.string   "phone"
    t.string   "percentage_of_estate"
    t.string   "other_gift"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "to_do_now"
    t.string   "form_id"
  end

  create_table "deeds", force: true do |t|
    t.integer  "person_id"
    t.string   "name_1"
    t.string   "name_2"
    t.string   "post_names_phrase"
    t.string   "deed_kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "legal_description"
    t.string   "ready_to_enter_info"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "listed_state"
    t.string   "email"
    t.string   "streetaddress"
    t.string   "streetaddress2"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "country"
    t.string   "marital_status"
    t.string   "spouse_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "all_to_spouse"
    t.string   "percent_to_spouse"
    t.text     "specific_gift_to_spouse"
    t.boolean  "previously_married"
    t.boolean  "give_assets_to_previous_spouse"
    t.string   "assets_for_previous_spouse"
    t.string   "joint_trust"
    t.string   "agent"
    t.string   "alternate_agent"
    t.string   "legal_description_of_property"
    t.string   "mask"
    t.string   "partner_name"
    t.boolean  "all_to_partner"
    t.string   "percent_to_partner"
    t.text     "specific_gift_to_partner"
    t.string   "gender"
    t.string   "trusteefirst"
    t.string   "trusteetheone"
    t.string   "trusteethesecond"
    t.string   "trusteenumber"
    t.string   "currentdate"
    t.string   "beneficiaryfirst"
    t.string   "beneficiarysecond"
    t.string   "beneficiarythird"
    t.string   "beneficiaryfourth"
    t.string   "onebeneficiary"
    t.string   "twobeneficiary"
    t.string   "singleorco"
    t.string   "beneficiarynumber"
    t.string   "percentageone"
    t.string   "percentagetwo"
    t.string   "threebeneficiary"
    t.string   "fourbeneficiary"
    t.string   "lumporseries"
    t.string   "percentagethree"
    t.string   "percentagefour"
    t.string   "percentagefive"
    t.string   "percentagesix"
    t.string   "fivebeneficiary"
    t.string   "sixbeneficiary"
    t.string   "trusteethethird"
    t.string   "sevenbeneficiary"
    t.string   "percentageseven"
    t.string   "trusteethefourth"
    t.string   "trusteethefifth"
    t.string   "county"
    t.string   "beneficiaryone"
    t.string   "contingentdistribution"
    t.string   "contingentdescription"
    t.string   "otherprovisions"
    t.string   "trustname"
    t.string   "trustpackage"
    t.string   "willpackage"
    t.string   "package"
    t.string   "co2_3"
  end

  create_table "trustees", force: true do |t|
    t.integer  "person_id"
    t.boolean  "spouse_co_trustee"
    t.boolean  "trustee_as_guardian"
    t.string   "other_guardian"
    t.string   "co_trustee_1"
    t.string   "co_trustee_2"
    t.string   "co_trustee_3"
    t.string   "co_trustee_4"
    t.string   "co_trustee_6"
    t.string   "bank_trustee"
    t.boolean  "pay_trustee"
    t.string   "pay_per_hour"
    t.string   "flat_fee"
    t.string   "percentage"
    t.string   "additional_successor_trustee_method"
    t.string   "percentage_of_beneficiaries_add_trustee"
    t.string   "person_to_choose_additional_trustees"
    t.string   "remove_trustee_method"
    t.string   "percentage_of_beneficiaries_remove_trustee"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "single_successor_trustee"
    t.string   "co_trustee_5"
    t.string   "second_successor_trustee"
    t.string   "third_successor_trustee"
    t.string   "fourth_successor_trustee"
    t.string   "fifth_successor_trustee"
    t.string   "number"
    t.string   "trusteename"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end

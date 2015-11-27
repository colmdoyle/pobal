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

ActiveRecord::Schema.define(version: 20151127084253) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "bodies", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "name",                limit: 255
    t.integer  "body_type_id",        limit: 4
    t.string   "slug",                limit: 255, null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "bodies", ["body_type_id"], name: "index_bodies_on_body_type_id", using: :btree

  create_table "body_types", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255, null: false
  end

  create_table "constituencies", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name",                 limit: 255
    t.integer  "constituency_type_id", limit: 4
    t.string   "slug",                 limit: 255, null: false
    t.integer  "map_it_id",            limit: 4
  end

  add_index "constituencies", ["constituency_type_id"], name: "index_constituencies_on_constituency_type_id", using: :btree

  create_table "constituency_types", force: :cascade do |t|
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name",                      limit: 255
    t.text     "description",               limit: 65535
    t.string   "member_title_abbreviation", limit: 255
    t.string   "mapit_code",                limit: 255
    t.string   "slug",                      limit: 255,   null: false
    t.string   "short_description",         limit: 255
  end

  create_table "group_types", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.string   "homepage",            limit: 255
    t.integer  "group_type_id",       limit: 4
    t.string   "slug",                limit: 255,   null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "phone_number",        limit: 255
    t.string   "email",               limit: 255
    t.string   "facebook",            limit: 255
    t.string   "twitter",             limit: 255
    t.string   "postal_address",      limit: 255
    t.string   "website",             limit: 255
  end

  add_index "groups", ["group_type_id"], name: "index_groups_on_group_type_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "person_id",  limit: 4
    t.integer  "group_id",   limit: 4
    t.string   "note",       limit: 255
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["person_id"], name: "index_memberships_on_person_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "phone_number",        limit: 255
    t.string   "email",               limit: 255
    t.string   "website",             limit: 255
    t.string   "facebook",            limit: 255
    t.string   "twitter",             limit: 255
    t.string   "postal_address",      limit: 255
    t.string   "gender",              limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "slug",                limit: 255, default: ""
  end

  create_table "position_types", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255, null: false
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "body_id",          limit: 4
    t.integer  "constituency_id",  limit: 4
    t.integer  "person_id",        limit: 4
    t.integer  "position_type_id", limit: 4
    t.string   "note",             limit: 255
  end

  add_index "positions", ["body_id"], name: "index_positions_on_body_id", using: :btree
  add_index "positions", ["constituency_id"], name: "index_positions_on_constituency_id", using: :btree
  add_index "positions", ["person_id"], name: "index_positions_on_person_id", using: :btree
  add_index "positions", ["position_type_id"], name: "index_positions_on_position_type_id", using: :btree

  add_foreign_key "bodies", "body_types"
  add_foreign_key "groups", "group_types"
  add_foreign_key "positions", "position_types"
end

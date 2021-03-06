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

ActiveRecord::Schema.define(version: 20161101181159) do

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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name",                limit: 255
    t.integer  "body_type_id",        limit: 4
    t.string   "slug",                limit: 255,   null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.text     "description",         limit: 65535
  end

  add_index "bodies", ["body_type_id"], name: "index_bodies_on_body_type_id", using: :btree
  add_index "bodies", ["slug"], name: "index_bodies_on_slug", using: :btree

  create_table "body_types", force: :cascade do |t|
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "name",               limit: 255
    t.string   "slug",               limit: 255,                null: false
    t.boolean  "has_constituencies",             default: true
  end

  add_index "body_types", ["slug"], name: "index_body_types_on_slug", using: :btree

  create_table "candidacies", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "person_id",       limit: 4
    t.integer  "election_id",     limit: 4
    t.integer  "constituency_id", limit: 4
    t.text     "note",            limit: 65535
  end

  add_index "candidacies", ["constituency_id"], name: "index_candidacies_on_constituency_id", using: :btree
  add_index "candidacies", ["election_id"], name: "index_candidacies_on_election_id", using: :btree
  add_index "candidacies", ["person_id"], name: "index_candidacies_on_person_id", using: :btree

  create_table "constituencies", force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name",                 limit: 255
    t.integer  "constituency_type_id", limit: 4
    t.string   "slug",                 limit: 255, null: false
    t.integer  "map_it_id",            limit: 4
  end

  add_index "constituencies", ["constituency_type_id"], name: "index_constituencies_on_constituency_type_id", using: :btree
  add_index "constituencies", ["slug"], name: "index_constituencies_on_slug", using: :btree

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

  add_index "constituency_types", ["slug"], name: "index_constituency_types_on_slug", using: :btree

  create_table "elections", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "polls_open_date"
    t.date     "polls_close_date"
    t.integer  "body_id",          limit: 4
    t.string   "name",             limit: 255
  end

  add_index "elections", ["body_id"], name: "index_elections_on_body_id", using: :btree

  create_table "espinita_audits", force: :cascade do |t|
    t.integer  "auditable_id",    limit: 4
    t.string   "auditable_type",  limit: 255
    t.integer  "user_id",         limit: 4
    t.string   "user_type",       limit: 255
    t.text     "audited_changes", limit: 65535
    t.string   "comment",         limit: 255
    t.integer  "version",         limit: 4
    t.string   "action",          limit: 255
    t.string   "remote_address",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "espinita_audits", ["auditable_type", "auditable_id"], name: "index_espinita_audits_on_auditable_type_and_auditable_id", using: :btree
  add_index "espinita_audits", ["user_type", "user_id"], name: "index_espinita_audits_on_user_type_and_user_id", using: :btree

  create_table "group_types", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255, null: false
  end

  add_index "group_types", ["slug"], name: "index_group_types_on_slug", using: :btree

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
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
    t.string   "color",               limit: 255
  end

  add_index "groups", ["group_type_id"], name: "index_groups_on_group_type_id", using: :btree
  add_index "groups", ["slug"], name: "index_groups_on_slug", using: :btree

  create_table "megaphones", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "message",    limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "active"
  end

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

  add_index "people", ["slug"], name: "index_people_on_slug", using: :btree

  create_table "position_types", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "title",             limit: 255
    t.string   "slug",              limit: 255, null: false
    t.string   "short_description", limit: 255
  end

  add_index "position_types", ["slug"], name: "index_position_types_on_slug", using: :btree

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

  create_table "searches", force: :cascade do |t|
    t.string   "address",        limit: 255,   null: false
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.text     "mapit_response", limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "searches", ["address"], name: "index_searches_on_address", using: :btree

  add_foreign_key "bodies", "body_types"
  add_foreign_key "candidacies", "constituencies"
  add_foreign_key "candidacies", "elections"
  add_foreign_key "candidacies", "people"
  add_foreign_key "elections", "bodies"
  add_foreign_key "groups", "group_types"
  add_foreign_key "positions", "position_types"
end

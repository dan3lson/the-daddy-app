# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_24_101808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.uuid "visit_id"
    t.uuid "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.uuid "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "children", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.integer "gender", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birthdate", null: false
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "body", null: false
    t.integer "status", default: 0, null: false
    t.uuid "user_id", null: false
    t.uuid "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "topic_id"
    t.uuid "users_question_of_the_day_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["topic_id"], name: "index_comments_on_topic_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["users_question_of_the_day_id"], name: "index_comments_on_users_question_of_the_day_id"
  end

  create_table "emojis", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "emoji", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emoji"], name: "index_emojis_on_emoji", unique: true
    t.index ["name"], name: "index_emojis_on_name", unique: true
  end

  create_table "feedbacks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "body", null: false
    t.string "kind", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind"], name: "index_feedbacks_on_kind"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "flags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "comment_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id", "user_id"], name: "index_flags_on_comment_id_and_user_id", unique: true
    t.index ["comment_id"], name: "index_flags_on_comment_id"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "invites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.integer "status", default: 0, null: false
    t.uuid "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_invites_on_email", unique: true
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "question_of_the_days", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "question", null: false
    t.date "day", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day"], name: "index_question_of_the_days_on_day", unique: true
    t.index ["question"], name: "index_question_of_the_days_on_question"
  end

  create_table "reactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "emoji_id", null: false
    t.string "reactionable_type", null: false
    t.uuid "reactionable_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["emoji_id"], name: "index_reactions_on_emoji_id"
    t.index ["reactionable_type", "reactionable_id"], name: "index_reactions_on_reactionable_type_and_reactionable_id"
    t.index ["user_id", "reactionable_id", "reactionable_type"], name: "index_reactions_on_user_and_reactionable", unique: true
    t.index ["user_id"], name: "index_reactions_on_user_id"
  end

  create_table "topics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.boolean "admin", default: false, null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "users_question_of_the_days", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "question_of_the_day_id", null: false
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_of_the_day_id", "user_id"], name: "index_user_and_question_on_users_questions_of_the_day"
    t.index ["question_of_the_day_id"], name: "index_users_question_of_the_days_on_question_of_the_day_id"
    t.index ["user_id"], name: "index_users_question_of_the_days_on_user_id"
  end

  create_table "waitlist_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "daddy_type", null: false
    t.string "referral_code", null: false
    t.uuid "referrer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.index ["daddy_type"], name: "index_waitlist_users_on_daddy_type"
    t.index ["email"], name: "index_waitlist_users_on_email", unique: true
    t.index ["referral_code"], name: "index_waitlist_users_on_referral_code", unique: true
    t.index ["referrer_id"], name: "index_waitlist_users_on_referrer_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "children", "users"
  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "users_question_of_the_days"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "flags", "comments"
  add_foreign_key "flags", "users"
  add_foreign_key "invites", "users"
  add_foreign_key "reactions", "emojis"
  add_foreign_key "reactions", "users"
  add_foreign_key "users_question_of_the_days", "question_of_the_days"
  add_foreign_key "users_question_of_the_days", "users"
end

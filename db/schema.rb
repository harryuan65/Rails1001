# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_10_121419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "android_receipts", force: :cascade do |t|
    t.string "product_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "ios_receipts", force: :cascade do |t|
    t.string "product_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.integer "imageable_id", null: false
    t.string "asset", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable"
  end

  create_table "point_records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "points", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_point_records_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "platform_type", null: false
    t.integer "platform_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["platform_type", "platform_id"], name: "index_receipts_on_platform"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "user_point_infos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_point_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "picture_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.string "name"
    t.string "country_code"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["picture_id"], name: "index_users_on_picture_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "video_watching_histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "video_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "articles", "users"
  add_foreign_key "point_records", "users"
  add_foreign_key "receipts", "users"
  add_foreign_key "user_point_infos", "users"
  add_foreign_key "users", "pictures"

  create_view "new_users_count_by_country", sql_definition: <<-SQL
      SELECT users.country_code,
      count(users.id) AS count
     FROM users
    WHERE (users.created_at > (now() - 'P1D'::interval))
    GROUP BY users.country_code;
  SQL
  create_view "count_new_users_by_country_m", materialized: true, sql_definition: <<-SQL
      SELECT users.country_code,
      count(users.id) AS count
     FROM users
    WHERE (users.created_at > (now() - 'P1D'::interval))
    GROUP BY users.country_code;
  SQL
  add_index "count_new_users_by_country_m", ["country_code"], name: "country_code_new_users_idx", unique: true
  add_index "count_new_users_by_country_m", ["country_code"], name: "new_user_country_code_idx"

  create_view "user_video_report", materialized: true, sql_definition: <<-SQL
      SELECT vwh.user_id,
      v.id AS video_id,
      v.name AS video_name,
      sum((vwh.end_time - vwh.start_time)) AS time_used
     FROM (video_watching_histories vwh
       JOIN videos v ON ((v.id = vwh.video_id)))
    GROUP BY vwh.user_id, v.id, v.name
    ORDER BY (sum((vwh.end_time - vwh.start_time))) DESC;
  SQL
  add_index "user_video_report", ["user_id", "video_id"], name: "user_id_video_report_idx", unique: true

  create_view "user_video_reports", materialized: true, sql_definition: <<-SQL
      SELECT vwh.user_id,
      v.id AS video_id,
      v.name AS video_name,
      sum((vwh.end_time - vwh.start_time)) AS time_used
     FROM (video_watching_histories vwh
       JOIN videos v ON ((v.id = vwh.video_id)))
    GROUP BY vwh.user_id, v.id, v.name
    ORDER BY (sum((vwh.end_time - vwh.start_time))) DESC;
  SQL
end

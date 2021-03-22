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

ActiveRecord::Schema.define(version: 2021_03_22_071441) do

  create_table "candidates", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "skill", default: "", null: false
    t.string "work_experience", default: "", null: false
    t.string "ctc", default: "", null: false
    t.string "notice_period", default: "", null: false
    t.integer "job_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_candidates_on_job_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter", default: "", null: false
    t.string "body", default: "", null: false
    t.integer "candidate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_comments_on_candidate_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "openings", default: "", null: false
    t.string "applied", default: "", null: false
    t.string "rejected", default: "", null: false
    t.string "remaining", default: "", null: false
    t.string "experience", default: "", null: false
    t.string "selected", default: "", null: false
    t.string "in_progress", default: "", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "isadmin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidates", "jobs"
  add_foreign_key "comments", "candidates"
  add_foreign_key "jobs", "users"
end

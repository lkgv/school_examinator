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

ActiveRecord::Schema.define(version: 2021_03_13_163911) do

  create_table "activities", charset: "utf8mb4", force: :cascade do |t|
    t.string "description", null: false
    t.integer "score", null: false
    t.date "date", null: false
    t.bigint "exam_item_id"
    t.bigint "std_activity_id"
    t.bigint "class_org_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["class_org_id"], name: "index_activities_on_class_org_id"
    t.index ["exam_item_id"], name: "index_activities_on_exam_item_id"
    t.index ["std_activity_id"], name: "index_activities_on_std_activity_id"
  end

  create_table "class_orgs", charset: "utf8mb4", force: :cascade do |t|
    t.integer "grade", default: 0, null: false
    t.integer "number", null: false
    t.integer "score", default: 100, null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grade", "number"], name: "index_class_orgs_on_grade_and_number", unique: true
    t.index ["number"], name: "index_class_orgs_on_number"
    t.index ["user_id"], name: "index_class_orgs_on_user_id"
  end

  create_table "exam_items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_exam_items_on_name", unique: true
  end

  create_table "std_activities", charset: "utf8mb4", force: :cascade do |t|
    t.string "description", null: false
    t.integer "score", null: false
    t.bigint "exam_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_item_id"], name: "index_std_activities_on_exam_item_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0, null: false
    t.integer "score", default: 0, null: false
    t.string "name", null: false
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end

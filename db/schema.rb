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

ActiveRecord::Schema.define(version: 2019_07_25_085144) do

  create_table "groupconversations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "message"
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groupconversations_on_group_id"
    t.index ["user_id"], name: "index_groupconversations_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "purpose"
    t.boolean "access_type"
    t.bigint "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["workspace_id"], name: "index_groups_on_workspace_id"
  end

  create_table "groupthreads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "thread_message"
    t.bigint "groupconversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groupconversation_id"], name: "index_groupthreads_on_groupconversation_id"
  end

  create_table "groupusers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["group_id"], name: "index_groupusers_on_group_id"
    t.index ["user_id"], name: "index_groupusers_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userworkspaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "workspace_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.index ["user_id"], name: "index_userworkspaces_on_user_id"
    t.index ["workspace_id"], name: "index_userworkspaces_on_workspace_id"
  end

  create_table "workspaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "groupconversations", "groups"
  add_foreign_key "groupconversations", "users"
  add_foreign_key "groups", "workspaces"
  add_foreign_key "groupthreads", "groupconversations"
  add_foreign_key "groupusers", "groups"
  add_foreign_key "groupusers", "users"
  add_foreign_key "userworkspaces", "users"
  add_foreign_key "userworkspaces", "workspaces"
end

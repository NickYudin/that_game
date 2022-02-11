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

ActiveRecord::Schema[7.0].define(version: 2022_02_11_123306) do
  create_table "ability_tables", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "strength", default: 10
    t.integer "dexterity", default: 10
    t.integer "constitution", default: 10
    t.integer "intelligence", default: 10
    t.integer "wisdom", default: 10
    t.integer "charisma", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "free_points", default: 10
    t.index ["character_id"], name: "index_ability_tables_on_character_id"
  end

  create_table "admin_and_another_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "char_classes", force: :cascade do |t|
    t.string "name"
    t.integer "hit_dice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hit_dice_id"], name: "index_char_classes_on_hit_dice_id"
  end

  create_table "characters", force: :cascade do |t|
    t.text "name"
    t.integer "level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "health", default: 0
    t.integer "experiense", default: 0
    t.integer "user_id"
    t.integer "char_class_id"
    t.integer "max_health", default: 0
    t.integer "race_id"
    t.index ["char_class_id"], name: "index_characters_on_char_class_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "hit_dices", force: :cascade do |t|
    t.integer "face"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.text "name"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "race_increases", force: :cascade do |t|
    t.integer "race_id"
    t.integer "strength", default: 0
    t.integer "dexterity", default: 0
    t.integer "constitution", default: 0
    t.integer "intelligence", default: 0
    t.integer "wisdom", default: 0
    t.integer "charisma", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_increases_on_race_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.integer "speed", default: 10
    t.string "special_rule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.text "description"
    t.integer "monster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "athletics"
    t.integer "acrobatics"
    t.integer "sleight_of_hand"
    t.integer "stealth"
    t.integer "arcana"
    t.integer "history"
    t.integer "investigation"
    t.integer "nature"
    t.integer "religion"
    t.integer "animal_handling"
    t.integer "insight"
    t.integer "medicine"
    t.integer "survival"
    t.integer "deception"
    t.integer "intimidation"
    t.integer "performance"
    t.integer "persuasion"
    t.integer "ability_table_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "perception", default: 10
    t.index ["ability_table_id"], name: "index_skills_on_ability_table_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id", default: 2
    t.integer "last_room", default: 1
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "ability_tables", "characters"
  add_foreign_key "ability_tables", "characters"
  add_foreign_key "char_classes", "hit_dices"
  add_foreign_key "characters", "char_classes"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "users"
  add_foreign_key "race_increases", "races"
  add_foreign_key "skills", "ability_tables"
  add_foreign_key "users", "roles"
end

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

ActiveRecord::Schema[7.0].define(version: 2022_03_18_125419) do
  create_table "ability_tables", force: :cascade do |t|
    t.integer "strength", default: 10
    t.integer "dexterity", default: 10
    t.integer "constitution", default: 10
    t.integer "intelligence", default: 10
    t.integer "wisdom", default: 10
    t.integer "charisma", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "free_points", default: 10
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.integer "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_and_another_roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "barbarian_features", force: :cascade do |t|
    t.integer "level"
    t.integer "proficiency_bonus"
    t.integer "rages"
    t.integer "rage_damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "barbarian_statuses", force: :cascade do |t|
    t.integer "max_rages", default: 2
    t.integer "current_rages", default: 2
    t.integer "rage_damage", default: 2
    t.boolean "rage_active"
    t.bigint "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "\"characters_id\"", name: "index_barbarian_statuses_on_characters_id"
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
    t.string "aasm_state"
    t.integer "ability_table_id"
    t.index ["ability_table_id"], name: "index_characters_on_ability_table_id"
    t.index ["char_class_id"], name: "index_characters_on_char_class_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "damage_types", force: :cascade do |t|
    t.string "name"
    t.integer "weapons_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weapons_id"], name: "index_damage_types_on_weapons_id"
  end

  create_table "hit_dices", force: :cascade do |t|
    t.integer "face"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "chat_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "aasm_state"
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.text "name"
    t.integer "power"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "heatth", default: 7
    t.integer "health", default: 7
    t.integer "max_health", default: 10
    t.bigint "ability_table_id"
    t.index ["ability_table_id"], name: "index_monsters_on_ability_table_id"
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

  create_table "weapon_properties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_properties_weapons", id: false, force: :cascade do |t|
    t.bigint "weapon_id"
    t.bigint "weapon_property_id"
    t.index ["weapon_id"], name: "index_weapon_properties_weapons_on_weapon_id"
    t.index ["weapon_property_id"], name: "index_weapon_properties_weapons_on_weapon_property_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "damage"
    t.string "damage_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cost"
    t.string "weight"
    t.string "properties"
    t.index ["damage_type_id"], name: "index_weapons_on_damage_type_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "char_classes", "hit_dices"
  add_foreign_key "characters", "char_classes"
  add_foreign_key "characters", "races"
  add_foreign_key "characters", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "race_increases", "races"
  add_foreign_key "skills", "ability_tables"
  add_foreign_key "users", "roles"
end

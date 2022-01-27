require 'rails_helper'

    # t.text "name"
    # t.integer "power"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false
    # t.integer "health"
    # t.integer "experiense"
    # t.integer "user_id"

RSpec.describe Character, type: :model do
  role = Role.first_or_create(roles: 'admin')
  current_user = User.first_or_create!(email: 'metalworldowner@gmail.com', password: 123456, role_id: 1)

  it "ensures presence of name" do
    char = Character.new(power: 1, health: 100, experiense: 0, user_id: current_user.id).save
    expect(char).to eq(false)
  end

  it "ensures presence of power" do
    char = Character.new(name: 'John', power: '', user_id: current_user.id).save
    expect(char).to eq(false)
  end

  it "ensures presence of health" do
    char = Character.new(name: 'John', power: 1, health: '', user_id: current_user.id).save
    expect(char).to eq(false)
  end

  it "ensures presence of experiense" do
      char = Character.new(name: 'John', power: 1, experiense: '', user_id: current_user.id).save
      expect(char).to eq(false)
  end

    it "should save successfully" do
      char = Character.new(name: 'John', power: 1, health: 100, experiense: 0, user_id: current_user.id).save
      expect(char).to eq(true)
    end

  it "ensures presence of user" do
      char = Character.new(name: 'John', power: 1, health: 100, experiense: 0).save
      expect(char).to eq(false)
  end

end

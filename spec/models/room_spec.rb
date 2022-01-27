require 'rails_helper'

  # create_table "rooms", force: :cascade do |t|
  #   t.text "description"
  #   t.integer "monster_id"
  #   t.datetime "created_at", precision: 6, null: false
  #   t.datetime "updated_at", precision: 6, null: false
  #   t.string "aasm_state"
  # end

RSpec.describe Room, type: :model do
  context "validation tests" do

    it "ensures presence of description" do
      room = Room.new(monster_id: 1).save
      expect(room).to eq(false)
    end

  end

  context "AASM test" do

    room = Room.create!(description: "some room", monster_id: 1)

    it "have initial state monster_in" do
      expect(room).to have_state(:monster_in)
    end

    it "changes to monster_defeated on fighting" do
      expect(room).to transition_from(:monster_in).to(:monster_defeated).on_event(:fighting)
    end

    it "changes to monster_in on restore" do
      expect(room).to transition_from(:monster_defeated).to(:monster_in).on_event(:restore)
    end
  end
end
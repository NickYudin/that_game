require 'rails_helper'

# create_table "monsters", force: :cascade do |t|
#   t.text "name"
#   t.integer "power"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false

RSpec.describe Monster, type: :model do
  context 'validation tests' do
    it 'ensures presence of name' do
      monster = Monster.new(power: 1).save
      expect(monster).to be(false)
    end

    it 'ensures presence of power' do
      monster = Monster.new(name: 'monkey').save
      expect(monster).to be(false)
    end

    it 'saves successfully' do
      monster = Monster.new(name: 'monkey', power: 1).save
      expect(monster).to be(true)
    end
  end
end

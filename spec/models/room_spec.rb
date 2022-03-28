require 'rails_helper'

RSpec.describe Room, type: :model do
  params = [{ name: 'Gobbo', power: 13, health: 10 }, { name: 'Red snake', power: 17, health: 13 }]
  params.each do |m|
    monster = Monster.new(m)
    monster.ability_table = AbilityTable.create
    monster.save
  end
  context 'validation tests' do
    it 'ensures presence of description' do
      room = described_class.new(monster_id: 1).save
      expect(room).to be(false)
    end
  end

  context 'AASM test' do
    room = described_class.create!(description: 'some room', monster_id: 1)

    it 'have initial state monster_in' do
      expect(room).to have_state(:monster_in)
    end

    it 'changes to monster_defeated on fighting' do
      expect(room).to transition_from(:monster_in).to(:monster_defeated).on_event(:fighting)
    end

    it 'changes to monster_in on restore' do
      expect(room).to transition_from(:monster_defeated).to(:monster_in).on_event(:restore)
    end
  end
end

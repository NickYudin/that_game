require 'rails_helper'

RSpec.describe EpicBattle, type: :model do
  describe '#call' do
    let(:character) { create(:character) }
    let(:monster) { create(:monster) }
    let(:battle) { described_class.new(character, monster) }

    it 'initiative method should create array of fighters' do
      expect(battle.initiative.class).to eq(Array)
    end

    it 'counting initiative modificator correctly' do
      expect(battle.initiative_modificator(character)).to eq(20)
      expect(battle.initiative_modificator(monster)).to eq(-20)
    end

    it 'initiative_of works correctly' do
      100.times do
        expect(battle.initiative_of(character)).to be_between(21, 40).inclusive
      end
    end

    # monster's initiative modificator in that tests is -20, so he must be @second_fighter (that meethod order returns):
    it 'order method works correctly' do
      expect(battle.order).to eq(monster)
    end
  end
end

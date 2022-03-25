require 'rails_helper'

RSpec.describe EpicBattle, type: :model do
  describe '#call' do
    let(:user) { create(:user) }
    let!(:character) { create(:character, name: Faker::Name.unique.name, user: user, char_class_id: 1, race_id: 1) }
    let(:monster) { create(:monster) }

    it 'initiative method should create array of fighters' do
      expect(described_class.new(character, monster).initiative.class).to eq(Array)
    end

    it 'counting initiative modificator correctly' do
      expect(described_class.new(character, monster).initiative_modificator(character)).to eq(5)
      expect(described_class.new(character, monster).initiative_modificator(monster)).to eq(-20)
    end

    it 'initiative_of works correctly' do
      100.times do
        expect(described_class.new(character, monster).initiative_of(character)).to be_between(6, 25).inclusive
      end
    end

    # monster's initiative modificator in that tests is -20, so he must be @second_fighter (that meethod order returns):
    it 'order method works correctly' do
      expect(described_class.new(character, monster).order).to eq(monster)
    end
  end
end

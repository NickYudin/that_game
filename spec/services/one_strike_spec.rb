require 'rails_helper'

RSpec.describe OneStrike, type: :model do
  describe '#call' do
    let(:fighter) { create(:character, health: 1) }
    let(:fighter2) { create(:character, health: 0) }
    let(:opponent) { create(:monster, health: 1) }
    let(:start_health) {opponent.health}
    let!(:barbarian_status) {create(:barbarian_status, character_id: fighter.id)}
    # Character has +20 to hit, so he is always strikes
    # when health = 0 it not pass check in #call
    it 'not works with 0 health' do
      n = start_health
      described_class.new(opponent, fighter2).call
      expect(opponent.health).to eq(n)
    end
    # ... and pass when fighter's health > 0
    it 'ensures that strike works on hit' do
      n = start_health
      described_class.new(fighter, opponent).call
      expect(opponent.health).to be < n
    end

    # Monster in theese tests has -20 to hit, so it always miss
    it 'ensures that strike works on miss' do
      start_health = fighter.health
      described_class.new(opponent, fighter).call
      expect(fighter.health).to eq(start_health)
    end

    it "invoke Rage for barbarian in_rage" do
      fighter.barbarian_status.toggle!(:rage_active)
      described_class.new(fighter, opponent).call
      expect(opponent.health).to be_between(-5, -2).inclusive
    end
  end
end

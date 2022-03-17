require 'rails_helper'

RSpec.describe BarbarianStatus, type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  current_user = User.first

  it 'ensures creation barbarian_status table' do
    character = Character.create!(name: 'name', user_id: current_user.id, char_class_id: 1, race_id: 1)
    character.save!
    expect(current_user.character.barbarian_status).to be(true)
  end
end

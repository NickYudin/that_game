require 'rails_helper'

RSpec.describe Character, type: :model do
  role = Role.first_or_create(roles: 'admin')
  current_user = User.first_or_create!(email: 'metalworldowner@gmail.com', password: 123_456, role_id: 1)

  it 'ensures presence of name' do
    char = described_class.new(health: 100, experiense: 0, user_id: current_user.id).save
    expect(char).to be(false)
  end

  it 'ensures presence of health' do
    char = described_class.new(name: 'John', level: 1, health: '', user_id: current_user.id).save
    expect(char).to be(false)
  end

  it 'ensures presence of experiense' do
    char = described_class.new(name: 'John', level: 1, experiense: '', user_id: current_user.id).save
    expect(char).to be(false)
  end

  it 'saves successfully' do
    char = described_class.new(name: 'John', level: 1, health: 100, experiense: 0, user_id: current_user.id).save
    expect(char).to be(true)
  end

  it 'ensures presence of user' do
    char = described_class.new(name: 'John', level: 1, health: 100, experiense: 0).save
    expect(char).to be(false)
  end
end

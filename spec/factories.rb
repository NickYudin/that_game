FactoryBot.define do
  factory :messages do
    
  end

  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
  end

  factory :character do
    name { Faker::Name.unique.name }
    user { create(:user) }
    char_class_id { 1 }
    race_id { 1 }
    ability_table { AbilityTable.create!(dexterity: 50) }
  end

  factory :monster do
    name { Faker::Name.unique.name }
    power { 1 }
    ability_table { AbilityTable.create!(dexterity: -30) }
  end

  factory :char_class do
    id { 1 }
    name { "Barbarian" }
    hit_dice_id { 5 }
  end

  factory :barbarian_status do
    
  end
end

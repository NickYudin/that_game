FactoryBot.define do
  factory :user do
    email { 'aabb@hh.de' }
    password { '123456' }
  end

  factory :character do
    ability_table { AbilityTable.create!(dexterity: 20) }
  end

  factory :monster do
    name { Faker::Name.unique.name }
    power { 1 }
    ability_table { AbilityTable.create!(dexterity: -30) }
  end
end

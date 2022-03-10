puts 'seeding roles, users, monsters, rooms...'
roles = Role.create([{ roles: 'admin' },
                     { roles: 'user' }])

users = User.create([{ email: 'metalworldowner@gmail.com',
                       password: '123456',
                       role_id: 1 },
                     {
                       email: 'nik6594@mail.ru',
                       password: '123456'
                     }])
params = [{ name: 'Gobbo', power: 13 }, { name: 'Red snake', power: 17 }]
params.each do |m|
  monster = Monster.new(m)
  monster.ability_table = AbilityTable.create
  monster.save
end

rooms = Room.create([{ description: 'Dark cave', monster_id: 1 },
                     { description: 'Underground forrest', monster_id: 2 }])

puts 'creating hit dises charclasses...'
hit_dices = HitDice.create([
                             { face: 4 },
                             { face: 6 },
                             { face: 8 },
                             { face: 10 },
                             { face: 12 },
                             { face: 20 }
                           ])

puts 'creating classes...'
char_classes = CharClass.create([Parser.new('classes').chars_data])

puts 'creating races...'
races_with_increases = Parser.new('races').races_data.each do |race|
  this = Race.create(name: race[:name], speed: race[:speed])
  race[:race_increase][:race_id] = this.id
  RaceIncrease.create(race[:race_increase])
end

puts 'weapon properties...'
weapon_properties = Parser.new('weapons').weaps_data[:weapon_properties].each { |wp| WeaponProperty.create(name: wp.downcase) }

puts 'weapons...'
n = 0
weapons = Parser.new('weapons').weaps_data[:weapons].each do |w|
  n += 1
  puts " weapon - #{n}"
  weapon = Weapon.create!(
    name: w[:name],
    damage: w[:damage].split(' ').first,
    cost: w[:cost],
    weight: w[:weight],
    damage_type_id: DamageType.find_or_create_by(name: w[:damage].split(' ').last).id,
    properties: w[:properties]
  )

  puts "claiming properties for #{weapon.name}"
  weapon.properties.split(', ').each do |name|
    puts "property: #{name.capitalize.split('(').first}"
    prop = name.split(' (').first
    weapon.weapon_properties << WeaponProperty.find_by(name: prop) if prop != '—'
  end
end

# stub for chat:
chat = Chat.create(name: 'first')

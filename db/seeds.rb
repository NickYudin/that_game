# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  roles = Role.create([{roles: 'admin'}, {roles: 'user'}])
  users = User.create([{email: 'metalworldowner@gmail.com', password: '123456', role_id: 1}, {email: 'nik6594@mail.ru', password: '123456'}])
  monsters = Monster.create([{name: 'Gobbo', power: 13}, {name: 'Red snake', power: 17}])
  rooms = Room.create([{description: 'Dark cave', monster_id: 1}, {description: 'Underground forrest', monster_id: 2}])

  hit_dices = HitDice.create!([{face: 4}, {face: 6}, {face: 8}, {face: 10}, {face: 12}, {face: 20}])
  char_classes = CharClass.create!([Parser.new("classes").chars_data])
  races_with_increases = Parser.new("races").races_data.each do |race|
                                                              this = Race.create!(name: race[:name], speed: race[:speed])
                                                              race[:race_increase][:race_id] = this.id
                                                              RaceIncrease.create!(race[:race_increase])
                                                            end

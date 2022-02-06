# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  car_classes = CharClass.create!([CharClassParser.new.chars_data])
  roles = Role.create([{roles: 'admin'}, {roles: 'user'}])

  users = User.create([{email: 'metalworldowner@gmail.com', password: '123456', role_id: 1}, {email: 'nik6594@mail.ru', password: '123456'}])
  monsters = Monster.create([{name: 'Gobbo', power: 13}, {name: 'Red snake', power: 17}])
  rooms = Room.create([{description: 'Dark cave', monster_id: 1}, {description: 'Underground forrest', monster_id: 2}])

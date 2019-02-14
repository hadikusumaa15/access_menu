# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(name: 'Rahmad', role_id: 1)
Admin.create(name: 'Rahym', role_id: 3)
Admin.create(name: 'Ares', role_id: 2)
Hotel.create(name: 'Alexisze')
Hotel.create(name: 'Balexiz')
Hotel.create(name: 'Calexis')
Menu.create(name: 'User management')
Menu.create(name: 'POS management')
Menu.create(name: 'CRS management')
Package.create(name: 'Free')
Package.create(name: 'Knight')
Package.create(name: 'Paladin')
Package.create(name: 'Queen')
Package.create(name: 'King')
Role.create(name: 'Manager')
Role.create(name: 'CFO')
Role.create(name: 'CEO')
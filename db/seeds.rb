# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.first_or_initialize! do |u|
  u.email = "admin@gmail.com"
  u.nickname = "superadmin"
  u.superadmin = true
  u.password = u.password_confirmation = "123456"
  u.save
end

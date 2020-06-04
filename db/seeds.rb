# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.where(email: "luciacachn@gmail.com").first_or_initialize do |u|
  u.nickname = "lucia"
  u.superadmin = true
  u.password = u.password_confirmation = "123456"
  u.save
end

Admin.where(email: "test@gmail.com").first_or_initialize do |u|
  u.nickname = "IceBear"
  u.password = u.password_confirmation = "123456"
  u.save
end

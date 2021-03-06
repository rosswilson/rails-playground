# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Make hashing passwords faster during local development
BCrypt::Engine.cost = 4

120.times do |index|
  User.create!(name: "User #{index}", email: "user-#{index}@example.com", password: "password")
end
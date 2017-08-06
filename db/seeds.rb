# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

email = "admin@gmail.com"
password = "password"
name = "Admin"
role = "admin"
User.create!(
              name: name,
              email: email,
              password: password,
              password_confirmation: password,
              role:     role)

15.times do |n|
  email = "email#{n+1}@gmail.com"
  name = "Name#{n+1}"
  password = "password"
  User.create!(
                name: name,
                email: email,
                password:              password,
                password_confirmation: password)
  end

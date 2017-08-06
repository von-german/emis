# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin account
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

# Create receptionist account
email = "r@gmail.com"
password = "password"
name = "Receptionist"
role = "receptionist"
User.create!(
              name: name,
              email: email,
              password: password,
              password_confirmation: password,
              role:     role)

# Create Nurse Account
email = "nurse@gmail.com"
password = "password"
name = "Nurse"
role = "nurse"
User.create!(
              name: name,
              email: email,
              password: password,
              password_confirmation: password,
              role:     role)

email = "doctor@gmail.com"
password = "password"
name = "Doctor"
role = "doctor"
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

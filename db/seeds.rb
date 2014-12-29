# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'guest@mail.com', password: 'guest', user_name: 'Guest')
User.create(email: 'admin@mail.com', password: 'epistolae', user_name: 'Admin', admin: true)
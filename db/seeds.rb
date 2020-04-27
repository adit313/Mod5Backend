# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(device: "AAA")
session1 = Session.create(user_id: 1, date: "1/1/2020")
round1 = Round.create(session_id: 1, score: 30)
round2 = Round.create(session_id: 1, score: 45)
round3 = Round.create(session_id: 1, score: 50)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# astronauts
neil_armstrong = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
buzz_aldrin = Astronaut.create(name: "Buzz Aldrin", age: 35, job: "Pilot")
michael_collins = Astronaut.create(name: "Michael Collins", age: 32, job: "Test Pilot")

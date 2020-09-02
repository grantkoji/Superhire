# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Superhero.destroy_all 
User.destroy_all
Appointment.destroy_all 

response = Superhero.search_api("Superman")
Superhero.superhero_search(response)

response = Superhero.search_api("Ironman")
Superhero.superhero_search(response)

response = Superhero.search_api("Thanos")
Superhero.superhero_search(response)

response = Superhero.search_api("Batman")
Superhero.superhero_search(response)

response = Superhero.search_api("Spider-man") 
Superhero.superhero_search(response)

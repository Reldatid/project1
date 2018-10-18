# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
puts "Making Users..."

u1 = User.create name: 'Jonathan', email: 'jonno@testing.com', password: 'chicken'

puts "Created #{User.all.length} Users."

Location.destroy_all
puts "Making Locations..."

l1 = Location.create name: 'Testopia', variety: 'country', universe: 'Testopia', branch: 'Testopia'
l2 = Location.create name: 'Test-ville', variety: 'village', universe: 'Testopia', branch: 'Testopia,Test-ville'
l3 = Location.create name: 'The rubber duck', variety: 'pub', universe: 'Testopia', branch:  'Testopia,Test-ville,The rubber duck'
l4 = Location.create name: 'Test-city', variety: 'city', universe: 'Testopia', branch: 'Testopia,Test-city'
l5 = Location.create name: 'The test and tester', variety: 'tavern', universe: 'Testopia', branch: 'Testopia,Test-city,The test and tester'
l6 = Location.create name: 'Testoleum', variety: 'graveyard', universe: 'Testopia', branch: 'Testopia,Test-city,Testoleum'
l7 = Location.create name: 'Testopolis', variety: 'city', universe: 'Testopia', branch: 'Testopia-Testopolis'

puts l1.id
puts "Created #{Location.all.length} Locations."

u1.locations << l1 << l2 << l3 << l4 << l5 << l6

puts "Linking Locations..."
l1.landmarks << l2 << l4 << l7
l2.landmarks << l3
l4.landmarks << l5 << l6

Note.destroy_all
# puts "Creating Notes..."
#
# n1 = Note.create data:"A beautiful world of trial and error.", visible:true
# n2 = Note.create data:"Mostly error. Its horrible. Progress pleases the duck.", visible:false
#
# puts  "Created #{Note.all.length} notes"
#
# l1.notes << n1 << n2

Npc.destroy_all
puts "Creating NPCs..."

n1 = Npc.create name: 'testy', title: 'the barkeep', description: "A friendly barkeeper in 'The Test And Tester'. Helps coders find ballmer's peak, the rumoured ultimate coding location."

puts "Made #{Npc.all.length} NPCs."
puts "Placing NPCs..."

u1.npcs << n1
l5.npcs << n1

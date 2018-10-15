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

l1 = Location.create name: 'Testopia', variety: 'country'
l2 = Location.create name: 'Test-ville', variety: 'village'
l3 = Location.create name: 'The rubber duck', variety: 'pub'
l4 = Location.create name: 'Test-city', variety: 'city'
l5 = Location.create name: 'The test and tester', variety: 'tavern'
l6 = Location.create name: 'Testoleum', variety: 'graveyard'
l7 = Location.create name: 'Testopolis',
variety: 'city'

puts l1.id
puts "Created #{Location.all.length} Locations."

u1.locations << l1 << l2 << l3 << l4 << l5 << l6

puts "Linking Locations..."
l1.landmarks << l2 << l4 << l7
l2.landmarks << l3
l4.landmarks << l5 << l6

Note.destroy_all
puts "Creating Notes..."

n1 = Note.create data:"A beautiful world of trial and error.", visible:true
n2 = Note.create data:"Mostly error. Its horrible. Progress pleases the duck.", visible:false

puts  "Created #{Note.all.length} notes"

l1.notes << n1 << n2

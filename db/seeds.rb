# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_random_location(obj)
  latitude = rand(-10...10)
  longitude = rand(-10...10)
  Location.create!({latitude: latitude, longitude: longitude, locatable: obj})
end
%w(white pink white pink white).each do |color|
  c=Cab.create!({color: color})
  create_random_location(c)
end

(1..10).each do |i|
  hipster = i%3==0 ? true : false
  u=User.create!({hipster: hipster})
  create_random_location(u)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = Array.new


%w(rts srt rst str).each do |name|
  email = "#{name}@#{name}.com"
  id = User.find_by(email: email)

  if id == nil
    id = User.create!(email: email, password: 'abc123',
                 password_confirmation: 'abc123')[:id]
  end
  users.push(id)
end

p users

lat_lngs = [[42.360082, -71.058880, "Boston"],[41.823989, -71.412834, "Providence"],[43.161030, -77.610922, "Rochester"], [40.712784, -74.005941, "New York City"], [42.262593, -71.802293, "Worcester"]] 

locations = Array.new

lat_lngs.each do |latLng|
   id = Location.create!(lat: latLng[0],lng: latLng[1], address: latLng[2])
   locations.push(id)
end

ride1 = Ride.create!(owner: User.find_by(email: "rts@rts.com"), destination: locations[0], start_point: locations[1], departure_date_time: "Today", spots_left: 3)[:id]

ride2 = Ride.create!(owner: User.find_by(email: "rts@rts.com"), destination: locations[0], start_point: locations[1], departure_date_time: "Today", spots_left: 3)[:id]

RidePassenger.create!(ride_id: ride1, user_id: 2)
RidePassenger.create!(ride_id: ride2, user_id: 3)






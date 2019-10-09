#create users

  user_1 = User.create(name: Faker::TvShows::Seinfeld.character, email: Faker::Internet.email, password: "password")
  user_2 = User.create(name: Faker::TvShows::Seinfeld.character, email: Faker::Internet.email, password: "password")


#create dining_spots

10.times do 
  DiningSpot.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, website: Faker::Internet.url, user_id: user_1.id)
end

10.times do 
  DiningSpot.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, website: Faker::Internet.url, user_id: user_2.id)
end


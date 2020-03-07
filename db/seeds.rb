5.times do
 trip = Trip.create(
   name: Faker::Coffee.blend_name
 )
  3.times do
    location = Location.create(
      city: Faker::Address.city,
      state: Faker::Address.state,
      trip_id: trip.id
    )
      Address.create(
        street: Faker::Address.street_name,
        city: location.city,
        state: location.state,
        zip: Faker::Address.zip,
        location_id: location.id
    )
  end
end
puts 'Data has been seeded'
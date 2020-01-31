# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


bikes = 
  25.times.map do
    { code: Faker::Code.unique.asin, maintenance: [false, false, true, false].sample }
  end

Bike.create!(bikes)

stations = 
  30.times.map do
    { 
      name: Faker::Artist.unique.name,
      address: Faker::Address.unique.full_address,
      code: Faker::Code.unique.asin,
      vacancies: (2..10).to_a.sample
    }
  end

Station.create!(stations)

users = 
  14.times.map do
    { 
      name: Faker::TvShows::HowIMetYourMother.unique.character,
      email: Faker::Internet.email, 
      password: '12345678'
    }
  end.push(
    { name: 'Admin', email: 'admin@admin.com', password: 'admin123', is_admin: true }
  )

User.create!(users)

500.times.map do 
  begin
    Lend.create!(
      bike_id: (1..25).to_a.sample,
      user_id: (1..15).to_a.sample,
      start_at: Time.current,
      end_at: Time.current + (1..2000).to_a.sample.minutes,
      distance: (1..2000).to_a.sample,
      station_id: (1..30).to_a.sample
    )
  rescue
    next
  end
end

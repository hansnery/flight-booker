# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  Airport.delete_all
  Flight.delete_all
  Booking.delete_all
  Passenger.delete_all

  airport1 = Airport.create(airport_code: 'SFO', city: 'San Francisco')
  airport2 = Airport.create(airport_code: 'NYC', city: 'New York')

  100.times do
    random_date = DateTime.new(DateTime.current.year, DateTime.current.month, DateTime.current.day, DateTime.current.hour, DateTime.current.min, DateTime.current.sec).advance(days: DateTime.current.day + rand(1..100))
    random_date = random_date.strftime("%Y/%m/%d")
    random_time = DateTime.now.advance(hours: Time.current.hour + rand(1..100), minutes: Time.current.min + rand(1..100))
    random_time = random_time.strftime("%H:%M")
    flight = Flight.create(from_id: airport1.id, to_id: airport2.id, date: random_date, time: random_time)
    p flight
  end
  puts "Created flights!"
end

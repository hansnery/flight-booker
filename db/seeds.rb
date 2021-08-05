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

  airport1 = Airport.create(airport_code: 'SFO', city: 'San Francisco')
  airport2 = Airport.create(airport_code: 'NYC', city: 'New York')

  flight = Flight.create(from_id: airport1.id, to_id: airport2.id, datetime: DateTime.new(DateTime.current.year, DateTime.current.month, DateTime.current.day).change(day: DateTime.current.day + 14))
end

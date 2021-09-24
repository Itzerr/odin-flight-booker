# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
basedate = DateTime.current.change(sec: 0)

a1 = Airport.create(code: 'a1')
a2 = Airport.create(code: 'a2')
b1 = Airport.create(code: 'b1')
b2 = Airport.create(code: 'b2')

Flight.create(from_airport: a1, to_airport: b1, departure: basedate + 10.days, duration: 10.hours)
Flight.create(from_airport: a2, to_airport: a1, departure: basedate + 7.days, duration: 2.hours)
Flight.create(from_airport: a1, to_airport: a2, departure: basedate + 14.days, duration: 2.hours)

Flight.create(from_airport: b1, to_airport: a1, departure: basedate + 17.days, duration: 10.hours)
Flight.create(from_airport: b2, to_airport: b1, departure: basedate + 7.days, duration: 2.hours)
Flight.create(from_airport: b1, to_airport: b2, departure: basedate + 14.days, duration: 2.hours)

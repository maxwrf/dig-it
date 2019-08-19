# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



digger_test = Digger.new(name: "Testdigger",
                            technical_specification: "Very heavy",
                            start_date: Date.new(2019,10,9),
                            end_date: Date.new(2019,11,12),
                            photo: "https://images.unsplash.com/photo-1495036019936-220b29b930ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80",
                            day_rate: 1000.9)

digger_test.user = User.first
digger_test.save


booking_test = Booking.new(start_date: Date.new(2019,11,9),
                            end_date: Date.new(2019,12,10),
                            review: "Great",
                            rating: 4,
                            approved: false)


booking_test.user = User.last
booking_test.digger = digger_test
booking_test.save

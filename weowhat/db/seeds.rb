# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


curr1 = Currency.create(iso_code: "GBP", exchange_rate: 1.0)
curr2 = Currency.create(iso_code: "USD", exchange_rate: 1.66)

purpose1 = Purpose.create(purpose_text: "Breakfast", no_times_used: 1)
purpose2 = Purpose.create(purpose_text: "Lunch", no_times_used: 1)
purpose3 = Purpose.create(purpose_text: "Dinner", no_times_used: 1)

user1 = User.create(name: "john Smith", email: "jsmith@smith.com", password: "password", password_confirmation: "password")
user2 = User.create(name: "john Jones", email: "jjones@jones.com", password: "password", password_confirmation: "password")
user3 = User.create(name: "Mark Jones", email: "mjjones@jonesextra.com", password: "password", password_confirmation: "password")
user4 = User.create(name: "Simon Foley", email: "sfoley9999@gmail.com", password: "password", password_confirmation: "password")
user5 = User.create(name: "Nick Richards", email: "nick@richards.com", password: "password", password_confirmation: "password")


event1 = Event.create(name: "Summer Lunch", description: "Summer Extraveganza", active: true, start_time: 20140929, end_time: 20140929, base_currency_id: curr1.id)

event2 = Event.create(name: "Dinner Out", description: "Birthday Dinner", active: true, start_time: 20141025, end_time: 20141025, base_currency_id: curr1.id)

event1.users = [user1, user2, user4]
event2.users = [user1, user3, user5]

payment1 = Payment.create(user_id: user1.id, amount: 15.00, purpose_id: purpose1.id, currency_id: curr1.id, event_id: event1.id)
payment2 = Payment.create(user_id: user1.id, amount: 1.00, purpose_id: purpose2.id, currency_id: curr1.id, event_id: event1.id)
payment3 = Payment.create(user_id: user1.id, amount: 25.00, purpose_id: purpose3.id, currency_id: curr1.id, event_id: event1.id)
payment4 = Payment.create(user_id: user2.id, amount: 10.00, purpose_id: purpose3.id, currency_id: curr1.id, event_id: event1.id)
payment5 = Payment.create(user_id: user4.id, amount: 11.00, purpose_id: purpose2.id, currency_id: curr1.id, event_id: event1.id)
payment6 = Payment.create(user_id: user1.id, amount: 5.00, purpose_id: purpose2.id, currency_id: curr1.id, event_id: event2.id)
payment7 = Payment.create(user_id: user3.id, amount: 115.00, purpose_id: purpose3.id, currency_id: curr1.id, event_id: event2.id)
payment8 = Payment.create(user_id: user5.id, amount: 15.00, purpose_id: purpose1.id, currency_id: curr1.id, event_id: event2.id)
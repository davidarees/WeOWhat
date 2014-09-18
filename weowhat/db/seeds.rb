# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


curr1 = Currency.create(iso_code: "GBP", exchange_rate: 1.0)

user1 = User.create(name: "Gerry Mathe", email: "gm@ga.co", password: "password", password_confirmation: "password")
user2 = User.create(name: "Mike Harris", email: "mjharris@sirrahjm.com", password: "password", password_confirmation: "password")
user3 = User.create(name: "Laura Hasting", email: "lh@ga.co", password: "password", password_confirmation: "password")
user4 = User.create(name: "Tobias Hale", email: "TobiasH@gmail.com", password: "password", password_confirmation: "password")
user5 = User.create(name: "Sam Maton", email: "SamMaton@Maton.com", password: "password", password_confirmation: "password")
user6 = User.create(name: "Graham Curl", email: "gac@curl.com", password: "password", password_confirmation: "password")
user7 = User.create(name: "Liam Collins", email: "LiamC@collins.com", password: "password", password_confirmation: "password")
user8 = User.create(name: "Gwen Au", email: "Gwen@au.com", password: "password", password_confirmation: "password")
user9 = User.create(name: "Andrew Fyfe", email: "AF@scotland.com", password: "password", password_confirmation: "password")


event1 = Event.create(name: "Dinner", description: "Food at Ken", active: true, start_time: 20140929, end_time: 20140929, base_currency_id: curr1.id)

event2 = Event.create(name: "Course Finish", description: "Drinks for finishing WDI 7", active: true, start_time: 20140919, end_time: 20140920, base_currency_id: curr1.id)
event3 = Event.create(name: "Breakfast", description: "Food for the brain", active: true, start_time: 20140722, end_time: 20140918, base_currency_id: curr1.id)
event4 = Event.create(name: "Weekend away", description: "Trip away to recover from course", active: true, start_time: 20140922, end_time: 20140924, base_currency_id: curr1.id)

event1.users = [user8, user9]
event2.users = [user1, user2, user3, user4, user5, user6, user7, user8, user9]
event3.users = [user1, user2, user3, user7]
event4.users = [user4, user5, user7]


payment1 = Payment.create(user_id: user5.id, amount: 15.00, reason: "lunch", currency_id: curr1.id, event_id: event4.id)
payment2 = Payment.create(user_id: user4.id, amount: 1.00, reason: "coffee", currency_id: curr1.id, event_id: event4.id)
payment3 = Payment.create(user_id: user8.id, amount: 25.00, reason: "dinner", currency_id: curr1.id, event_id: event1.id)
payment4 = Payment.create(user_id: user4.id, amount: 10.00, reason: "lunch", currency_id: curr1.id, event_id: event4.id)
payment5 = Payment.create(user_id: user3.id, amount: 11.00, reason: "supper - even though eatings cheating", currency_id: curr1.id, event_id: event2.id)
payment6 = Payment.create(user_id: user1.id, amount: 5.00, reason: "coffee", currency_id: curr1.id, event_id: event3.id)
payment7 = Payment.create(user_id: user9.id, amount: 115.00, reason: "big dinner", currency_id: curr1.id, event_id: event1.id)
payment8 = Payment.create(user_id: user7.id, amount: 15.00, reason: "breakfast", currency_id: curr1.id, event_id: event3.id)
payment9 = Payment.create(user_id: user3.id, amount: 150.00, reason: "BEER!", currency_id: curr1.id, event_id: event2.id)
payment10 = Payment.create(user_id: user3.id, amount: 35.00, reason: "A couple of beers", currency_id: curr1.id, event_id: event2.id)
payment11 = Payment.create(user_id: user1.id, amount: 10.00, reason: "White wine spritzer", currency_id: curr1.id, event_id: event2.id)
payment12 = Payment.create(user_id: user3.id, amount: 90.00, reason: "Small Beer Round", currency_id: curr1.id, event_id: event2.id)
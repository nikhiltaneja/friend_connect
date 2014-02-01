# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Event.delete_all
Attendee.delete_all

user = User.create(email: "nikhil.a.taneja@gmail.com", first_name: "Nikhil", last_name: "Taneja", username: "ntaneja", password: "password")


event1 = user.events.create(title: "Coding", description: "Coding at Galvanize", venue: "Galvanize", address: "1062 Delaware St, Denver, CO", starts_at: "2014-02-01 18:00:00")
event3 = user.events.create(title: "Lunch", description: "Group lunch!", venue: "Tony's Market", address: "950 Broadway, Denver, CO 80203", starts_at: "2014-02-05 12:00:00")
event3 = user.events.create(title: "Coffee", description: "Coffee shop I've been wanting to check out", venue: "Roostercat", address: "", starts_at: "2014-02-03 11:00:00")



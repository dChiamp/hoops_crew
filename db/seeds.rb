# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:name => "Derek", :email=> "derek@derek.com", :password => "derek", :password_confirmation => "derek")


event1 = Event.create(:weekend_date => "2/21/16", :sat_votes => 0, :sun_votes => 0)


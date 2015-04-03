# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.create({:first_name => "First", :last_name => "Last", :email => 'admin@gmail.com', :password => 'bhncadmin', :admin => true})

events = [{:name => 'Event 1', :description => 'This is the first event for BHNC',
           :location => 'UC Berkeley', :start => '11-Jan-2016 8:00AM', :end => '11-Jan-2016 12:00PM'},
          {:name => 'Event 2', :description => 'This is the second event for BHNC',
           :location => 'UC Berkeley', :start => '12-Jan-2016 8:00AM', :end => '12-Jan-2016 12:00PM'}]

events.each do |event|
  Event.create!(event)
end

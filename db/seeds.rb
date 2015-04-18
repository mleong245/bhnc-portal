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
           :location => 'UC Berkeley', :starts_at => '11-Jan-2016 8:00AM', :end => '11-Jan-2016 12:00PM'},
          {:name => 'Event 2', :description => 'This is the second event for BHNC',
           :location => 'UC Berkeley', :starts_at => '12-Jan-2016 8:00AM', :end => '12-Jan-2016 12:00PM'}]

hours = []
["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"].each do |day|
  hours += [{day_of_week: day, start: "8:00AM", end: "8:30AM"},
            {day_of_week: day, start: "8:30AM", end: "9:00AM"},
            {day_of_week: day, start: "9:00AM", end: "9:30AM"},
            {day_of_week: day, start: "9:30AM", end: "10:00AM"},
            {day_of_week: day, start: "10:00AM", end: "10:30AM"},
            {day_of_week: day, start: "10:30AM", end: "11:00AM"},
            {day_of_week: day, start: "11:00AM", end: "11:30AM"},
            {day_of_week: day, start: "11:30AM", end: "12:00PM"},
            {day_of_week: day, start: "12:00PM", end: "12:30PM"},
            {day_of_week: day, start: "12:30PM", end: "1:00PM"},
            {day_of_week: day, start: "1:00PM", end: "1:30PM"},
            {day_of_week: day, start: "1:30PM", end: "2:00PM"},
            {day_of_week: day, start: "2:00PM", end: "2:30PM"},
            {day_of_week: day, start: "2:30PM", end: "3:00PM"},
            {day_of_week: day, start: "3:00PM", end: "3:30PM"},
            {day_of_week: day, start: "3:30PM", end: "4:00PM"},
            {day_of_week: day, start: "4:00PM", end: "4:30PM"},
            {day_of_week: day, start: "4:30PM", end: "5:00PM"},
            {day_of_week: day, start: "5:00PM", end: "5:30PM"},
            {day_of_week: day, start: "5:30PM", end: "6:00PM"},]
end

events.each do |event|
  Event.create!(event)
end
hours.each do |hour|
  AvailableHour.create!(hour)
end

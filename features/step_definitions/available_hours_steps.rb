Then(/^I should( not)? be signed up to be available on (.*) at (.*)$/) do |neg, day, time|
  hour = AvailableHour.where(:day_of_week => day, :start => time).first
  @current_user.available_hours.include?(hour) != neg
end

Given(/^I have already signed up for (.*) at (.*)$/) do |day, time|
  hour = AvailableHour.create(day_of_week: day, start: time, end: "8:30AM")
  @current_user.available_hours << hour
end

When(/^I select "(.*)"$/) do |box|
  day = box.split(", ")
  AvailableHour.create(day_of_week: day[0], start: day[1], end: "8:30AM")
  check("available_hours_" + box)
  click_button("Save Available hours")
end

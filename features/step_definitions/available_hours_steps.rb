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

And(/^"(.*)" is available at "(.*)"$/) do |user, hour|
  name = user.split(" ")
  @user = User.create({email: "coolemailbro@gmail.com", password: "12345678", first_name: name[0], last_name: name[1],
    volunteer: true})
  day = hour.split(", ")
  hour = AvailableHour.create(day_of_week: day[0], start: day[1], end: "8:30AM")
  @user.available_hours << hour
end

When(/^I look at the available volunteers for "(.*)"$/) do |hour|
  day = hour.split(", ")
  @hour = AvailableHour.where(day_of_week: day[0], start: day[1]).first
  visit path_to("the admin path for #{@hour.id}")
end

Then(/^I should see a that "(.*)" is available/) do |user|
  name = user.split(" ")
  @user = User.where(:first_name => name[0], :last_name => name[1]).first
  click_link("User \#" + "#{@user.id}")
end

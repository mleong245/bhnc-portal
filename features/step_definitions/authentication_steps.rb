require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

#Populating the database

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    currentUser = User.find_by_email(user[:email])
    if not currentUser or not currentUser.first_name == user[:first_name] or not currentUser.last_name == user[:last_name]
      User.create(user)
    end
  end
end

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    currentEvent = Event.find_by_name(event[:name])
    if not currentEvent or not currentEvent.location == event[:location] or not currentEvent.starts_at == event[:starts_at]
      Event.create(event)
    end
  end
end

Given /I am signed in as admin/ do
  User.create({:email => 'admin@gmail.com', :password => 'bhncadmin', :first_name => 'admin', :last_name => 'admin', :admin => true})
  step 'I am on the sign_in page'
  fill_in('user_email', :with => 'admin@gmail.com')
  fill_in('user_password', :with => 'bhncadmin')
  click_button('Log in')
end

Then /I give my log in information as the following: (.*)/ do |info|
  params = info.split(", ")
  fill_in("user_email", :with => params[0])
  fill_in("user_password", :with => params[1])
end

Then /I give my information as the following: (.*)/ do |info|
  params = info.split(", ")
  fill_in("user_first_name", :with => params[0])
  fill_in("user_last_name", :with => params[1])
  fill_in("user_email", :with => params[2])
  fill_in("user_password", :with => params[3])
  fill_in("user_password_confirmation", :with => params[4])
end

When /I try to create new event "(.*)" at "(.*)" on "(.*)" from "(.*)" to "(.*)"$/ do |name, location, date, start_time, end_time|
  fill_in("event_name", :with => name)
  fill_in("event_location", :with => location)
  fill_in("event_starts_at", :with => date + start_time)
  fill_in("event_end", :with => date + end_time)
  click_button("Save")
end

Given /that the date is "(.*)"$/ do |time|
  Timecop.freeze DateTime.parse(time)
end

When /I (try to sign up|have signed up) for "(.*)"$/ do |have, event|
  click_link("More about " + event)
  click_button("Register To Volunteer")
end

When /I try to unregister for "(.*)"$/ do |event|
  click_button("Unregister from Volunteering")
end

Then /I shouldn't be able to sign up for "(.*)"$/ do |event|
  page.should have_no_content("More about " + event)
end

#Necessary Web Steps

Given /^(?:|I )(should be|am?) on (.+)$/ do |should, page_name|
  if should == "am"
    visit path_to(page_name) if should == "am"
  else
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
  end
end

When /^(?:|I )(press|follow?) "([^"]*)"$/ do |press, button|
  click_button(button) if press == "press"
  click_link(button) if press == "follow"
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^(?:|I )should( not)? see "([^"]*)"$/ do |neg, text|
  if page.respond_to? :should
    page.should have_content(text) unless neg
    page.should have_no_content(text) if neg
  else
    assert page.has_content?(text) unless neg
    assert page.have_no_content(text) if neg
  end
end

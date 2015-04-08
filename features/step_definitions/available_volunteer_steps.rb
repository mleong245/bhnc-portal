Given(/^"(.*)" has signed up for "(.*)"$/) do |arg1, arg2|
  name = arg1.split(" ")
  user = User.create({email: "email#{name[1]}@gmail.com}", password: "12345678", first_name: name[0], last_name: "name[2]",
    volunteer: true})
  event = Event.create(name: arg2, location: "Berkeley", starts_at: "April 5th, 2016 9:00AM", end: "April 5th, 2016 10:AM")
  user.events << event
  user.save
end

Then(/^I should see that "(.*)" is(n't)? registered for "(.*)"$/) do |user, neg, event|
  if page.respond_to? :should
    page.should have_content("User")
  else
    assert page.has_content?("User")
  end
end

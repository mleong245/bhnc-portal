Given /"(.+)" has requested "(.+)"/ do |name, location|
  user = User.find_by_first_name(name)
  request = SpaceRentalRequest.create(:location => location, :start => DateTime.now, :end => DateTime.now)
  request.user = user
  request.save
end

Given /I am logged in as "(.+)"/ do |name|
  @user = User.find_by_first_name(name)
  step 'I am on the sign_in page'
  fill_in('user_email', :with => @user.email)
  fill_in('user_password', :with => '12345678')
  step %Q{I press "Log in"}
end

Then /I should see my own request/ do
  request = @user.space_rental_requests[0]
  step %Q{I should see "#{request.location}"}
  step %Q{I should see "#{request.display_time(request.start)}"}
  step %Q{I should see "#{request.display_time(request.end)}"}
end

Then /I should not see (.+)'s request/ do |name|
  user = User.find_by_first_name(name)
  request = user.space_rental_requests[0]
  has_location = page.body.index(request.location) != nil
  has_start_time = page.body.index(request.display_time(request.start)) != nil
  has_end_time = page.body.index(request.display_time(request.end)) != nil
  expect(has_location && has_start_time && has_end_time).to be_false
end

When /I go to my own request's page/ do
  request_id = @user.space_rental_requests[0].id
  visit(space_rental_request_path(request_id))
end

When /I go to (.+)'s request's page/ do |name|
  user = User.find_by_first_name(name)
  request_id = user.space_rental_requests[0].id
  visit(space_rental_request_path(request_id))
end

Given /I am an authenticated user/ do
  email = 'foo@gmail.com'
  password = '12345678'
  User.create({:email => email, :password => password, :first_name => 'foo', :last_name => 'bar'})
  step 'I am on the sign_in page'
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
  step %Q{I press "Log in"}
end

When /I request "(.+)" on (\d\d-\d\d-\d\d\d\d) from (\d\d:\d\d [AP]M) to (\d\d:\d\d [AP]M)/ do |location, day, start_time, end_time|
  select(location, :from => 'space_rental_request_location')
  date_vals = day.split('-')
  select(date_vals[2], :from => 'space_rental_request_start_1i')
  select(Date::MONTHNAMES[date_vals[0].to_i], :from => 'space_rental_request_start_2i')
  select(date_vals[1], :from => 'space_rental_request_start_3i')
  start_vals = start_time.split(/\W/)
  select("#{start_vals[0]} #{start_vals[2]}", :from => 'space_rental_request_start_4i')
  select(start_vals[1], :from => 'space_rental_request_start_5i')
  select(date_vals[2], :from => 'space_rental_request_end_1i')
  select(Date::MONTHNAMES[date_vals[0].to_i], :from => 'space_rental_request_end_2i')
  select(date_vals[1], :from => 'space_rental_request_end_3i')
  end_vals = end_time.split(/\W/)
  select("#{end_vals[0]} #{end_vals[2]}", :from => 'space_rental_request_end_4i')
  select(start_vals[1], :from => 'space_rental_request_end_5i')
  step %Q{I press "Create Space rental request"}
end

Given /"(.+)" is reserved on (\d\d-\d\d-\d\d\d\d) from (\d\d:\d\d [AP]M) to (\d\d:\d\d [AP]M)/ do |location, day, start_time, end_time|
  space_index = 5
  start_time = "#{start_time[0, 5]}:00 #{start_time[6,2]}"
  end_time = "#{end_time[0, 5]}:00 #{end_time[6,2]}"
  start_datetime = DateTime.strptime("#{day} #{start_time}", '%m-%d-%Y %I:%M:%S %p')
  end_datetime = DateTime.strptime("#{day} #{end_time}", '%m-%d-%Y %I:%M:%S %p')
  SpaceRentalRequest.create(:location => location, :start => start_datetime, :end => end_datetime, :approved => true)
end


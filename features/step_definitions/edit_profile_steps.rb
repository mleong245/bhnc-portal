Given /I am an authenticated volunteer with email "(.+)" and password "(.+)"/ do |email, password|
  @current_user = User.create({:email => email, :password => password, :first_name => 'foo', :last_name => 'bar', :volunteer => true})
  step 'I am on the sign_in page'
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
  step %Q{I press "Log in"}
end

Given /I am a perspective volunteer with email "(.+)" and password "(.+)"/ do |email, password|
  @current_user = User.create({:email => email, :password => password, :first_name => 'foo', :last_name => 'bar'})
  step 'I am on the sign_in page'
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
  step %Q{I press "Log in"}
end

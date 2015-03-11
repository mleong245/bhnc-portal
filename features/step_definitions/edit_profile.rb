Given /I am an authenticated volunteer/ do
  User.create({:email => 'foo@gmail.com', :password => '12345678', :first_name => 'foo', :last_name => 'bar'})
  step 'I am on the sign_in page'
  fill_in('user_email', :with => 'foo@gmail.com')
  fill_in('user_password', :with => '12345678')
  step %Q{I press "Log in"}
end

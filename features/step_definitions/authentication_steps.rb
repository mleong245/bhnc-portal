
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

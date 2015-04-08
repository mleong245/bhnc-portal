When /I try to sign up with the following information: (.*)/ do |info|
  params = info.split(", ")
  fill_in("volunteer_street_address", :with => params[0])
  fill_in("volunteer_city", :with => params[1])
  fill_in("volunteer_zip_code", :with => params[2])
  fill_in("volunteer_phone", :with => params[3])
  fill_in("volunteer_company", :with => params[4])
  click_button("Sign Up")
end

Then /I should( not)? have successfully signed up/ do |neg|
  message = neg  ? "Please check the format of your address and phone number" : "Successfully signed up!"
  page_name = neg ? "the volunteer sign up page" : "the landing page"
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
  page.should have_content(message)
end

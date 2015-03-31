Feature: Sign up to volunteer for BHNC

  As a person in the community
  So that I can start helping out at BHNC
  I want to be able to sign up to be a volunteer

Background:

  Given I am an authenticated volunteer with email "foo@gmail.com" and password "12345678"
  And I am on the landing page

Scenario: Sign up successfully (Happy path)

  When I follow "Volunteer Sign Up"
  And I fill in "volunteer_street_address" with "2020 Kittredge Street"
  And I fill in "volunteer_city" with "Berkeley"
  And I fill in "volunteer_zip_code" with "77777"
  And I fill in "volunteer_phone" with "4191250923"
  And I fill in "volunteer_company" with "UpDog"
  And I press "Sign Up"
  Then I should be on the landing page
  And I should see "Successfully signed up!"

Scenario: Entering characters into phone number (Sad path)

  When I follow "Volunteer Sign Up"
  And I fill in "volunteer_street_address" with "699 BlahTown"
  And I fill in "volunteer_city" with "Cow"
  And I fill in "volunteer_zip_code" with "77777"
  And I fill in "volunteer_phone" with "blah"
  And I fill in "volunteer_company" with "Lol"
  And I press "Sign Up"
  Then I should be on the volunteer sign up page
  And I should see "Please check the format of your address and phone number"

Scenario: Phone number is too long (Sad path)

  When I follow "Volunteer Sign Up"
  And I fill in "volunteer_street_address" with "244 Dah"
  And I fill in "volunteer_city" with "DahCity"
  And I fill in "volunteer_zip_code" with "77777"
  And I fill in "volunteer_phone" with "244999094812"
  And I fill in "volunteer_company" with "Lol"
  And I press "Sign Up"
  Then I should be on the volunteer sign up page
  And I should see "Please check the format of your address and phone number"

Scenario: Phone number is too short (Sad path)

  When I follow "Volunteer Sign Up"
  And I fill in "volunteer_street_address" with "092 Dah"
  And I fill in "volunteer_city" with "DahCity"
  And I fill in "volunteer_zip_code" with "77777"
  And I fill in "volunteer_phone" with "100"
  And I fill in "volunteer_company" with "Lol"
  And I press "Sign Up"
  Then I should be on the volunteer sign up page
  And I should see "Please check the format of your address and phone number"

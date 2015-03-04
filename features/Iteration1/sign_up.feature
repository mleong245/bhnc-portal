Feature: Sign up for the BHNC Website

  As a person interested in what BHNC offers
  I would like to create a BHNC account
  So that I can view their webpage

Background: Given I am on the sign up page

Scenario: Successful sign up (Happy Path)
  When I give my information as the following: Volunteer, email@gmail.com, 12345678, 12345678
  And I press 'Sign up'
  Then I should be on the confirmation page
  And I should see 'Welcome Volunteer!'

Scenario: Too short of password (Sad Path)
  When I give my information as the following: Volunteer, email@gmail.com, 123, 123
  And I press 'Sign up'
  Then I should be on the sign up page
  And I should see 'Password must be 8 or more characters'

Scenario: Passwords do not match (Sad Path)
  When I give my information as the following: Volunteer, email@gmail.com, 12345678, 12435678
  And I press 'Sign Up'
  Then I should be on the sign up page
  And I should see 'Confirmation Password does not match'

Scenario: Invalid Email (Sad Path)
  When I give my information as the following: Volunteer, email, 12345678, 12345678
  And I press 'Sign up'
  Then I should be on the sign up page
  And I should see 'Invalid email'

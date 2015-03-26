Feature: Sign up for the BHNC Website

  As a person interested in what BHNC offers
  I would like to create a BHNC account
  So that I can view their webpage

Scenario: Successful sign up (Happy Path)
  Given I am on the sign_up page
  When I give my information as the following: Rick, Pence, email@gmail.com, 12345678, 12345678
  And I press "Sign up"
  Then I should be on the landing page

Scenario: Too short of password (Sad Path)
  Given I am on the sign_up page
  When I give my information as the following: Rick, Pence, email@gmail.com, 123, 123
  And I press "Sign up"
  Then I should be on the users page
  And I should see "Password is too short (minimum is 8 characters)"

Scenario: Passwords do not match (Sad Path)
  Given I am on the sign_up page
  When I give my information as the following: Rick, Pence, email@gmail.com, 12345678, 12435678
  And I press "Sign up"
  Then I should be on the users page
  And I should see "Password confirmation doesn't match Password"

Scenario: Invalid Email (Sad Path)
  Given I am on the sign_up page
  When I give my information as the following: Rick, Pence, email, 12345678, 12345678
  And I press "Sign up"
  Then I should be on the users page

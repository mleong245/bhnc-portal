Feature: Become an admin after creating an account

  As a new user who is an official of BHNC
  I would like to become an Admin
  So that I can manage what I need to.

Background: User has signed up and is logged in

  Given I am on the "choose" page
  And   I see "Volunteer"
  And   I see "Admin"

Scenario: succesfully accessing (happy path)
  When  I press "Admin"
  Then  I should be on the "Admin" page
  And   I should see "Maintain"
  And   I should see "Observe"  

Scenario: unsuccessfully accessing the admin page (sad path)
  When  I press "Admin"
  Then  I should be on the "Admin Acess Restricted" page

Scenario: Sending a request to be an admin (happy path)
  Given I am on the "Admin Acess Restricted" page
  And   I press "Request to be an Admin"
  Then  I should be on the "choose" page
  And   I should see "Admin Request Sent"

Scenario: "Already Requested" message when requesting to be admin again (sad path)
  Given I am on the "Admin Acess Restricted" page
  And   I press "Request to be an Admin"
  Then  I should be on the "choose" page
  And   I should see "You have already requested to be an admin"


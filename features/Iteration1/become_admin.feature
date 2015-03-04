Feature: Become an admin after creating an account

  As a new user who is an official of BHNC
  I would like to become an Admin
  So that I can manage what I need to.

Background: User is logged in and is on landing page

  Given I am on the landing page
  And   I see "Volunteer"
  And   I see "Admin"

Scenario: Succesfully accessing admin page (happy path)
  When  I press "Admin"
  Then  I should be on the "Admin" page
  And   I should see "Maintain"
  And   I should see "Observe"  

Scenario: Unsuccessfully accessing admin page (sad path)
  When  I press "Admin"
  Then  I should be on the "Admin Acess Restricted" page

Scenario: Sending a request to be an admin (happy path)
  Given I am on the "Admin Acess Restricted" page
  And   I press "Request to be an Admin"
  Then  I should be on the landing page
  And   I should see "Admin Request Sent"

Scenario: "Already Requested" message when requesting to be admin again (sad path)
  Given I am on the "Admin Acess Restricted" page
  And   I press "Request to be an Admin"
  Then  I should be on the landing page
  And   I should see "You have already requested to be an admin"
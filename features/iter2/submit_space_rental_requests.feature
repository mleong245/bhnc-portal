Feature: Submit space rental requests

  As a community member
  So I can rent space for my own event
  I want to be able to request to use BHNC space
  
Background: User is logged in and on space rental request page
  Given I am an authenticated user
  And I am on the space rental requests page
  
Scenario: Successfully submit request
  When I request "Location1" on 03-30-2015 from 06:00 PM to 08:00 PM
  Then I should see "Space rental request was successfully submitted. An email will be sent to you if the request is approved."
  
Scenario: Conflicting time
  Given "Location1" is reserved on 03-30-2015 from 06:00 PM to 08:00 PM
  And I request "Location1" on 03-30-2015 from 07:00 PM to 08:00 PM
  Then I should see "Location1 is reserved at that time"

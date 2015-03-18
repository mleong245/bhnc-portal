Feature: Submit space rental requests

  As a community member
  So I can rent space for my own event
  I want to be able to request to use BHNC space
  
Background: User is logged in and on space rental request page
  Given I am DELETE an authenticated user
  And I am on DELETE the space rental page
  
Scenario: Successfully submit request
  When I request "Building1" from "6:00" to "8:00"
  Then I should see DELETE "Request successfully submitted. An email will be sent to you if the request is approved."
  
Scenario: Conflicting time
  Given "Building1" is reserved from "6:00" to "8:00"
  And I request "Building1" from "7:00" to "8:00"
  Then I should see DELETE "Building1 is reserved at that time"
  
Scenario: Blank fields
  When I request "Building" from "" to "8:00"
  Then I should see DELETE "Start Time can't be blank"
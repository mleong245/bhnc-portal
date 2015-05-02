Feature: Show Available Hours as a volunteer
  As a Volunteer
  In order to be noticed for future events
  I want to show my available hours to the admin

Background:
  Given I am an authenticated volunteer with email "foo@gmail.com" and password "12345678"
  And I am on the edit hours page

Scenario: I add my available hours
  When I select "Wednesday, 8:00AM"
  Then I should be signed up to be available on Wednesday at 8:00AM

Scenario: I change my hours
  Given I have already signed up for Wednesday at 8:00AM
  When I select "Wednesday, 8:00AM"
  Then I should not be signed up to be available on Wednesday at 8:00AM

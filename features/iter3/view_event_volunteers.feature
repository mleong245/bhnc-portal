Feature: View available volunteers

  As a BHNC official
  I would like to be able to view the volunteers who have signed up for an event
  So that I can keep track of who is helping for specific events

Background:
  Given I am signed in as admin
  And I am on the admin events page
  And "User First" has signed up for "Event 1"
  And "User Second" has signed up for "Event 2"

Scenario: View registered volunteers (Happy Path)
  Then I should see that "User First" is registered for "Event 1"
  And I should see that "User Second" is registered for "Event 2"

Scenario: View registered volunteers (Sad Path)
  Then I should see that "User First" isn't registered for "Event 2"
  And I should see that "User Second" isn't registered for "Event 1"

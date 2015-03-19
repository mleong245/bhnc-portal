Feature: Create volunteer events

  As a BHNC official
  I would like to be able to create a new event
  so that I can better organize the logistics of the volunteers, and so that volunteers can view the new event

Background:
  Given I am signed in as admin
  And I am on the create new event page

Scenario: Create event (Happy Path)
  Given I try to create new event "Event 1" at "location 1" on "March 30th, 2015" from "8:00am" to "2:00PM"
  Then I should be on the admin dashboard page
  And I should see that the event was successfully created.

Scenario: Create event with no name (Sad Path)
  Given I try to create new event "" at "location 1" on "March 30th, 2015" from "8:00am" to "2:00PM"
  Then I should be on the create new event page
  And I should see that the event was not successfully created.

Scenario: Create event without date (Sad Path)
  Given I try to create new event "Event 1" at "location 1" on "" from "8:00am" to "2:00PM"
  Then I should be on the create new event page
  And I should see that the event was not successfully created.

Scenario: Create event without times (Sad Path)
  Given I try to create new event "Event 1" at "location 1" on "March 30th, 2015" from "" to ""
  Then I should be on the create new event page
  And I should see that the event was not successfully created.

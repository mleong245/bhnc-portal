Feature: Create volunteer events

  As a BHNC official
  I would like to be able to create a new event
  so that I can better organize the logistics of the volunteers, and so that volunteers can view the new event

Background:
  Given I am signed in as admin
  And I am on the create new event page

Scenario: Create event (Happy Path)
  When I try to create new event "Event 1" at "location 1" on "March 30th, 2015" from "8:00am" to "2:00PM"
  Then I should be on the admin events page
  And I should see "Event successfully created"

Scenario: Create event with no name (Sad Path)
  When I try to create new event "" at "location 1" on "March 30th, 2015" from "8:00am" to "2:00PM"
  Then I should be on the create new event page
  And I should see "Event failed to be created"
  And I should see "Name can't be blank"

Scenario: Create event with no location (Sad Path)
  When I try to create new event "Event 1" at "" on "March 30th, 2015" from "8:00am" to "2:00PM"
  Then I should be on the create new event page
  And I should see "Event failed to be created"
  And I should see "Location can't be blank"

Scenario: Create event without date (Sad Path)
  When I try to create new event "Event 1" at "location 1" on "" from "" to ""
  Then I should be on the create new event page
  And I should see "Event failed to be created"
  And I should see "Start can't be blank"
  And I should see "End can't be blank"

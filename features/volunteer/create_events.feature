Feature: Create volunteer events

  As a BHNC official
  I would like to be able to create a new event
  so that I can better organize the logistics of the volunteers, and so that volunteers can view the new event

Background: Want to create a new event

Scenario: Go to the new events page when signed in as Admin from home page
  Given I am signed in as Admin
  When I press "add new event"
  Then I should be on the add new event page

Scenario: Add a new event from the add new event page
  Given I am signed in as Admin
  Given I am on the new event page
  And I fill in "Event name" with "Happy"
  And I fill in "Event date" with "A date"
  And I fill in "Event information" with "Info"
  And then I press "create new event"
  Then I should be on the home page
  And I should see ""Happy" has been added as a new event"

Scenario: Trying to add a new event with no date
  Given I am signed in as Admin
  Given I am on the new event page
  And I fill in "Event name" with "Happy"
  And I fill in "Event information" with "Info"
  And then I press "create new event"
  Then I should see "No proper date set for the event"

Scenario: Add a new event with no name
  Given I am signed in as Admin
  Given I am on the new event page
  And I fill in "Event date" with "A date"
  And I fill in "Event information" with "Info"
  And then I press "create new event"
  Then I should see "There is no Name for the event"

Scenario: Trying to add a new event with no Information
  Given I am signed in as Admin
  Given I am on the new event page
  And I fill in "Event name" with "Happy"
  And I fill in "Event date" with "A date"
  And then I press "create new event"
  Then I should see "There is no Information for the Event"

Scenario: Trying to add an invalid date
  Given I am signed in as Admin
  Given I am on the new event page
  And I fill in "Event name" with "Happy"
  And I fill in "Event date" with "A date"
  And I fill in "Event information" with "Info"
  And then I press "create new event"
  Then I should see "Invalid date"
Feature: View available volunteers

  As a BHNC official
  I would like to be able to view hours that volunteers are available
  So that I can contact individuals if I need additional help

Background:
  Given I am signed in as admin
  And I am on the admin landing page
  And "User One" is available at "Sunday, 8:00AM"

Scenario: View available volunteers (Happy Path)
  When I look at the available volunteers for "Sunday, 8:00AM"
  Then I should see a that "User One" is available

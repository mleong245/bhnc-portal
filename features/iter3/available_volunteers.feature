Feature: View available volunteers

  As a BHNC official
  I would like to be able to view hours that volunteers are available
  So that I can contact individuals if I need additional help/

Background:
  Given I am signed in as admin
  And I am on the admin landing page

Scenario: View available volunteers (Happy Path)
  When I look at the available volunteers
  Then I should see a list of volunteers who are currently available
  And I should not see any people who are not currently available

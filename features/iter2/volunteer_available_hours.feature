Feature: Show Available Hours as a volunteer
  As a Volunteer
  In order to be noticed for future events
  I want to show my available hours to the admin

  Scenario: Go to the Edit Available Hours page
    Given I am on the landing page
    Then I should be able to edit my available hours

  Scenario: When I am on the edit hours page
    Given I am on the edit hours page
    Then I should see the calendar
    And I should not see "Sign up as a volunteer"

  Scenario: What should I see on the calendar
    Given I am on the edit hours page
    Then I should see the appropriate info in the calendar

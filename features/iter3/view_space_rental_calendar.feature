Feature: View space rental calendar
  As a community member
  So I can see when spaces are free to rent
  I want to see a calendar of when spaces are reserved

  Background:
    Given I am an authenticated user
    And it is the week of March 2nd 2015

  Scenario: See approved requests
    Given "Location1" is reserved on 03-02-2015 from 01:00 PM to 02:00 PM
    When I am on the landing page
    Then 03-02-15 from 1:00 PM to 2:00 PM should be highlighted on the calendar for "Location1"

  Scenario: Do not see unapproved requests
    Given I have submitted a request for "Location1" on 03-02-2015 from 01:00 PM to 02:00 PM
    And I am on the landing page
    Then 03-02-15 from 1:00 PM to 2:00 PM should not be highlighted on the calendar for "Location1"

  Scenario: Requests in different locations are on different calendars
    Given "Location1" is reserved on 03-02-2015 from 01:00 PM to 02:00 PM
    And "Location2" is reserved on 03-02-2015 from 02:00 PM to 03:00 PM
    And "Location3" is reserved on 03-02-2015 from 03:00 PM to 04:00 PM
    When I am on the landing page
    Then 03-02-15 from 1:00 PM to 2:00 should be highlighted on the calendar for "Location1"
    Then 03-02-15 from 2:00 PM to 3:00 should be highlighted on the calendar for "Location2"
    Then 03-02-15 from 3:00 PM to 4:00 should be highlighted on the calendar for "Location3"

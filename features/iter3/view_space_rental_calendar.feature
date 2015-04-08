Feature: View space rental calendar
  As a community member
  So I can see when spaces are free to rent
  I want to see a calendar of when spaces are reserved
  
  Scenario: See approved requests
    Given DELETE "Location1" is reserved on 04-08-15 from 6:00 PM to 8:00 PM
    Then 04-08-15 from 6:00 to 8:00 should be highlighted
    And I should see the request description
    
  Scenario: Do not see unapproved requests
    Given I have submitted a request for "Location1" on 04-08-15 from 6:00 PM to 8:00 PM
    Then 04-08-15 from 6:00 to 8:00 should not be highlighted
    And I should not see the request description
    
  Scenario: Do not see past approved requests
    Given DELETE "Location1" is reserved on 01-01-15 from 1:00 PM to 2:00 PM
    Then 01-01-15 from 1:00 PM to 2:00 PM should not be highlighted
    And I should not see the request description
    
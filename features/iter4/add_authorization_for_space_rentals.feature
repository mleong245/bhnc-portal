Feature: Add authorization for space rental requests

  As a community member
  So I can easily find only my own rental requests
  I want to only be able to see requests I made
  
Background:
  Given the following users exist:
  | first_name | last_name | email             | password | password_confirmation |
  | Gabe       | Koo       | gabekoo@gmail.com | 12345678 | 12345678              |
  | Foo        | Bar       | foo@gmail.com     | 12345678 | 12345678              |
  And "Gabe" has requested "BHNC 515 Cortland St downstairs multipurpose room"
  And "Foo" has requested "ECC 4468 Mission Street"
  And I am logged in as "Gabe"

Scenario: Only see my own requests
  When I am on the space rental requests index page
  Then I should see my own request
  And I should not see Foo's request

Scenario: Can edit your own request
  When I go to my own request's page
  Then I should see my own request

Scenario: Can't edit another person's request
  When I go to Foo's request's page
  Then I should be on the space rental requests index page

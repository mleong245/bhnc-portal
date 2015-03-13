Feature: BHNC User sign in

  As a BHNC user
  So that I can access important information
  I would like to be able to sign in to my account

Background: users have been added to the database

  Given the following users exist:
  | first_name | last_name | email            | password | password_confirmation |
  | Rick       | Pence     | email1@gmail.com | 12345678 | 12345678              |
  | Jim        | Manning   | email2@gmail.com | 23456789 | 23456789              |
  | Bob        | Wayne     | email3@gmail.com | 34567890 | 34567890              |

  Given I am on the sign_in page

Scenario: Successful User sign in (Happy Path)
  When I give my log in information as the following: email1@gmail.com, 12345678
  And I press "Log in"
  Then I should be on the landing page

Scenario: Invalid email (Sad Path)
  When I give my log in information as the following: email2, 12345678
  And I press "Log in"
  Then I should be on the sign_in page
  And I should see "Invalid email or password"

Scenario: Email not a user (Sad Path)
  When I give my log in information as the following: email@gmail.com, 12345678
  And I press "Log in"
  Then I should be on the sign_in page
  And I should see "Invalid email or password"

Scenario: Invalid password (Sad Path)
  When I give my log in information as the following: email2@gmail.com, 12345678
  And I press "Log in"
  Then I should be on the sign_in page
  And I should see "Invalid email or password"

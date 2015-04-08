Feature: Confirm Volunteer by Officials

  As an official of BHNC
  I would like to see the list of volunteer applicants
  So that I can confirm and update their account permissions.

Background: Admin is logged in and is on admin landing page
  Given the following users exist:
  | first_name | last_name | email            | password | password_confirmation |
  | Rick       | Pence     | email1@gmail.com | 12345678 | 12345678              |
  | Jim        | Manning   | email2@gmail.com | 23456789 | 23456789              |
  | Bob        | Wayne     | email3@gmail.com | 34567890 | 34567890              |

  Given I am on the admin landing page
  And   I see "Users"

Scenario: Succesfully approve a volunteer (happy path)
    Given there is an application pending
    When I confirm the application
    Then the user is a confirmed volunteer


Scenario: Succesfully deny a volunteer (happy path)
    Given there is an application pending
    When I deny the application
    Then the user is denied



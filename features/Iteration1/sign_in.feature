Feature: BHNC User sign in

  As a BHNC user
  So that I can access important information
  I would like to be able to sign in to my account

Background: users have been added to the database

  Given the following users exist:
  | name           | email            | password |
  | Volunteer1     | email1@gmail.com | 12345678 |
  | Volunteer2     | email2@gmail.com | 23456789 |
  | Volunteer3     | email3@gmail.com | 34567890 |

  And I am on the sign in page

Scenario: Successful User sign in (Happy Path)
  When I give my log in information as the following: email1@gmail.com, 12345678
  And I press 'Sign in'
  Then I should be on the user landing page
  And I should see 'Welcome Volunteer1'

Scenario: Invalid email (Sad Path)
  When I give my log in information as the following: email2, 12345678
  And I press 'Sign in'
  Then I should be on the sign in page
  And I should see 'Invalid Email'

Scenario: Email not a user (Sad Path)
  When I give my log in information as the following: email@gmail.com, 12345678
  And I press 'Sign in'
  Then I should be on the sign in page
  And I should see 'This Email has not been registered'

Scenario: Invalid password (Sad Path)
  When I give my log in information as the following: email2@gmail.com, 12345678
  And I press 'Sign in'
  Then I should be on the sign in page
  And I should see 'Invalid Password'

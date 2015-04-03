Feature: View future opportunities to volunteer for BHNC

  As a confirmed volunteer
  I would like to see the dates and times of events
  so that I can sign up to volunteer for them

Background: events have been added to the database

  Given the following events exist:
  | name          |location    | starts_at        | end              |
  | Event 1       |location 1  | 3-Mar-2015 8:00  | 3-Mar-2015 12:00 |
  | Event 2       |location 2  | 3-Mar-2015 13:00 | 3-Mar-2015 18:00 |
  | Event 3       |location 3  | 4-Mar-2015 8:00  | 4-Mar-2015 19:00 |

  And I am on the landing page

Scenario: Sign up to volunteer for upcoming event (Happy Path)
  Given that the date is "March 2nd 2015"
  And I am an authenticated volunteer with email "volunteer@gmail.com" and password "12345678"
  When I try to sign up for "Event 1"
  Then I should see "Successfully registered for Event 1!"

Scenario: Sign up to volunteer for past event (Sad Path)
  Given that the date is "March 4th 2015"
  And I am an authenticated volunteer with email "volunteer@gmail.com" and password "12345678"
  Then I shouldn't be able to sign up for "Event 1"

Scenario: Unregister to volunteer for upcoming events (Happy Path)
  Given that the date is "March 2nd 2015"
  And I am an authenticated volunteer with email "volunteer@gmail.com" and password "12345678"
  And I have signed up for "Event 1"
  When I try to unregister for "Event 1"
  Then I should see "Successfully unregistered for Event 1"

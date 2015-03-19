Feature: View future opportunities to volunteer for BHNC

  As a confirmed volunteer
  I would like to see the dates and times of events
  so that I can sign up to volunteer for them

Background: events have been added to the database

  Given the following events exist:
  | name          |location    | date        | start | end   |
  | Event 1       |location 1  | 3-Mar-2015  | 8:00  | 12:00 |
  | Event 2       |location 2  | 3-Mar-2015  | 13:00 | 18:00 |
  | Event 3       |location 3  | 4-Mar-2015  | 8:00  | 19:00 |

  And I am on the volunteer dashboard page

Scenario: Sign up to volunteer for upcoming event (Happy Path)
  Given that the date is before "March 3rd, 2015"
  When I try to sign up for "Event 1"
  Then I should see that I successfully signed up

Scenario: Sign up to volunteer for past event (Sad Path)
  Givent that the date is after "march 3rd, 2015"
  Then I shouldn't be able to sign up for "Event 1"

Feature: View future opportunities to volunteer for BHNC

  As a confirmed volunteer
  I would like to see the dates and times of events
  so that I can sign up to volunteer for them

Background: events have been added to the database

  Given the following events exist:
  | name               | date        | start | end   |
  | Event 1            | 3-Mar-2015  | 8:00  | 12:00 |
  | Event 2            | 3-Mar-2015  | 13:00 | 18:00 |
  | Event 3            | 4-Mar-2015  | 8:00  | 19:00 |

  And I am on the volunteer dashboard page

Scenario:

Feature: View event details on calendar

  As a BHNC user
  I would like to see details about events
  So that I know whether I can volunteer for them

Background: Events have been added to the database

  Given the following events exist:
  | name          |location    | starts_at        | end              |
  | Event 1       |location 1  | 3-Mar-2015 8:00  | 3-Mar-2015 12:00 |
  | Event 2       |location 2  | 3-Mar-2015 13:00 | 3-Mar-2015 18:00 |
  | Event 3       |location 3  | 4-Mar-2015 8:00  | 4-Mar-2015 19:00 |

  And I am on the landing page

Scenario: Event details box shows up when I click on an event
  When I click for more information on "Event 1"
  Then I should see the details displayed for "Event 1"
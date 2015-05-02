Feature: Automated Emails

  As a BHNC admin,
  So that I don't have to manually keep track of emails,
  I would like it so that new users, approved volunteers, and approved space rentals are automatically emailed from the site.

Background:
  Given a user is signed up
  Given a user has applied to volunteer
  Given a user has applied to rent a space

Scenario: New User
  Then the user should have received a "Welcome to BHNC!" email

Scenario: Accepted Volunteer
  When a user is accepted as a confirmed volunteer
  Then the user should have received a "You have been approved as a volunteer!" email

Scenario: Denied Volunteer
  When a user is denied as a confirmed volunteer
  Then the user should have received a "Your volunteer application has been denied" email

Scenario: Accepted Rental Space Request
  When a user's rental space request is accepted
  Then the user should have received a "You rental request has been approved!" email

Scenario: Denied Rental Space Request
  When a user's rental space request is denied
  Then the user should have received a "Your rental request has been denied" email

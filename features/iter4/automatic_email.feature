Feature: Automated Emails

  As a BHNC admin,
  So that I don't have to manually keep track of emails,
  I would like it so that new users, approved volunteers, and approved space rentals are automatically emailed from the site.

Background:
   Given a user has applied to be a volunteer
   Given a user has applied to rent out a space
  
Scenario: New User
  When a new user signs up
  Then they should recieve a confirmation email

Scenario: Accepted Volunteer 
  When a user is accepted as a confirmed volunteer
  Then they should recieve a confirmation email

Scenario: Denied Volunteer
  When a user is denied as a confirmed volunteer
  Then they should recieve a denial email

Scenario: Accepted Rental Space Request
  When a user's rental space request is accepted
  Then they should recieve a confirmation email

Scenario: Denied Rental Space Request
  When a user's rental space request is denied
  Then they should recieve a denial email
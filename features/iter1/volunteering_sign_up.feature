Feature: Sign up to volunteer for BHNC

  As a person in the community
  So that I can start helping out at BHNC
  I want to be able to sign up to be a volunteer

Background:

  Given I am an authenticated volunteer with email "foo@gmail.com" and password "12345678"
  And I am on the landing page

Scenario: Sign up successfully (Happy path)

  When I follow "Volunteer Sign Up"
  When I try to sign up with the following information: 2020 Kittredge Street, Berkeley, 77777, 4191250923, UpDog
  Then I should have successfully signed up

Scenario: Entering characters into phone number (Sad path)

  When I follow "Volunteer Sign Up"
  When I try to sign up with the following information: 699 BlahTown Street, Cow, 77777, blah, Lol
  Then I should not have successfully signed up

Scenario: Phone number is too long (Sad path)

  When I follow "Volunteer Sign Up"
  When I try to sign up with the following information: 244 Dah Street, DahCity, 77777, 244999094812, lol
  Then I should not have successfully signed up

Scenario: Phone number is too short (Sad path)

  When I follow "Volunteer Sign Up"
  When I try to sign up with the following information: 244 Dah Street, DahCity, 77777, 2449, lol
  Then I should not have successfully signed up

Scenario: Improper street address (Sad Path)

  When I follow "Volunteer Sign Up"
  When I try to sign up with the following information: 699 BlahTown, Cow, 77777, 9163440879, Lol
  Then I should not have successfully signed up

Scenario: Improper zipcode

  When I follow "Volunteer Sign Up"
  When I try to sign up with the following information: 699 BlahTown street, Cow, 7777, 9163440879, Lol
  Then I should not have successfully signed up

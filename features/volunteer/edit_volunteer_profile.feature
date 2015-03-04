Feature: Edit volunteer profile

  As a confirmed volunteer
  I would like to be able to edit my personal info
  so that it accurately reflects my personal preferences

Background:
   Given I am on the edit profile page

Scenario: Edit name
    When I fill in "Name" with "Foo"
    And I press "Submit"
    Then I should be on the view profile page
    And I should see "Foo"
    And I should see "Name updated"
   
Scenario: Edit email
    When I fill in "Email" with "test@gmail.com"
    And I press "Submit"
    Then I should be on the view profile page
    And I should see "test@gmail.com"
    And I should see "Email updated"
    
Scenario: Change password
    When I fill in "Password" with "password"
    And I fill in "Confirm password" with "password"
    And I press "Submit"
    Then I shoulde be on the view profile page
    And I should see "Password updated"
    
Scenario: Confirmation password doesn't match
    When I fill in "Password" with "password"
    And I fill in "Confirm password" with "12345678"
    And I press "Submit"
    Then I should be on the edit profile page
    And I should see "Passwords don't match"
    
Scenario: Blank field
    When I fill in "Name" with ""
    And I press "Submit"
    Then I sould be on the edit profile page
    And I should see "Name was left blank"
    

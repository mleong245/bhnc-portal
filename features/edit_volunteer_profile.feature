Feature: Edit volunteer profile

  As a confirmed volunteer
  I would like to be able to edit my personal info
  so that it accurately reflects my personal preferences

Background:
   Given I am an authenticated volunteer
   And I am on the edit profile page

Scenario: Edit name
    When I fill in "user_first_name" with "Foo"
    And I fill in "user_current_password" with "12345678"
    And I press "Update"
    Then I should be on the landing page
    And I should see "Your account has been updated successfully"
   
Scenario: Edit email
    When I fill in "user_email" with "test@gmail.com"
    And I fill in "user_current_password" with "12345678"
    And I press "Update"
    Then I should be on the landing page
    And I should see "Your account has been updated successfully"
    
Scenario: Change password
    When I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I fill in "user_current_password" with "12345678"
    And I press "Update"
    Then I should be on the landing page
    And I should see "Your account has been updated successfully"
    
Scenario: Confirmation password doesn't match
    When I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "12345678"
    And I fill in "user_current_password" with "12345678"
    And I press "Update"
    Then I should be on the users page
    And I should see "Password confirmation doesn't match"
    
Scenario: Blank fields don't change the user's profile
    When I fill in "user_last_name" with "asdf"
    And I fill in "user_current_password" with "12345678"
    And I press "Update"
    Then I should be on the landing page
    And I should see "Your account has been updated successfully"
    

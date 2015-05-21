Feature: Login
  In order to use the system
  A user
  Should log in the system
 
  Scenario: admin post login form
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    When I press "commit"
    Then I should be on "homepage"

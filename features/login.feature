Feature: Login
    In order to use the system
    A user
    Should log in the system
 
    Scenario: admin post login form
    	Given exists an "admin_user user"
        Given I am on "login page"
        And I fill in "user login" with "adilson"
        And I fill in "user password" with "adilson123"
        When I press "submit"
        Then I should be on "homepage"

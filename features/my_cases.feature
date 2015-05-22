Feature: My Cases
    In order to use the system
    An "estagiario"
    Should see his own cases on the system
 
    Scenario: List my cases
        Given I am on "my cases"
        And I am estagiario with id "1"
        #And I fill in "user login" with "admin"
        #And I fill in "user password" with "password"
        #When I press "commit"
        Then I should see "1" on someone td list
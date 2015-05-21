Feature: RestrictAccess
  In order to Restrict Access to the system
  An unauthenticated user
  Should not view anything but the Login Page

  Scenario: Non authenticated user tries to Access 'Pessoas'
    Given I am not authenticated
    When I am on "pessoas page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'Pessoas'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "pessoas page"
 
  Scenario: Non authenticated user tries to Access 'Pessoas New'
    Given I am not authenticated
    When I am on "new pessoas page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'Pessoas New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new pessoas page"
    Then I should be on " new pessoas page"
  
  Scenario: Non authenticated user tries to Access 'estagiarios'
    Given I am not authenticated
    When I am on "estagiarios page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'estagiarios'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "estagiarios page"
 
  Scenario: Non authenticated user tries to Access 'estagiarios New'
    Given I am not authenticated
    When I am on "new estagiarios page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'estagiarios New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new estagiarios page"
    Then I should be on " new estagiarios page"
  
  Scenario: Non authenticated user tries to Access 'calouros'
    Given I am not authenticated
    When I am on "calouros page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'calouros'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "calouros page"
 
  Scenario: Non authenticated user tries to Access 'calouros New'
    Given I am not authenticated
    When I am on "new calouros page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'calouros New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new calouros page"
    Then I should be on " new calouros page"
  
  Scenario: Non authenticated user tries to Access 'vareiros'
    Given I am not authenticated
    When I am on "vareiros page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'vareiros'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "vareiros page"
 
  Scenario: Non authenticated user tries to Access 'vareiros New'
    Given I am not authenticated
    When I am on "new vareiros page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'vareiros New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new vareiros page"
    Then I should be on " new vareiros page"

  Scenario: Non authenticated user tries to Access 'membros'
    Given I am not authenticated
    When I am on "membros page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'membros'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "membros page"
 
  Scenario: Non authenticated user tries to Access 'membros New'
    Given I am not authenticated
    When I am on "new membros page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'membros New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new membros page"
    Then I should be on " new membros page"

  Scenario: Non authenticated user tries to Access 'clientes'
    Given I am not authenticated
    When I am on "clientes page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'clientes'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "clientes page"
 
  Scenario: Non authenticated user tries to Access 'clientes New'
    Given I am not authenticated
    When I am on "new clientes page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'clientes New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new clientes page"
    Then I should be on " new clientes page"

  Scenario: Non authenticated user tries to Access 'relatos'
    Given I am not authenticated
    When I am on "relatos page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'relatos'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "relatos page"
 
  Scenario: Non authenticated user tries to Access 'relatos New'
    Given I am not authenticated
    When I am on "new relatos page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'relatos New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new relatos page"
    Then I should be on " new relatos page"

  Scenario: Non authenticated user tries to Access 'casos'
    Given I am not authenticated
    When I am on "casos page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'casos'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "casos page"
 
  Scenario: Non authenticated user tries to Access 'casos New'
    Given I am not authenticated
    When I am on "new casos page"
    Then I should be on "login page"

  Scenario: Authenticated user tries to Access 'casos New'
    Given I am on "login page"
    And I fill in "user login" with "admin"
    And I fill in "user password" with "password"
    And I press "commit"
    When I am on "new casos page"
    Then I should be on " new casos page"


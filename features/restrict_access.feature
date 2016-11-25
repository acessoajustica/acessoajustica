Feature: RestrictAccess
  In order to Restrict Access to the system
  An unauthenticated user
  Should not view anything but the Login Page

  Scenario: Non authenticated user tries to accesss 'Atendimentos'
    Given I am not authenticated
    When I am on "atendimentos page"
    Then I should be on "home page"

  Scenario: Authenticated estagiario tries to edit a Atendimento
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    And I am editing a atendimento
    Then I should see "Joana Silveira"

  Scenario: Non authenticated user tries to edit a 'Atendimento'
    Given I am not authenticated
    And exists a "atendimento" that belongs to an "estagiario and to a cliente"
    And I am editing a atendimento
    Then I should not see "Joana Silveira"

  Scenario: Non authenticated user tries to Access 'Pessoas'
    Given I am not authenticated
    When I am on "pessoas page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'Pessoas'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "pessoas page"

  Scenario: Non authenticated user tries to Access 'Pessoas New'
    Given I am not authenticated
    When I am on "new pessoas page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'Pessoas New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new pessoas page"
    Then I should be on "new pessoas page"

  Scenario: Non authenticated user tries to Access 'estagiarios'
    Given I am not authenticated
    When I am on "estagiarios page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'estagiarios'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "estagiarios page"

  Scenario: Non authenticated user tries to Access 'estagiarios New'
    Given I am not authenticated
    When I am on "new estagiarios page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'estagiarios New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new estagiarios page"
    Then I should be on "new estagiarios page"

  Scenario: Authenticated estagiario tries to Access 'estagiarios New'
    Given I am logged as "estagiario"
    When I am on "new estagiarios page"
    Then I should be on "home page"

  Scenario: Non authenticated user tries to Access 'calouros'
    Given I am not authenticated
    When I am on "calouros page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'calouros'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "calouros page"

  Scenario: Non authenticated user tries to Access 'calouros New'
    Given I am not authenticated
    When I am on "new calouros page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'calouros New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new calouros page"
    Then I should be on "new calouros page"

  Scenario: Non authenticated user tries to Access 'vareiros'
    Given I am not authenticated
    When I am on "vareiros page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'vareiros'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "vareiros page"

  Scenario: Non authenticated user tries to Access 'vareiros New'
    Given I am not authenticated
    When I am on "new vareiros page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'vareiros New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new vareiros page"
    Then I should be on "new vareiros page"

  Scenario: Non authenticated user tries to Access 'membros'
    Given I am not authenticated
    When I am on "membros page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'membros'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "membros page"

  Scenario: Non authenticated user tries to Access 'membros New'
    Given I am not authenticated
    When I am on "new membros page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'membros New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new membros page"
    Then I should be on "new membros page"

  Scenario: Non authenticated user tries to Access 'clientes'
    Given I am not authenticated
    When I am on "clientes page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'clientes'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "clientes page"
    Then I should be on "clientes page"

  Scenario: Non authenticated user tries to Access 'new clientes page'
    Given I am not authenticated
    When I am on "new clientes page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'clientes New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new clientes page"
    Then I should be on "new clientes page"

  Scenario: Authenticated estagiario tries to Access 'clientes New'
    Given I am logged as "estagiario"
    When I am on "new clientes page"
    Then I should be on "home page"

  Scenario: Non authenticated user tries to Access 'atendimentos'
    Given I am not authenticated
    When I am on "atendimentos page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'atendimentos'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "atendimentos page"

  Scenario: Non authenticated user tries to Access 'atendimentos New'
    Given I am not authenticated
    When I am on "new atendimentos page"
    Then I should be on "home page"

  Scenario: Authenticated user tries to Access 'atendimentos New'
    Given exists an "admin_user user"
    And I am on "login page"
    And I fill in "user login" with "adilson"
    And I fill in "user password" with "adilson123"
    And I press "submit"
    When I am on "new atendimentos page"
    Then I should be on "new atendimentos page"

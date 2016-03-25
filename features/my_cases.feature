Feature: My Cases
  In order to use the system
  An "estagiario"
  Should see his own cases on the system

  Scenario: List my cases
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    When I am on "my cases"
    Then I should see "Joana Silveira"

  Scenario: List my cases
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    And exists a "atendimento" that belongs to an "another estagiario and to an another cliente"
    When I am on "my cases"
    Then I should see "Joana Silveira"
    But I should not see "Mario da Silva"

  Scenario: List my cases
    Given I am logged as "estagiario"
    And exists a "restless atendimento" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    When I am on "my cases"
    Then I should see "Joana Silveira"
    And I should see "Um relato inicial"

  Scenario: Access my cases
    Given I am logged as "estagiario"
    When I am on "login page"
    Then I should see "Meus Atendimentos"

  @javascript
  Scenario: User selects a case
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente"
    And I am on "the atendimentos page"
    And I click at css "#Joana_Silveira"
    And I wait a second
    When I click at css "#Escolher_0"
    And I wait a second
    Then I should not see "Joana Silveira"

  @javascript
  Scenario: User sees a selected case
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente"
    And I am on "the atendimentos page"
    And I click at css "#Joana_Silveira"
    And I wait a second
    When I click at css "#Escolher_0"
    And I wait a second
    And I am on "my atendimentos page"
    Then I should not see "Joana Silveira"

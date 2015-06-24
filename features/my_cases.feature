Feature: My Cases
  In order to use the system
  An "estagiario"
  Should see his own cases on the system

  Scenario: List my cases
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    When I am on "my cases"
    Then I should see "Joana Silveira"

  Scenario: List my cases
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    And exists a "caso" that belongs to an "another estagiario and to an another cliente"
    When I am on "my cases"
    # And I take a picture of the page
    Then I should see "Joana Silveira"
    But I should not see "Mario da Silva"

  @javascript
  Scenario: Expand the Accordion II (the return of accordion)
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "estagiario and to a cliente"
    And I am that estagiario
    When I am on "my cases"
    And I take "Maria" picture of the page
    When I click at css "#Joana_Silveira"
    And I wait a second
    And I take "Maria2" picture of the page
    Then I should see "Uma descrição"

  Scenario: List my cases
    Given I am logged as "estagiario"
    And exists a "restless caso" that belongs to an "estagiario and to a cliente"
    And I am that estagiario
    When I am on "my cases"
    Then I should see "Joana Silveira"
    And I should see "Uma descrição"
    And I should see "Outra descrição"
    And I should see "Mais uma descrição"

  Scenario: Access my cases
    Given I am logged as "estagiario"
    When I am on "login page"
    Then I should see "Meus Atendimentos"

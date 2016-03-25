Feature: Wait list
  As an 'Estagiário'
  I Want to see the wait list
  In order to select a open 'Atendimento'

  Scenario: Estagiário sees avaiable case
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente"
    And I am on "the atendimentos page"
    Then I should see "Joana Silveira"

  Scenario: Estagiário does not see a taken case
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente and to an estagiario"
    And exists a "atendimento" that belongs to an "another cliente"
    And I am on "the atendimentos page"
    Then I should not see "Joana Silveira"
    But I should see "Mario da Silva"

  Scenario: Estagiário does not see an old case
    Given I am logged as "estagiario"
    And exists an "old atendimento" that belongs to a "cliente"
    And exists a "atendimento" that belongs to an "another cliente"
    And I am on "the atendimentos page"
    Then I should not see "Joana Silveira"
    But I should see "Mario da Silva"

  Scenario: Estagiário does not see a rejected case
    Given I am logged as "estagiario"
    And exists a "rejected atendimento" that belongs to a "cliente"
    And exists a "atendimento" that belongs to an "another cliente"
    And I am on "the atendimentos page"
    Then I should not see "Joana Silveira"
    But I should see "Mario da Silva"

  Scenario: The Wait List is sorted
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "another cliente"
    And exists a "atendimento" that belongs to a "cliente"
    And I am on "the atendimentos page"
    Then the list should be sorted by "register_time"

  Scenario: See Atendimento Type
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente and to a atendimento_type"
    And I am on "the atendimentos page"
    Then I should see "Criminal"

  Scenario: See Atendimento Time
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente"
    And I am on "the atendimentos page"
    Then I should see the pattern "\d\d:\d\d"

  @javascript
  Scenario: Select a atendimento
    Given I am logged as "estagiario"
    And exists a "atendimento" that belongs to a "cliente"
    And I am on "the atendimentos page"
    When I click at css "#Joana_Silveira"
    And I wait a second
    And I click at css "#Joana_Silveira"
    And I wait a second
    And I take "Joana" picture of the page
    Then I should not see "Um relato Inicial"

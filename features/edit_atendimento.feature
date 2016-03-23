Feature: Edit Atendimento
  In order to update or classify a Atendimento
  An estagiario
  Should edit the atendimento

  @javascript
  Scenario: Add new Relato
    Given I am logged as "estagiario"
    And I am editing a atendimento
    When I fill in "atendimento new relato" with "Mais um novo relato"
    And I press "Atualizar Atendimento"
    And I wait a second
    And I take "newAtendimento" picture of the page
    Then I should see "Atendimento was successfully updated"

  Scenario: Update a category
    Given I am logged as "estagiario"
    And I am editing a atendimento
    When I select the option "Aprovado" in "atendimento status"
    And I press "Atualizar Atendimento"
    Then I should see "Status: true"

  Scenario: Update a atendimento type
    Given I am logged as "estagiario"
    And exists a "atendimento_type"
    And I am editing a atendimento
    When I select the option "Criminal" in "atendimento atendimento type id"
    And I press "Atualizar Atendimento"
    Then I should see "Atendimento was successfully updated"

  Scenario: See old Relato
    Given I am logged as "estagiario"
    And I am editing a atendimento
    Then I should see "Uma descrição"

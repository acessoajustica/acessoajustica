Feature: Edit Atendimento
  In order to update or classify a Atendimento
  An estagiario
  Should edit the atendimento

  Scenario: Add Relato Inicial
    Given I am logged as "estagiario"
    And I am editing a atendimento
    When I fill in "atendimento relato inicial" with "Mais um novo relato"
    And I press "Atualizar Atendimento"
    Then I should see "Atendimento atualizado com sucesso"

  Scenario: Add Relato Detalhado
    Given I am logged as "estagiario"
    And I am editing a atendimento
    When I fill in "atendimento relato detalhado" with "Mais um novo relato detalhado"
    And I press "Atualizar Atendimento"
    Then I should see "Atendimento atualizado com sucesso"

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
    Then I should see "Atendimento atualizado com sucesso"

  Scenario: See old Relato
    Given I am logged as "estagiario"
    And I am editing a atendimento
    Then I should see "Um relato inicial"

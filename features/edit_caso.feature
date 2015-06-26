Feature: Edit Caso
  In order to update or classify a Caso
  An estagiario
  Should edit the caso

  Scenario: Add new Relato
    Given I am logged as "estagiario"
    And I am editing a caso
    When I fill in "caso new relato" with "Mais um novo relato"
    And I press "Atualizar Caso"
    Then I should see "Caso was successfully updated"

  Scenario: Update a category
    Given I am logged as "estagiario"
    And I am editing a caso
    When I select the option "Aprovado" in "caso status"
    And I press "Atualizar Caso"
    Then I should see "Status: true"

  Scenario: Update a caso type
    Given I am logged as "estagiario"
    And exists a "caso_type"
    And I am editing a caso
    When I select the option "Criminal" in "caso caso type id"
    And I press "Atualizar Caso"
    Then I should see "Caso was successfully updated"

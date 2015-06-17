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
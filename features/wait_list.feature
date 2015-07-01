Feature: Wait list
  As an 'Estagiário'
  I Want to see the wait list
  In order to select a open 'Caso'

  Scenario: Estagiário sees avaiable case
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente"
    And I am on "the casos page"
    Then I should see "Joana Silveira"

  Scenario: Estagiário does not see a taken case
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente and to an estagiario"
    And exists a "caso" that belongs to an "another cliente"
    And I am on "the casos page"
    Then I should not see "Joana Silveira"
    But I should see "Mario da Silva"

  Scenario: Estagiário does not see an old case
    Given I am logged as "estagiario"
    And exists an "old caso" that belongs to a "cliente"
    And exists a "caso" that belongs to an "another cliente"
    And I am on "the casos page"
    Then I should not see "Joana Silveira"
    But I should see "Mario da Silva"

  Scenario: Estagiário does not see a rejected case
    Given I am logged as "estagiario"
    And exists a "rejected caso" that belongs to a "cliente"
    And exists a "caso" that belongs to an "another cliente"
    And I am on "the casos page"
    Then I should not see "Joana Silveira"
    But I should see "Mario da Silva"

  Scenario: The Wait List is sorted
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "another cliente"
    And exists a "caso" that belongs to a "cliente"
    And I am on "the casos page"
    Then the list should be sorted by "register_time"
  
  @javascript
  Scenario: Accordion not Clicked
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente"
    And I am on "the casos page"
    Then I should not see "Uma descrição"

  @javascript
  Scenario: Expand the Accordion
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente"
    And I am on "the casos page"
    When I click at css "#Joana_Silveira"
    And I wait a second
    Then I should see "Uma descrição"

  @javascript
  Scenario: Contract the Accordion
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente"
    And I am on "the casos page"
    When I click at css "#Joana_Silveira"
    And I wait a second
    And I click at css "#Joana_Silveira"
    And I wait a second
    Then I should not see "Uma descrição"

  Scenario: See Caso Type
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente and to a caso_type"
    And I am on "the casos page"
    Then I should see "Criminal"

  Scenario: See Caso Time
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente"
    And I am on "the casos page"
    Then I should see the pattern "\d\d:\d\d"

  @javascript
  Scenario: Select a caso
    Given I am logged as "estagiario"
    And exists a "caso" that belongs to a "cliente" 
    And I am on "the casos page"
    When I click at css "#Joana_Silveira"
    And I wait a second
    And I click at css "#Joana_Silveira"
    And I wait a second
    And I take "Joana" picture of the page
    Then I should not see "Uma Descrição"

Feature: My Cases
    In order to use the system
    An "estagiario"
    Should see his own cases on the system
 
    Scenario: List my cases
        Given I am logged as "estagiario"
        And exists a "caso" that belongs to an "estagiario"
        When I am on "my cases"


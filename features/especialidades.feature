Feature: Register a Cliente
  As a 'Admin'
  I Want to register a 'Estagiario' with especialidade'
  In order to know with 'atendimento he can take'

  @javascript
  Scenario: Creating a estagiario
    Given I am logged as "admin"
    And exists a "estagiario_role role"
    And exists an "especialidade"
    And I am on "the homepage"
    When I click on "Usuários" link
    When I click on "Cadastrar Usuário" link
    And I fill in "user username" with "username"
    And I fill in "user email" with "username@teste.com"
    And I fill in "user password" with "password"
    And I fill in "user password confirmation" with "password"
    And I select the option "estagiário" in "user role ids"
    And I press "Próximo"
    And I wait a second
    And I take "FotoEstagiario" picture of the page
    And I fill in "estagiario nome" with "Estela"
    And I fill in "estagiario nome da mae" with "Estér"
    And I fill in "estagiario cpf" with "123.456.789.10"
    And I fill in "estagiario rg" with "11.234.567-0"
    And I fill in "estagiario identidade de genero" with "Mulher"
    And I fill in "estagiario ano faculdade" with "2015-07-01"
    And I select the option "Ovos" in "estagiario especialidades"
    And I press "Criar Estagiario"
    Then I should see "Ovos"

Feature: Register a Cliente
  As a 'Calouro'
  I Want to register a 'Cliente'
  In order to create a 'Caso'

  Scenario: Register a valid 'Cliente'
  	Given I am logged as "calouro"
    And exists a "moradia_type"
  	And exists a "estado_civil"
  	And I am on "clientes new"
  	When I fill in "cliente nome" with "Fernanda Monteiro"
  	And I fill in "cliente nome da mae" with "Mariana Monteiro"
  	And I fill in "cliente cpf" with "111.111.111-1"
  	And I fill in "cliente rg" with "11.111.111-1"
  	And I fill in "cliente cor" with "amarelo"
  	And I fill in "cliente identidade de genero" with "Feminino"
  	And I select the option "Solteiro" in "cliente estado civil id"
  	And I select the option "Casa" in "cliente moradia type id"
  	And I press "Criar Cliente"
  	Then I should see "Cliente was successfully created."

  @wip
  Scenario: Register a valid 'Cliente'
  	Given I am logged as "calouro"
  	And exists a "moradia_type"
  	And I am on "clientes new"
  	When I fill in "cliente nome" with ""
  	And I fill in "cliente nome da mae" with "Mariana Monteiro"
  	And I fill in "cliente cpf" with "111.111.111-1"
  	And I fill in "cliente rg" with "11.111.111-1"
  	And I fill in "cliente cor" with "amarelo"
  	And I fill in "cliente identidade de genero" with "Feminino"
  	And I select the option "Solteiro" in "cliente estado civil id"
  	And I select the option "Casa" in "cliente moradia type id"
  	And I press "Criar Cliente"
  	Then I should see "Cliente was successfully created."


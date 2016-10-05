Feature: Email about Caso
    Como um estagiário do DJ
    Quero receber e-mails referentes aos casos (processos) dos quais sou responsável
    Para validar o formato das informações

  Background: An email was sent to an estagiario

    @wip
    Scenario: An Estagiario received an email with its feed de Casos
      Given I received an email with subject "Blah"
      When I open the email
      Then I should see "José" in the email body

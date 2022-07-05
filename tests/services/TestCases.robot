*** Settings ***
Documentation       Suíte de Exemplo de testes API com o Robot Framework
Resource            Steps.robot

Force Tags          @services

Suite Setup         Create Session      petfinder       ${HOST}

*** Test Case ***
Should find a animal filtered by type
    Given a valid credentials
    When to search for an animal by Dog type
    Then Return results matching animal Dog type

Should validate the return contains invalid parameters
    Given a valid credentials
    When to search for an animal by Dogs type
    Then message that request contains invalid parameters is return



*** Settings ***
Resource            Steps.robot
Force Tags          @web

Test Teardown       Close Browser

*** Test Case ***
Validar acesso ao blog robotizandotestes
    Given Open Page Using Chrome
    When Search for Printed Dress
    Then see the list with Printed Dress products 
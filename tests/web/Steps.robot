*** Settings ***
Library     SeleniumLibrary


*** Variable ***
${URL}                  http://automationpractice.com/

${LOGO}                 header_logo
${SEARCH}               search_query_top
${BTN_SEARCH}           css=.button-search
${TITLE_LIST}           css=.product-listing
${PRODUCT_LIST}         css=.product_list

*** Keywords ***
Open Page Using Chrome
    Open Browser        ${URL}          Chrome
    Maximize Browser Window

Search for ${product}
    Input Text      ${SEARCH}        ${product}
    Click Element   ${BTN_SEARCH}
    Wait Until Element Is Visible  ${PRODUCT_LIST}

see the list with ${product} products
    Wait Until Element Is Visible  ${TITLE_LIST}
    Title Should Be                Search - My Store
    Page Should Contain            ${product}
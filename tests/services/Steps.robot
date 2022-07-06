*** Settings ***
Library             RequestsLibrary
Library             Collections

Resource            Requests.robot

*** Variable ***
${HOST}             https://api.petfinder.com
# create credentials in https://www.petfinder.com/developers/
${CLIENT_ID}        ${ID}
${CLIENT_SECRET}    ${SECRET}

*** Keywords ***
a valid credentials
    ${response}=    Post access token

    Set Test Variable   ${access_token}    ${response.json()['access_token']}

to search for an animal by ${animal_type} type
    ${response}=    Get animals types
    ...             ${animal_type}

    Set Test Variable   ${response}    ${response}

Return results matching animal ${animal_type} type
    Status Should Be         200    ${response}
    Should Not Be Empty      ${response.json()['animals']}
    Should Not Be Empty      ${response.json()['animals'][0]['type']}
    Should Not Be Empty      ${response.json()['animals'][0]['species']}
    Should Not Be Empty      ${response.json()['animals'][0]['breeds']}
    Should Be Equal          ${response.json()['animals'][0]['type']}       ${animal_type}


message that request contains invalid parameters is return
    Status Should Be         400    ${response}
    Should Contain           ${response.json()['invalid-params'][0]['message']}       is not a valid animal type
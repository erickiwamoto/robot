*** Keywords ***
Post access token
    ${body}=        Create Dictionary
    ...             grant_type=client_credentials
    ...             client_id=${CLIENT_ID}
    ...             client_secret=${CLIENT_SECRET}

    ${response}=    POST On Session     petfinder
    ...             /v2/oauth2/token
    ...             json=${body}
    ...             expected_status=OK

    [Return]        ${response}


Get animals types
    [Arguments]     ${animal_type}
    ${header}=      Create Dictionary
    ...             Authorization=Bearer ${access_token}
        
    ${param}=       Create Dictionary
    ...             type=${animal_type}

    ${response}=    GET On Session     petfinder
    ...             /v2/animals
    ...             headers=${header}
    ...             params=${param}
    ...             expected_status=anything

    [Return]        ${response}

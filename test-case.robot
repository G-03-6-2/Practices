*** Settings ***
Library           RequestsLibrary


*** Keywords ***
Get Calculation JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    http://127.0.0.1:5000/calculate/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}

Get Hello Name
    [Arguments]    ${name}
    ${resp}=     GET    http://127.0.0.1:5000/hello/${name}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.text}

Get Is Prime
    [Arguments]    ${number}
    ${resp}=     GET    http://127.0.0.1:5000/is_prime/${number}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.text}

*** Test Cases ***
Test Calculate Numbers 20 and 20 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/calculate/20/20

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable  ${resp.json()}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${40}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${0}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${400}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${1}

Test Calculate Numbers 8.4 and 4 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/calculate/8.4/4

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable  ${resp.json()}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${12.4}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${4.4}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${33.6}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2.1}


Test Calculate Numbers 40 and 20

    ${json_resp}=    Get Calculation JSON    ${40}    ${20}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${60}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${20}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${800}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2}


Test Calculate Numbers 8.4 and 4

    ${json_resp}=    Get Calculation JSON    ${8.4}    ${4}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['plus']}    ${12.4}

    # Verify the response of minus operation
    Should Be Equal    ${json_resp['minus']}    ${4.4}

    # Verify the response of multiply operation
    Should Be Equal    ${json_resp['multiply']}    ${33.6}

    # Verify the response of divide operation
    Should Be Equal    ${json_resp['divide']}    ${2.1}

Test true when x is 1 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/is_prime/1

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal  ${resp.text}    False

Test true when x is 17 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/is_prime/17

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal  ${resp.text}    True

Test false when x is 36

    ${resp}=     Get Is Prime    ${36}

    Should Be Equal    ${resp}    False

Test false when x is 13219

    ${resp}=     Get Is Prime    ${13219}

    Should Be Equal    ${resp}    True

Test be 7 when x is 5 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/next2/5

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    Should Be Equal  ${resp.text}    7.0

Test be -3 when x is -5 (ฺBefore Using Keywords)

    ${resp}=     GET    http://127.0.0.1:5000/next2/-5
    Should Be Equal    ${resp.status_code}    ${200}
    Should Be Equal  ${resp.text}    -3.0

Test be 5.5 when x is 3.5 (ฺBefore Using Keywords)
    ${resp}=     GET    http://127.0.0.1:5000/next2/3.5
    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}
    Should Be Equal  ${resp.text}    5.5

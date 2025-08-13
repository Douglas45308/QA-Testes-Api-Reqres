*** Settings ***
Library           RequestsLibrary
Library           Collections
Suite Setup       Create Session    reqres    https://reqres.in

*** Variables ***
${API_KEY}        reqres-free-v1
&{HEADERS}        Content-Type=application/json    x-api-key=${API_KEY}



*** Test Cases ***

Consulta de usuário existente
    [Documentation]    Verifica se a consulta ao usuário ID 2 retorna status 200 e os campos esperados.
    ${response}=    GET On Session    reqres    /api/users/2    headers=&{HEADERS}
    Should Be Equal As Integers    ${response.status_code}    200

    ${json}=    To JSON    ${response.text}
    Dictionary Should Contain Key    ${json}         data
    Dictionary Should Contain Key    ${json['data']}    id
    Dictionary Should Contain Key    ${json['data']}    email
    Dictionary Should Contain Key    ${json['data']}    first_name
    Dictionary Should Contain Key    ${json['data']}    last_name
    Should Be Equal As Integers    ${json['data']['id']}    2
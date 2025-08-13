*** Settings ***
Library           RequestsLibrary
Library           Collections
Suite Setup       Create Session    reqres    https://reqres.in

*** Variables ***
${API_KEY}        reqres-free-v1
&{HEADERS}        Content-Type=application/json    x-api-key=${API_KEY}

*** Test Cases ***
Cadastro de usuário com sucesso
    [Documentation]    Verifica se o cadastro de usuário retorna status 201 e os campos esperados.
    &{body}=    Create Dictionary    name=Maria Silva    job=QA Engineer

    ${response}=    POST On Session    reqres    /api/users    headers=&{HEADERS}    json=&{body}

    Log    Status Code: ${response.status_code}
    Log    Response: ${response.text}

    Should Be Equal As Integers    ${response.status_code}    201

    ${json}=    To JSON    ${response.text}
    Dictionary Should Contain Key    ${json}    id
    Dictionary Should Contain Key    ${json}    createdAt
    Should Be Equal    ${json['name']}    Maria Silva
    Should Be Equal    ${json['job']}     QA Engineer


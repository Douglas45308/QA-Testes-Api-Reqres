*** Settings ***
Library           RequestsLibrary
Library           Collections
Suite Setup       Create Session    reqres    https://reqres.in

*** Variables ***
${API_KEY}        reqres-free-v1
&{HEADERS}        Content-Type=application/json    x-api-key=${API_KEY}



*** Test Cases ***
Consulta de usuário inexistente
    [Documentation]    Verifica se a consulta ao usuário ID 999 retorna status 404.
    ${response}=    Get Request    reqres    /api/users/999    headers=${HEADERS}
    Should Be Equal As Integers    ${response.status_code}    404
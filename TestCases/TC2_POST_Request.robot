*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}=    https://reqres.in/

*** Test Cases ***
Put_Customer
    create session  mysession   ${base_url}
    ${body}=    create dictionary   name=morpheus   job=leader    id=948    createdAt=2022-10-10T11:47:40.024Z
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request  mysession     /api/users      data=${body}        headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #VALIDATION

    ${status_code}=     convert to string   ${response.status_code}
    should be equal  ${status_code}     201

    ${res_body}=        convert to string   ${response.content}
    should contain  ${res_body}     morpheus
    should contain  ${res_body}     leader
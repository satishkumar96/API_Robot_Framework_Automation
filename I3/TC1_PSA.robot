*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem
Library  BuiltIn
Library  JSONLibrary
Library  get_api.py

*** Variables ***
${base_url}     https://alpha4-api.payschools.com

*** Test Cases ***
Create Token PSA
    ${token}=  get_api.Get Token
    Set Global Variable     ${token}

Get User Details(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/user     headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get Menu details(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/Menu   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get All Active Schools(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school/All/Active   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get all schools(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get details about one particular School(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school/69   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get Schools based on particular district by status as False(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school/District/2/false   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get Permission details(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/Permission/Fee   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Delete Token(DELETE)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    delete on session  mysession  /v2/public/user     headers=${headers}

    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}
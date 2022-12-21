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
Get API Token
    ${token}=  get_api.Get Token
    Set Global Variable     ${token}

Get All Districts(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/District     headers=${headers}
    log     ${response.content}

Get Active Districts(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/District/All/Active     headers=${headers}
    log     ${response.content}

Get Include Inactive Districts(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/District/user     headers=${headers}
    log     ${response.content}
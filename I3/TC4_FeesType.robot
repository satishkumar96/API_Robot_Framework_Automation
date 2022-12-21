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

Get Fee Type(s) based on District and by status(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/FeeType/District/3     headers=${headers}
    log     ${response.content}

Get all Active/Inactive Fee Type(s) across all District(s) and School(s)(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/FeeType     headers=${headers}
    log     ${response.content}

Get Fee type by district number and status(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/FeeType/District/2     headers=${headers}
    log     ${response.content}

Get All Fee types across all districts(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/FeeType/All/Active     headers=${headers}
    log     ${response.content}

Get Particular Fee type details(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/FeeType/1     headers=${headers}
    log     ${response.content}

Get Fee type by district number and status(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/FeeType/District/2     headers=${headers}
    log     ${response.content}
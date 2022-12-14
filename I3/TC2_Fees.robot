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
    [Documentation]
    ${token}=  get_api.Get Token
    Set Global Variable     ${token}

GET Fees by Search(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/user     headers=${headers}
    log     ${response.content}

GET Fees for Edit Clone(GET)
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/Fee/8     headers=${headers}
    log     ${response.content}
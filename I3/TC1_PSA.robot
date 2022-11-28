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
#    create session  mysession   ${base_url}
#    ${body}=    create dictionary   UserName=ChimeraQA   Password=QA2022Testing    URL=https://alpha4a-test.sdms2.com/
#    ${header}=  create dictionary   Content-Type=application/json   Authorization=Token NewAdminKey1
#    ${response}=    post request  mysession     /v2/public/Authentication      data=${body}        headers=${header}
#
#    log  ${response.status_code}
#    log  ${response.json()}
#    log  ${response.headers}
#
#    ${value}=   get value from json  ${response.json()}     $.APIKey
#    ${api_string}=  convert to string  ${value[0]}
#    ${token} =   Catenate    Token ${api_string}
    ${token}=  get_api.Get Token
    Set Global Variable     ${token}

#    ${api}=     get_api.Get Token
#    log   ${api}

Get User Details
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/user     headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get Menu details
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/Menu   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get All Active Schools
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school/All/Active   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get all schools
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get details about one particular School
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school/69   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get Schools based on particular district by status as False
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/school/District/2/false   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Get Permission details
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    GET On Session  mysession  /v2/public/Permission/Fee   headers=${headers}
    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}

Delete Token
    create session  mysession   ${base_url}
    ${headers}=     create dictionary  Content-Type=application/json    Authorization=${token}
    ${response}=    delete on session  mysession  /v2/public/user     headers=${headers}

    log     ${response.content}
    log     ${response.status_code}
    log     ${response.headers}
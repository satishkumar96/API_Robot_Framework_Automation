*** Settings ***
Library  RequestsLibrary
Library  Collections
*** Variables ***

${base_url}     https://reqres.in/
${relative_url}     api/users/
${user}     2

*** Test Cases ***
Get User Info
    create session  mysession   ${base_url}
    ${response}=    GET On Session     mysession   ${relative_url}${user}
    log  ${response.status_code}
    log  ${response.content}
    log  ${response.headers}

#    VALIDATION
#   To check response code
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200     #the status code variable return int value, so we convert it to string

#   To check response body
    ${body}=    convert to string  ${response.content}
    should contain  ${body}     Janet       #the body variable return in JSON format, so we convert it to string

#   To check headers value
    ${contentTypeValue}=    get from dictionary  ${response.headers}        Content-Type
    should be equal  ${contentTypeValue}    application/json; charset=utf-8    #the contentTypeValue get the dictionary value from response.headers
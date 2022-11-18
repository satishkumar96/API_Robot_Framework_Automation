*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}     https://restapi.demoqa.com

*** Test Cases ***
BasicAuthTest
    ${auth}=    create list  ToolsQA    TestPassword
   Create Session   mysession   ${base_url}     auth=${auth}
   ${response}=     get request     mysession   /authentication/CheckForAuthentication/
   log to console  ${response.content}
*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}     https://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
   Create Session   mysession   ${base_url}
   ${response}=     GET On Session     mysession   /photos

   log to console  ${response.headers}

   ${contentTypeValue}=     Get From Dictionary     ${response.headers}     Content-Type
   log to console  ${contentTypeValue}
   should be equal  ${contentTypeValue}     application/json; charset=utf-8

   ${contentEncodeValue}=   Get From Dictionary     ${response.headers}     Content-Encoding
   log to console  ${contentEncodeValue}
   should be equal  ${contentEncodeValue}     gzip

   ${connection}=   Get From Dictionary     ${response.headers}     Connection
   log to console  ${connection}
   should be equal  ${connection}   keep-alive
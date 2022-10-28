*** Settings ***
Library  JSONLibrary
Library  OperatingSystem
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}    https://restcountries.com

*** Test Cases ***
Get_CountryInfo
    create session  mysession   ${base_url}
    ${response}=    get on session  mysession  /v2/alpha/in

    #Single Data Validation
    ${country_Name}=     get value from json     ${response.json()}  $.name
    log to console  ${country_Name[0]}
    should be equal  ${country_Name[0]}     India

    #Single Data Validation In Array
    ${border}=     get value from json     ${response.json()}  $.borders[0]
    log to console  ${border[0]}
    should be equal  ${border[0]}     AFG

    #Multiple Data Validation in Array
    ${borders}=     get value from json     ${response.json()}  $.borders
    log to console  ${borders[0]}
    should contain any  ${borders[0]}   AFG    BGD     CHN
    should not contain any  ${borders[0]}   ABC     XYZ
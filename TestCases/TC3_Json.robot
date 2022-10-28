*** Settings ***
Library  JSONLibrary
Library  OperatingSystem
Library  Collections

*** Test Cases ***
Testcase1:
    ${json_obj}=    load json from file     ${CURDIR}/../JSON/example_2.json
    ${name_value}=  get value from json     ${json_obj}     $.firstName

    log to console  ${name_value[0]}
    should be equal  ${name_value[0]}   John

    ${street_value}=  get value from json     ${json_obj}     $.address.streetAddress
    log to console  ${street_value[0]}
    should be equal  ${street_value[0]}   naist street

    ${faxnum_value}=  get value from json     ${json_obj}     $.phoneNumbers[1].number
    log to console  ${faxnum_value[0]}
    should be equal  ${faxnum_value[0]}   0123-4567-8910
*** Settings ***
Library  XML
Library  OS
Library  Collections

*** Test Cases ***
TC1
    ${xml_object}=  parse xml  ${CURDIR}/../XML/employee.xml

    #VALIDATION
    #Val1- Check the single element value
    #Approach 1
    ${emp_firstname}=   get element text  ${xml_object}     .//employee[1]/firstname
    should be equal     ${emp_firstname}    Aryan

    #Approach 2
    ${emp_firstname}=   get element  ${xml_object}      .//employee[1]/firstname
    should be equal     ${emp_firstname.text}    Aryan

    #Approach 3
    element text should be  ${xml_object}   Aryan  .//employee[1]/firstname

    #Val2- Check Number of elements
    ${count}=   get element count  ${xml_object}    .//employee
    should be equal as integers  ${count}   3

    #Val3 - Check attribute presence in XML
    element attribute should be  ${xml_object}  id  001     .//employee[1]
    element attribute should be  ${xml_object}  id  056     .//employee[3]

    #Val4 - Check Values of Child elements
    ${child_Elements}=  get child elements  ${xml_object}   .//employee[1]
    should not be empty     ${child_Elements}

    ${fname}=   get element text  ${child_Elements[0]}
    ${lname}=   get element text  ${child_Elements[1]}
    ${nickname}=   get element text  ${child_Elements[2]}

    log to console  ${fname}
    log to console  ${lname}
    log to console  ${nickname}

    should be equal  ${fname}   Aryan
    should be equal  ${lname}   Gupta
    should be equal  ${nickname}   Raju
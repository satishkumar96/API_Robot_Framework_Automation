*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     http://localhost:8080

*** Test Cases ***
TC1:Returns all the video games(GET)
    create session  mysession   ${base_url}
    ${response}=    get on session  mysession      /app/videogames
    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATION
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200

TC2:Add a new video game(POST)
    create session  mysession   ${base_url}
    ${body}=    create dictionary   id=100   name=Spider-Man  releaseDate=2022-10-26T04:33:24.992Z   reviewScore=5   category=Thriller   rating=Universal
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request    mysession     /app/videogames     data=${body}    headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATIONS
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200

    ${res_body}=    convert to string  ${response.content}
    should contain  ${res_body}     Record Added Successfully

TC3: Returns the details of a single game by ID(GET)
     create session  mysession   ${base_url}
    ${response}=    get on session  mysession      /app/videogames/100
    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATION
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200

    ${res_body}=    convert to string  ${response.content}
    should contain  ${res_body}     Spider-Man  #Name of the game

TC4:Update an existing video game by specifying a new body (PUT)
    create session  mysession   ${base_url}
    ${body}=    create dictionary  id=100   name=Pacman  releaseDate=2022-10-26T04:33:24.992Z   reviewScore=5   category=Thriller   rating=Universal
    ${header}=  create dictionary  Content-Type=application/json
    ${response}=    put request  mysession     /app/videogames/100     data=${body}    headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #VALIDATIONS
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200

    ${res_body}=    convert to string  ${response.content}
    should contain  ${res_body}     Pacman

TC5:Deletes a video game by ID (DELETE)
    create session  mysession   ${base_url}
    ${response}=    delete on session  mysession   app/videogames/100

    #VALIDATION
    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200

    ${res_body}=    convert to string  ${response.content}
    should contain  ${res_body}     Record Deleted Successfully
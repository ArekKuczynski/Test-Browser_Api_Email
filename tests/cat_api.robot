*** Settings ***
Documentation    Test cat_api

Library    Browser
Library    RequestsLibrary

*** Variables ***
${api_url}    https://catfact.ninja/#/Facts/getRandomFact

*** Test Cases ***
Get content form api
    [Documentation]    Random cat fact
    [Tags]     catfact.ninja

    Get Random Fact About Cat

*** Keywords ***
Get Random Fact About Cat
    RequestsLibrary.Create Session   Session_1   ${api_url}
    ${response}=  RequestsLibrary.GET On Session  Session_1   /fact
    Log   ${response.status_code}
    Log   ${response.content}

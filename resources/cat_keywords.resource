*** Settings ***
Library    Browser
Library    RequestsLibrary
Variables    ../variables/variables.yaml

*** Keywords ***
Get Random Fact About Cat
    RequestsLibrary.Create Session   Session_1   ${Cat_api.api_url}
    ${response}=  RequestsLibrary.GET On Session  Session_1   /fact
    Log   ${response.status_code}
    Log   ${response.content}
*** Settings ***
Documentation    Test cat_api
Resource    ../resources/cat_keywords.resource

*** Test Cases ***
Get content form api
    [Documentation]    Random cat fact
    [Tags]     catfact.ninja

    cat_keywords.Get Random Fact About Cat

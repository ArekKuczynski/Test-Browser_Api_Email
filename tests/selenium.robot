*** Settings ***
Documentation    Test strony wikipedia.org_selenium

Library    SeleniumLibrary
Resource    ../resources/selenium_keywords.resource

Suite Teardown    SeleniumLibrary.Close All Browsers

*** Test Cases ***
Download Image
    [Documentation]    Test download image by src
    [Tags]    wikipedia.org

    selenium_keywords.Open Browser
    selenium_keywords.Input Search Data
    selenium_keywords.Search Phrase

    selenium_keywords.Get Image Element And Download


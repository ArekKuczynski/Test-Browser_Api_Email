*** Settings ***
Documentation  Test strony wikipedia.org_selenium

Library  SeleniumLibrary
Library  Process

Suite Teardown  SeleniumLibrary.Close All Browsers

*** Variables ***
${page_url}  https://en.wikipedia.org/
${search_input}  xpath://input[@class="cdx-text-input__input"]
${search_button}  xpath://a[@class="cdx-menu-item__content"]

*** Test Cases ***
Download Image
    [Documentation]    Test download image by src
    [Tags]    wikipedia.org

    When I Open Browser
    And I Input Search Data
    Then Search Phrase

    Get Image Element And Download

*** Keywords ***
I Open Browser
    SeleniumLibrary.Open Browser  ${page_url}

I Input Search Data
    SeleniumLibrary.Capture Page Screenshot
    SeleniumLibrary.Input Text  ${search_input}  Robot Framework
    Sleep  1s
    Log  Input musi poczekać 1s, inaczej selenium nie złapie xpath'a $search_button
    SeleniumLibrary.Capture Page Screenshot

Search Phrase
    SeleniumLibrary.Click Element  ${search_button}
    SeleniumLibrary.Capture Page Screenshot

Get Image Element And Download
    ${image_element}    SeleniumLibrary.Get WebElement    xpath://img[@src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Robot-framework-logo.png/250px-Robot-framework-logo.png"]
    ${image_src}    SeleniumLibrary.Get Element Attribute    ${image_element}    src
    Log  ${image_src}
    Process.Run Process  curl  -o  logo.png  ${image_src}

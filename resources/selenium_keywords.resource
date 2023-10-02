*** Settings ***

Library    SeleniumLibrary
Library    Process
Variables    ../variables/variables.yaml

*** Keywords ***
Open Browser
    SeleniumLibrary.Open Browser  ${Selenium.page_url}

Input Search Data
    SeleniumLibrary.Capture Page Screenshot    filename=selenium/screenshot/sc1.png
    SeleniumLibrary.Input Text  ${Selenium.search_input}  Robot Framework
    Sleep  1s
    Log  Input musi poczekać 1s, inaczej selenium nie złapie xpath'a $search_button
    SeleniumLibrary.Capture Page Screenshot    filename=selenium/screenshot/sc2.png

Search Phrase
    SeleniumLibrary.Click Element  ${Selenium.search_button}
    SeleniumLibrary.Capture Page Screenshot    filename=selenium/screenshot/sc3.png

Get Image Element And Download
    ${image_src}    SeleniumLibrary.Get Element Attribute    ${Selenium.image_element}    src
    Log  ${image_src}
    Process.Run Process  curl  -o  selenium_robot.png  ${image_src}  cwd=results/Wiki_img/

*** Settings ***
Documentation    Test strony wikipedia.org_browser library_

Resource    ../resources/borwser_keywords.resource

*** Test Cases ***
Download Image By URL
    [Documentation]    Test download image by url
    [Tags]    wikipedia.org

    borwser_keywords.Open Webpage
    borwser_keywords.Search Phrase
    borwser_keywords.Download Image By URL

Download Image By Click
    [Documentation]    Test download image by download click
    [Tags]    wikipedia.org

    borwser_keywords.Open Webpage
    borwser_keywords.Search Phrase
    borwser_keywords.Download Image By Click
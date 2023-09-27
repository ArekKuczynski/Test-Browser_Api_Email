*** Settings ***
Documentation    Test strony wikipedia.org_browser library_

Library    Browser
Resource    open_page.resource

*** Variables ***
${search_input}    //input[@class="cdx-text-input__input"]
${search_button}    //button[@class="cdx-button cdx-button--action-default cdx-button--weight-normal cdx-button--size-medium cdx-button--framed cdx-search-input__end-button"]

*** Test Cases ***
Download Image By URL
    [Documentation]    Test download image by url
    [Tags]    wikipedia.org

    open_page.Open Webpage
    Search Phrase
    Download Image By URL

Download Image By Click
    [Documentation]    Test download image by download click
    [Tags]    wikipedia.org

    open_page.Open Webpage
    Search Phrase
    Download Image By Click

*** Keywords ***
Search Phrase
    Browser.Take Screenshot
    Browser.Fill Text    ${search_input}    apollo 11
    Browser.Take Screenshot
    Browser.Click    ${search_button}
    Browser.Take Screenshot

Download Image By URL
    ${img_url}    Set Variable   https://upload.wikimedia.org/wikipedia/commons/f/f8/Apollo11logo.jpg

    ${dl_promise}    Browser.Promise To Wait For Download    saveAs=..\\..\\..\\..\\..\\Wiki_img\\imgURL_from_wiki.png
    ${img_obj}=    Browser.Download    ${img_url}
    ${file_obj}=    Browser.Wait For    ${dl_promise}

    ${actual_img_path}=    Set Variable  ${file_obj.saveAs}
    Log    ${actual_img_path}

Download Image By Click
    ${img}    Set Variable    //img[@src="//upload.wikimedia.org/wikipedia/commons/thumb/2/27/Apollo_11_insignia.png/198px-Apollo_11_insignia.png"]
    ${img_href_to_download}    Set Variable   //a[@class="mw-mmv-download-button"]
    ${download_button}    Set Variable    //a[@class="mw-ui-button mw-ui-progressive mw-mmv-download-go-button"]

    Browser.Click    ${img}
    Browser.Take Screenshot
    Browser.Click    ${img_href_to_download}
    Browser.Take Screenshot

    ${dl_promise}    Browser.Promise To Wait For Download    saveAs=..\\..\\..\\..\\..\\Wiki_img\\imgCLICK_from_wiki.png
    Browser.Click   ${download_button}
    ${file_obj}=    Browser.Wait For    ${dl_promise}

    ${screenshot}=   Browser.Take Screenshot

    ${actual_img_path}=    Set Variable  ${file_obj.saveAs}
    Log    ${actual_img_path}
    Log    ${screenshot}

*** Settings ***

Library    Browser
Variables    ../variables/variables.yaml

*** Keywords ***
Open Webpage
    Browser.Open Browser    ${BrowserLib.URL}

Search Phrase
    Browser.Take Screenshot    filename=sc1
    Browser.Fill Text    ${BrowserLib.search_input}    apollo 11
    Browser.Take Screenshot    filename=sc2
    Browser.Click    ${BrowserLib.search_button}
    Browser.Take Screenshot    filename=sc3

Download Image By URL
    ${dl_promise}    Browser.Promise To Wait For Download    saveAs=${OUTPUT DIR}/Wiki_img/imgURL_from_wiki.png
    ${img_obj}=    Browser.Download    ${BrowserLib.img_url}
    ${file_obj}=    Browser.Wait For    ${dl_promise}

    ${actual_img_path}=    Set Variable  ${file_obj.saveAs}
    Log    ${actual_img_path}

Download Image By Click
    Browser.Click    ${BrowserLib.img}
    Browser.Take Screenshot    filename=sc4
    Browser.Click    ${BrowserLib.img_href_to_download}
    Browser.Take Screenshot    filename=sc5

    ${dl_promise}    Browser.Promise To Wait For Download    saveAs=${OUTPUT DIR}/Wiki_img/imgCLICK_from_wiki.png
    Browser.Click   ${BrowserLib.download_button}
    ${file_obj}=    Browser.Wait For    ${dl_promise}
    Browser.Take Screenshot    filename=sc6
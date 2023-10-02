*** Settings ***
Documentation    Zdobycie zawartosci email

Resource    ../resources/email_keywords.resource

*** Test Cases ***
Get Link From Email
    [Documentation]    Get link from email
    [Tags]     ImapLibrary2
    email_keywords.Connect To Email
    email_keywords.Find Email
    email_keywords.Get Email Link
    email_keywords.Close Connection To Email

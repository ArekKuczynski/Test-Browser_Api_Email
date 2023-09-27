*** Settings ***

Library    Browser

*** Variables ***
${URL}    https://pl.wikipedia.org/wiki/Wikipedia:Strona_g%C5%82%C3%B3wna

*** Keywords ***
Open Webpage
    Browser.Open Browser    ${URL}

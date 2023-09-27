*** Settings ***
Documentation  Zdobycie zawartosci email

Library  ImapLibrary2

*** Variables ***
${IMAP Server}    imap.wp.pl
${Email}    zapiekanka_01_01_2000@wp.pl
${Password}    raznawozie^razpodwozem_

*** Test Cases ***
Email Get Link
    [Documentation]    Get link from email
    [Tags]     ImapLibrary2
    ImapLibrary2.Open Mailbox  host=${IMAP Server}  user=${Email}   password=${Password}

    ${message_count}    ImapLibrary2.Get Email Count
    Log   ${message_count}

    ${EMAIL_WITH_LINK} =    ImapLibrary2.Wait For Email    timeout=100    text=Robot Framework - Wikipedia
    ${parts} =    ImapLibrary2.Walk Multipart Email    ${EMAIL_WITH_LINK}
    Log    ${parts}

    FOR	${i}	IN RANGE	${parts}
        ImapLibrary2.Walk Multipart Email	${EMAIL_WITH_LINK}
    	${ctype} =	ImapLibrary2.Get Multipart Content Type
        ${payload} =	ImapLibrary2.Get Multipart Payload	decode=True

    	Continue For Loop If	'${ctype}' != 'text/html'

    	${payload} =	ImapLibrary2.Get Multipart Payload	decode=True
        ${WIKI} =    ImapLibrary2.Open Link From Email    ${EMAIL_WITH_LINK}

    END

    Log    ${WIKI}

    ImapLibrary2.Close Mailbox

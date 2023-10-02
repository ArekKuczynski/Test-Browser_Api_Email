*** Settings ***
Library    ImapLibrary2
Variables    ../variables/variables.yaml

*** Keywords ***
Connect To Email  
    ImapLibrary2.Open Mailbox  host=${Email.IMAP_Server}  user=${Email.email}   password=${Email.password}

Find Email
    ${message_count}    ImapLibrary2.Get Email Count
    Log   ${message_count}

Get Email Link
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

Close Connection To Email
    ImapLibrary2.Close Mailbox

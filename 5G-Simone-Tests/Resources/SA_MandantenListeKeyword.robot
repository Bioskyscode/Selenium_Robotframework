*** Settings ***
Library                 SeleniumLibrary
Library                 FakerLibrary
Variables               ../PageObject/5GSimonePages_locators.py
Resource                ../Resources/baseVariables.robot

*** Keywords ***
Search For The Following Users
    Search For Clients                  ${client1}
    Page Should Contain                 ${client1}
    Search For Clients                  ${client2}
    Page Should Contain                 ${client2}
    Search For Clients                  ${client3}
    Page Should Contain                 ${client3}
    Search For Clients                  ${client4}
    Page Should Contain                 ${client4}
    Search For Clients                  ${client5}
    Page Should Contain                 ${client5}
    Log To Console                      Client successfully searched for!

Click On "Mandant deaktivieren"
    Mouse Over                          ${btn_client_re_deactivate}
    Click Element                       ${btn_client_re_deactivate}

Select Random Table Row
    ${random_num}                       Evaluate    random.sample(range(2, 4), 1)    #random           #FakerLibrary.Random Int             8       10                #Evaluate    random.sample(range(3, 10), 1)    random
    ${table row}                        Set Variable     //*[@id="tenant-table"]/div[2]/table/tbody/tr${random_num}
    #//*[@id="tenant-table"]/div[2]/table/tbody/tr[2]
    Log To Console                      Table row : ${random_num}
    Wait Until Page Contains Element    ${table row}
    #Page Should Not Contain             Keine Mandanten gefunden
    #Scroll Element Into View            ${table row}
    Mouse Over                          ${table row}
    Click Element                       ${table row}



Search For Clients
    [Arguments]                         ${client}
    Mouse Over                          ${txt_searchClient}
    Input Text                          ${txt_searchClient}   ${client}

#############################################
#Mandanten Aktivieren/ Deaktivieren
#############################################
Deactivate or Activate Client
    Select Random Table Row
    Click On "Mandant deaktivieren"
    Enter Random Reason
    Click on "Deaktivieren or Aktivieren" Button

Enter Random Reason
    ${reason}                           FakerLibrary.Sentence
    Wait Until Page Contains Element    ${txt_deactivateClient_reason}
    Input Text                          ${txt_deactivateClient_reason}     ${reason}

Click on "Deaktivieren or Aktivieren" Button
    Wait Until Page Contains Element    ${btn_deactivateClient}
    Element Should Be Enabled           ${btn_deactivateClient}
    Mouse Over                          ${btn_deactivateClient}
    Click Element                       ${btn_deactivateClient}
    Wait Until Page Contains            Anforderung erfolgreich ausgeführt!
    Sleep                               2

Click On "Close Button"
    Wait Until Page Contains Element    ${btn_close}
    Mouse Over                          ${btn_close}
    Click Element                       ${btn_close}

Validate Successful Deactivation or Activation
    Wait Until Page Contains            Mandanten
    Page Should Not Contain             Bei der Verarbeitung dieses Inhaltes ist ein Problem aufgetreten.

#####################################################
# Nuenen Mandanten Anlegen
#############################################
Enter Mandant Registration Details
    [Arguments]                         ${name}     ${short_name}        ${description}     ${admin_name}       ${admin_surname}        ${admin_email}
    Enter "Mandanten Name"              ${name}
    Enter "Mandanten Kurzname"          ${short_name}
    Enter "Beschreibung"                ${description}
    Enter "Admin Name"                  ${admin_name}
    Enter "Admin Nachname"              ${admin_surname}
    Enter "Admin Email-Adresse"         ${admin_email}

Enter Wrong Mandant Registration Details For -Ve Test
    [Arguments]                         ${name}     ${short_name}        ${description}     ${admin_name}       ${admin_surname}        ${admin_email}
    Mandantenname    ${name}
    Mandanten Kurzname    ${short_name}
    Enter "Beschreibung"                ${description}
    Admin Name    ${admin_name}
    Admin Nachname    ${admin_surname}
    Admin Email    ${admin_email}
    Close "Popup"
    Click On "Neuen Mandanten anlegen"
    Admin Email    ${admin_email}
    Admin Nachname    ${admin_surname}
    Admin Name    ${admin_name}
    Enter "Beschreibung"                ${description}
    Mandanten Kurzname    ${short_name}
    Mandantenname    ${name}

Mandantenname
    [Arguments]                         ${name}
    Enter "Mandanten Name"              ${name}
    Mouse Over                          ${tooltip_mandantenname}
    Page Should Contain                 min. 5 Zeichen, keine Sonderzeichen

Mandanten Kurzname
    [Arguments]                         ${short_name}
    Enter "Mandanten Kurzname"          ${short_name}
    Mouse Over                          ${tooltip_mandantenkurzname}
    Page Should Contain                 min. 5 Zeichen, keine Sonderzeichen

Admin Name
    [Arguments]                         ${admin_name}
    Enter "Admin Name"                  ${admin_name}
    Mouse Over                          ${tooltip_adminname}
    Page Should Contain                 min. 2 Zeichen

Admin Nachname
    [Arguments]                         ${admin_surname}
    Enter "Admin Nachname"              ${admin_surname}
    Mouse Over                          ${tooltip_adminnachname}
    Page Should Contain                 min. 2 Zeichen

Admin Email
    [Arguments]                         ${admin_email}
    Enter "Admin Email-Adresse"         ${admin_email}
    Mouse Over                          ${tooltip_adminemail}
    Page Should Contain                 Format: abc@de.fg

Click On "Neuen Mandanten anlegen"
    Wait Until Page Contains Element    ${btn_invite_new_client}
    Mouse Over                          ${btn_invite_new_client}
    Click Element                       ${btn_invite_new_client}
    Wait Until Page Contains            Neuen Mandanten anlegen

Close "Popup"
    Wait Until Page Contains Element    ${btn_close}
    Mouse Over                          ${btn_close}
    Click Element                       ${btn_close}

Click On "Inner Close Button"
    Wait Until Page Contains Element    ${btn_innerClose}
    Mouse Over                          ${btn_innerClose}
    Click Element                       ${btn_innerClose}

Enter "Mandanten Name"
    [Arguments]                         ${name}
    Wait Until Page Contains Element    ${txt_clientName}
    Mouse Over                          ${txt_clientName}
    Input Text                          ${txt_clientName}           ${name}

Enter "Mandanten Kurzname"
    [Arguments]                         ${short_name}
    Wait Until Page Contains Element    ${txt_clientShortName}
    Mouse Over                          ${txt_clientShortName}
    Input Text                          ${txt_clientShortName}      ${short_name}

Enter "Beschreibung"
    [Arguments]                         ${description}
    Wait Until Page Contains Element    ${txt_clientDescription}
    Mouse Over                          ${txt_clientDescription}
    Input Text                          ${txt_clientDescription}     ${description}


Enter "Admin Name"
    [Arguments]                         ${admin_name}
    Wait Until Page Contains Element    ${txt_adminName}
    Mouse Over                          ${txt_adminName}
    Input Text                          ${txt_adminName}            ${admin_name}

Enter "Admin Nachname"
    [Arguments]                         ${admin_surname}
    Wait Until Page Contains Element    ${txt_adminSurname}
    Mouse Over                          ${txt_adminSurname}
    Input Text                          ${txt_adminSurname}         ${admin_surname}

Enter "Admin Email-Adresse"
    [Arguments]                         ${admin_email}
    Wait Until Page Contains Element    ${txt_adminEmail}
    Mouse Over                          ${txt_adminEmail}
    Input Text                          ${txt_adminEmail}           ${admin_email}

Click On "Weiter"
    Wait Until Page Contains Element    ${btn_continue}
    Mouse Over                          ${btn_continue}
    Click Element                       ${btn_continue}

Click On "Anlegen"
    Wait Until Page Contains Element    ${btn_invite}
    Mouse Over                          ${btn_invite}
    Click Element                       ${btn_invite}
    Wait Until Page Contains            erledigt!
    Element Should Contain              ${btn_invite}               erledigt!
    Sleep    7
    #Wait Until Page Does Not Contain    erledigt!

Mandant Toast_alert Validation
    #Wait Until Page Contains Element       ${mandant_toast_alert}
    Wait Until Page Contains Element       ${txt_mandant_toast_alert_top}
    ${top_toast_text}                   Get Text                    ${txt_mandant_toast_alert_top}
    ${buttom_toast_text}                Get Text                    ${txt_mandant_toast_alert_buttom}
    Should Be Equal                     ${top_toast_text}           Das hat geklappt.
    Should Be Equal                     ${buttom_toast_text}        Mandant erfolgreich angelegt
    Log To Console                      Client successfully invited!




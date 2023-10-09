*** Settings ***
Library                 SeleniumLibrary
Library                 FakerLibrary
Resource                ../Resources/baseVariables.robot
Variables               ../PageObject/5GSimonePages_locators.py

*** Keywords ***
##############################################################################
#Main
##############################################################################
Click On "Benutzerverwaltung"
    Wait Until Page Contains                            Benutzerverwaltung
    Wait Until Page Contains Element                    ${btn_userAdmin}
    Mouse Over                                          ${btn_userAdmin}
    Double Click Element                                ${btn_userAdmin}
    Validate Benutzerverwaltung Table Headers

Validate Benutzerverwaltung Table Headers
    Wait Until Page Contains Element                    ${tbl_Benutzerliste}
    Table Column Should Contain                         ${tbl_Benutzerliste}               3           Vorname
    Table Column Should Contain                         ${tbl_Benutzerliste}               4           Nachname
    Table Column Should Contain                         ${tbl_Benutzerliste}               5           User
    Table Column Should Contain                         ${tbl_Benutzerliste}               6           E-Mailadresse
    Table Column Should Contain                         ${tbl_Benutzerliste}               7           Status
    Table Column Should Contain                         ${tbl_Benutzerliste}               8           Sperre bis
    Table Column Should Contain                         ${tbl_Benutzerliste}               9           Rollen

###############################
#Neuen Benutzer Anlegen
################################
Click On "Neuen Benutzer anlegen"
    Wait Until Element Is Visible                       ${btn_addNewUser}
    Mouse Over                                          ${btn_addNewUser}
    Click Element                                       ${btn_addNewUser}
    Validate "Neuen Benutzer anlegen" Popup Page

Validate "Neuen Benutzer anlegen" Popup Page
    Wait Until Page Contains                            Neuen Benutzer anlegen
    Wait Until Page Contains                            Email *
    Wait Until Page Contains                            Vorname *
    Wait Until Page Contains                            Nachname *
    Wait Until Page Contains                            Username *
    Wait Until Page Contains                            Weiter

Close Invite New User Popup
    Wait Until Page Contains Element                    ${btn_addNewUser_closePopup}
    Mouse Over                                          ${btn_addNewUser_closePopup}
    Click Element                                       ${btn_addNewUser_closePopup}
    Log To Console                                      Invite-New-User popup successfully closed

Close Invite New User Inner Popup
    Wait Until Page Contains Element                    ${btn_addNewUser_closeInnerPopup}
    Mouse Over                                          ${btn_addNewUser_closeInnerPopup}
    click element                                       ${btn_addNewUser_closeInnerPopup}

Enter "Neuen Benutzer Email"
    [Arguments]                                         ${email}
    Wait Until Page Contains Element                    ${txt_addNewUser_email}
    Mouse Over                                          ${txt_addNewUser_email}
    input text                                          ${txt_addNewUser_email}                     ${email}

Enter "Neuen Benutzer Vorname"
    [Arguments]         ${name}
    #log to console      Enter New User name
    Wait Until Page Contains Element                    ${txt_addNewUser_name}
    Mouse Over                                          ${txt_addNewUser_name}
    input text                                          ${txt_addNewUser_name}                      ${name}

Enter "Neuen Benutzer Nachname"
    [Arguments]         ${surname}
    #log to console      Enter New User surname
    Wait Until Page Contains Element                    ${txt_addNewUser_surname}
    Mouse Over                                          ${txt_addNewUser_surname}
    input text                                          ${txt_addNewUser_surname}                   ${surname}

Enter "Neuen Benutzer Username"
    [Arguments]         ${username}
    #log to console      Enter New User username
    Wait Until Page Contains Element                    ${txt_addNewUser_username}
    Mouse Over                                          ${txt_addNewUser_username}
    input text                                          ${txt_addNewUser_username}                  ${username}

Rollenauswahl
    Log To Console                                      Selecting user role(s) ...
    ${checkbox1}                                        FakerLibrary.Random Int                     1       3
    ${checkbox2}                                        FakerLibrary.Random Int                     1       3
    ${checkbox3}                                        FakerLibrary.Random Int                     1       3

    Wait Until Page Contains Element                    ${Rollenauswahl_container}
    Select Checkbox                                     xpath:/html/body/div[2]/div/div[2]/div/div[1]/div/div[${checkbox1}]/input        #${Supervisor_Role}
    Select Checkbox                                     xpath:/html/body/div[2]/div/div[2]/div/div[1]/div/div[${checkbox2}]/input        #${EmergencyAssistant_Role}
    Select Checkbox                                     xpath:/html/body/div[2]/div/div[2]/div/div[1]/div/div[${checkbox3}]/input        #${TenantAdmin_Role}

Scroll To "Weiter"
    Wait Until Page Contains Element                    ${btn_addNewUser_continue}
    Scroll Element Into View                            ${btn_addNewUser_continue}

Scroll To "Anlegen"
    Wait Until Page Contains Element                    ${btn_addNewUser_invite}
    Scroll Element Into View                            ${btn_addNewUser_invite}

Click On "Weiter"
    Wait Until Page Contains Element                    ${btn_addNewUser_continue}
    Mouse Over                                          ${btn_addNewUser_continue}
    click button                                        ${btn_addNewUser_continue}

Click To Submit Invitation
    Log To Console      Submit invitation form
    Wait Until Page Contains Element                    ${btn_addNewUser_invite}
    Mouse Over                                          ${btn_addNewUser_invite}
    click button                                        ${btn_addNewUser_invite}

Validate Successful Tenant Invitation
    Tenant Success Invitation Message
    Toast_alert Validation
    Log To Console    New Tenant successfully invited!!!
    
Validate A Mail Cannot Be Registered Twice
    Wait Until Page Contains                            Ein unerwartetes Problem ist im Bereich der Anwenderverwaltung aufgetreten.
    

Toast_alert Validation
    #Pause Execution
    Wait Until Element Is Visible                       ${toast_alert}
    ${Top_toast_text}                                   Get Text                                    ${txt_toast_alert_1}
    ${Bottom_toast_text}                                Get Text                                    ${txt_toast_alert_2}
    Should Be Equal                                     ${Top_toast_text}                               Ausführung erfolgreich
    Should Be Equal                                     ${Bottom_toast_text}                            Der Benutzer wurde erfolgreich angelegt.

Tenant Success Invitation Message
    Wait Until Page Contains                            User erfolgreich angelegt.

##############################################################################
# Benutzer Bearbeiten
##############################################################################

Select A Random Tenant
    ${random_num}                                       FakerLibrary.Random Int                     1       5
    Log To Console                                      Row ${random_num} Selected
    Wait Until Page Contains Element                    //*[@id="user-table"]/div[2]/table/tbody/tr[${random_num}]
    Mouse Over                                          //*[@id="user-table"]/div[2]/table/tbody/tr[${random_num}]
    Click Element                                       //*[@id="user-table"]/div[2]/table/tbody/tr[${random_num}]

Click Edit User
    ${btn_disabled}     Run Keyword And Return Status      Element Should Be Disabled   ${btn_editUser}
    IF    ${btn_disabled}
         Select A Random Tenant
    END
    Wait Until Element Is Enabled                       ${btn_editUser}
    Element Should Be Enabled                           ${btn_editUser}
    Mouse Over                                          ${btn_editUser}
    Click Element                                       ${btn_editUser}
    Wait Until Page Contains                            Benutzerrollen anpassen

Close Edit User Popup
    Wait Until Page Contains Element                    ${btn_editUser_closePopup}
    Mouse Over                                          ${btn_editUser_closePopup}
    click element                                       ${btn_editUser_closePopup}
    log to console                                      Edit-User popup successfully closed
    
Cancel Edit User Popup
    Wait Until Page Contains Element                    ${btn_editUser_cancelPopup}
    Mouse Over                                          ${btn_editUser_cancelPopup}
    click element                                       ${btn_editUser_cancelPopup}
    Log To Console                                      Edit-user popup successfully cancelled

Select New Tenant Roles To Edit Roles
    ${checkbox1}                                        FakerLibrary.Random Int                     1       3
    ${checkbox2}                                        FakerLibrary.Random Int                     1       3
    ${checkbox3}                                        FakerLibrary.Random Int                     1       3       #Evaluate    random.sample(range(1, 3), 1)    random

    Wait Until Page Contains Element                    xpath:/html/body/div[2]/div/div[2]/div[2]/div[${checkbox1}]/input
    Select Checkbox                                     xpath:/html/body/div[2]/div/div[2]/div[2]/div[${checkbox1}]/input
    Select Checkbox                                     xpath:/html/body/div[2]/div/div[2]/div[2]/div[${checkbox2}]/input
    Click Element                                       xpath:/html/body/div[2]/div/div[2]/div[2]/div[${checkbox3}]/input

Click On Änderung bestätigen To Edit Tenant Role
    Wait Until Element Is Enabled                       ${btn_editUser_confirmChange}
    Mouse Over                                          ${btn_editUser_confirmChange}
    Click Element                                       ${btn_editUser_confirmChange}
    Wait Until Page Contains                            Anforderung erfolgreich ausgeführt!
    Sleep                                               2
    Wait Until Page Contains Element                    ${tbl_tableBody}
    Page Should Not Contain                             Keine Benutzer gefunden

##############################################################################
# Benutzer Deaktivieren
##############################################################################
Click Deactivate User
    Wait Until Element Is Enabled                       ${btn_deactivateUser}
    Element Should Be Enabled                           ${btn_deactivateUser}
    Mouse Over                                          ${btn_deactivateUser}
    Click Element                                       ${btn_deactivateUser}
    Wait Until Page Contains Element                    ${msg_deactivateActivate}

Close Deactivate User Popup
    Wait Until Page Contains Element                    ${btn_deactivateUser_closePopup}
    Mouse Over                                          ${btn_deactivateUser_closePopup}
    Click Element                                       ${btn_deactivateUser_closePopup}

Cancel Deactivate User Popup
    Mouse Over                                          ${btn_deactivateUser_cancelPopup}
    Click Element                                       ${btn_deactivateUser_cancelPopup}

Enter Reason For Deactivating or Reactivating Tenant
    [Arguments]             ${reason}
    Wait Until Page Contains Element                     ${txt_deactivateUser_reason}
    Input Text                                           ${txt_deactivateUser_reason}                      ${reason}

Click On Deaktivieren Button To Deactivate/Reactivate a Tenant
    Wait Until Page Contains Element                      ${btn_deactivateUser_deactivate}
    Mouse Over                                            ${btn_deactivateUser_deactivate}
    Click Element                                         ${btn_deactivateUser_deactivate}
    Wait Until Page Contains                              Anforderung erfolgreich ausgeführt!

##############################################################################
# Reactivate User
##############################################################################
Click To Deactivate or Reactivate a Tenant
    Wait Until Page Contains Element                        ${btn_deactivateUser}
    Mouse Over                                              ${btn_deactivateUser}
    click element                                           ${btn_deactivateUser}
    Wait Until Page Contains                                Benutzerzugang reaktivieren


##############################################################################
# Search User
##############################################################################
Search For Tenants By Tenant Admin
    Search For Tenants                                      ${tenant1}
    Page Should Contain                                     ${tenant1}
    #Search For Tenants                                      ${tenant2}
    #Page Should Contain                                     ${tenant2}
    #Search For Tenants                                      ${tenant3}
    #Page Should Contain                                     ${tenant3}

Search For Tenants
    [Arguments]         ${name}
    Wait Until Page Contains Element                        ${txt_searchUser}
    Mouse Over                                              ${txt_searchUser}
    input text                                              ${txt_searchUser}                               ${name}

Select Own Account
    Wait Until Page Contains Element                        ${row_account_Owner}
    Mouse Over                                              ${row_account_Owner}
    Click Element                                           ${row_account_Owner}

Click Disabled "Benutzer bearbeitung" Button
    Wait Until Page Contains Element                        ${btn_editUser}
    Mouse Over                                              ${btn_editUser}
    Page Should Contain                                     Bearbeitung eigener Daten nicht möglich

Click Disabled "Benutzer deaktivieren" Button
    Wait Until Page Contains Element                        ${btn_deactivateUser}
    Mouse Over                                              ${btn_deactivateUser}
    Page Should Contain                                     Bearbeitung eigener Daten nicht möglich
*** Settings ***
Documentation                   Test if a user cannot register Under Different Admin the same Email
Library                         FakerLibrary
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate An Email Cannot Be Registered Twice
    [Tags]          Invite_Tenant       TA      TA15
    ${Tenant_email}                                                     Set Variable               qrw428@gmail.com
    ${Tenant_name}                                                      FakerLibrary.First Name
    ${Tenant_surname}                                                   FakerLibrary.Last Name
    ${Tenant_username}                                                  FakerLibrary.User Name

    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login To Another Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Click On "Neuen Benutzer anlegen"
    TA_BenutzerverwaltungKeywords.Scroll To "Weiter"
    TA_BenutzerverwaltungKeywords.Enter "Neuen Benutzer Email"                  ${Tenant_email}
    TA_BenutzerverwaltungKeywords.Enter "Neuen Benutzer Vorname"                   ${Tenant_name}
    TA_BenutzerverwaltungKeywords.Enter "Neuen Benutzer Nachname"                ${Tenant_surname}
    TA_BenutzerverwaltungKeywords.Enter "Neuen Benutzer Username"               ${Tenant_username}
    TA_BenutzerverwaltungKeywords.Rollenauswahl
    TA_BenutzerverwaltungKeywords.Click On "Weiter"
    TA_BenutzerverwaltungKeywords.Close Invite New User Inner Popup
    TA_BenutzerverwaltungKeywords.Click On "Weiter"
    TA_BenutzerverwaltungKeywords.Click To Submit Invitation
    TA_BenutzerverwaltungKeywords.Validate A Mail Cannot Be Registered Twice
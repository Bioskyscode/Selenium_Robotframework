*** Settings ***
Documentation                   Test if Tenant Admin can invite a new Tenant
Library                         FakerLibrary
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate New Tenant Invitation
    [Tags]          Invite_Tenant       TA      TA04
    ${Tenant_email}                                                     FakerLibrary.Ascii Company Email
    ${Tenant_name}                                                      FakerLibrary.First Name
    ${Tenant_surname}                                                   FakerLibrary.Last Name
    ${Tenant_username}                                                  FakerLibrary.User Name

    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
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
    TA_BenutzerverwaltungKeywords.Validate Successful Tenant Invitation
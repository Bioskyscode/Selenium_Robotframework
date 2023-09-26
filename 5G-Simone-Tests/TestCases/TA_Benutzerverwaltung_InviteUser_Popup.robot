*** Settings ***
Documentation                   Test if "Neuen Benutzer Anlegen" popup can be closed
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Invite_User Close Popup
    [Tags]              Popup          TA       TA05
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Click On "Neuen Benutzer anlegen"
    TA_BenutzerverwaltungKeywords.Close Invite New User Popup


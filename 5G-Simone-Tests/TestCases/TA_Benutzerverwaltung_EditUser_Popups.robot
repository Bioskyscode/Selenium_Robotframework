*** Settings ***
Documentation                   Test if "Benutzer bearbeiten" popup can be closed and cancelled
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Edit_User Close Pop-up and Cancel Pop-up
    [Tags]      Popup       TA      TA02
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Select A Random Tenant
    TA_BenutzerverwaltungKeywords.Click Edit User
    TA_BenutzerverwaltungKeywords.Close Edit User Popup
    TA_BenutzerverwaltungKeywords.Select A Random Tenant
    TA_BenutzerverwaltungKeywords.Click Edit User
    TA_BenutzerverwaltungKeywords.Cancel Edit User Popup

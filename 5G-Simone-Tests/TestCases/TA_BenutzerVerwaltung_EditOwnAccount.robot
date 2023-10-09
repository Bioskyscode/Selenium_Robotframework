*** Settings ***
Documentation                   Test if Tenant Admin cannot edit his account
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Tenant Admin Cannot Edit His Account
    [Tags]              Edit_Role           TA     TA07
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Search For Tenants By Tenant Admin
    TA_BenutzerverwaltungKeywords.Select Own Account
    TA_BenutzerverwaltungKeywords.Click Disabled "Benutzer bearbeitung" Button
    TA_BenutzerverwaltungKeywords.Click Disabled "Benutzer deaktivieren" Button
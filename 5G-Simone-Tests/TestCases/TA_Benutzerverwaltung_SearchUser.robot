*** Settings ***
Documentation                   Test if Tenant Admin can search for Tenants
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Search For Tenant Admin
    [Tags]              Search           TA     TA07
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Search For Tenants By Tenant Admin
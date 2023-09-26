*** Settings ***
Documentation                   Test if Tenant Admin can edit Tenants roles
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Edit User
    [Tags]          Edit_Roles      TA      TA03
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Select A Random Tenant
    TA_BenutzerverwaltungKeywords.Click Edit User
    TA_BenutzerverwaltungKeywords.Select New Tenant Roles To Edit Roles
    TA_BenutzerverwaltungKeywords.Click On Änderung bestätigen To Edit Tenant Role
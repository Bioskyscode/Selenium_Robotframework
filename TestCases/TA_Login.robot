*** Settings ***
Documentation                   Test if Tenant Admin can login
Resource                        ../Resources/TA_LoginKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Tenant-Admin Login On Chrome
    [Tags]              Login      TA       TA10
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_LoginKeywords.Logout



*** Settings ***
Documentation                   Test if registered Tenant can login
Resource                        ../Resources/TA_LoginKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Tenant Login/Logout Validation
    [Tags]          Login          Tenant       T01
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login To Tenant Page
    TA_LoginKeywords.Logout



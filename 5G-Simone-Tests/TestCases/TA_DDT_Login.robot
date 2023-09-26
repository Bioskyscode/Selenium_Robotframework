*** Settings ***
Documentation                   Data-driven test for negative login test
Resource                        ../Resources/TA_LoginKeywords.robot
Library                         DataDriver              ../TestData/DDT_Login_Data.csv
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test
Test Template   Validate Tenant Admin -ve Login

*** Test Cases ***
DDTTenantAdminLogin using ${email} and ${password}
    [Tags]              Login       DDT         TA      TA08
*** Keywords ***
Validate Tenant Admin -ve Login
    [Arguments]     ${email}    ${password}
    TA_LoginKeywords.Negative Login Attempt To TA Page    ${email}    ${password}




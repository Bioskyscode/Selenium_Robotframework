*** Settings ***
Documentation                           Data-driven test for negative login test
Resource                                ../Resources/SA_LoginKeywords.robot
Library                                 DataDriver     ../TestData/DDT_Login_Data.csv
Suite Setup                             Common.Start Web Test
Test Template                           Validate Super Admin -ve Login
Suite Teardown                          Common.Stop Web Test

*** Test Cases ***
DDTSuperAdminLogin using ${email} and ${password}
    [Tags]                              Login       DDT       SA        SA01

*** Keywords ***
Validate Super Admin -ve Login
    [Arguments]                         ${email}    ${password}
    SA_LoginKeywords.Negative Login Attempt To SA Page      ${email}     ${password}


*** Settings ***
Documentation               Search for Super Admin clients
Resource                    ../Resources/SA_LoginKeywords.robot
Resource                    ../Resources/SA_MandantenListeKeyword.robot
Test Setup                  Common.Start Web Test
Test Teardown               Common.Stop Web Test

*** Test Cases ***
Validate Client Search
    [Tags]      Search     SA       SA05
    Selenium Speed
    SA_LoginKeywords.Navigate To 5G Simone Super Admin URL
    SA_LoginKeywords.Login To SA Page
    SA_MandantenListeKeyword.Search For The Following Users

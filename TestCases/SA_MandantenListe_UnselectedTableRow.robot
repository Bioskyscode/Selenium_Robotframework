*** Settings ***
Documentation               Test for empty row selection handling
Resource                    ../Resources/SA_LoginKeywords.robot
Resource                    ../Resources/SA_MandantenListeKeyword.robot
Test Setup                  Start Web Test
Test Teardown               Stop Web Test
*** Test Cases ***
Validate Unselected Table Row
    [Tags]          Empty_Row       SA      SA06
    SA_LoginKeywords.Navigate To 5G Simone Super Admin URL
    SA_LoginKeywords.Login To SA Page
    SA_MandantenListeKeyword.Click On "Mandant deaktivieren"
    Handle Alert            accept
    Log To Console          Test for selecting empty row successfully Validated!


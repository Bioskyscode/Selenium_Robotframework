*** Settings ***
Documentation               Deactivate or reactivate Client
Resource                    ../Resources/SA_LoginKeywords.robot
Resource                    ../Resources/SA_MandantenListeKeyword.robot
Test Setup                  Common.Start Web Test
Test Teardown               Common.Stop Web Test

*** Test Cases ***
Validate Client Deactivation and Reactivation
    [Tags]      Deactivate      SA      SA04
    SA_LoginKeywords.Navigate To 5G Simone Super Admin URL
    SA_LoginKeywords.Login To SA Page
    SA_MandantenListeKeyword.Deactivate or Activate Client
    SA_MandantenListeKeyword.Validate Successful Deactivation or Activation

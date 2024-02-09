*** Settings ***
Documentation                   Test if Tenant Admin can check Monocabs speeds on the QoS page
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_QoSKeywords.robot
Resource                        ../Resources/TA_InfotainmentKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Vehicle Speed
    [Tags]      QoS      TA
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_QoSKeywords.Navigate To "Fzg-Meldungen"
    TA_QoSKeywords.Validate "Fahrzeuge Bewegungsdaten"
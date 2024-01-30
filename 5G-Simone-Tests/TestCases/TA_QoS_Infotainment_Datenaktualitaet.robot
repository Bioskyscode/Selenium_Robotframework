*** Settings ***
Documentation                   Test if Tenant Admin can view MQTT Service current Data on the QoS page
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_QoSKeywords.robot
Resource                       ../Resources/TA_InfotainmentKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Data on Datenaktualität Page are Correctly Displayed
    [Tags]      QoS      TA
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_QoSKeywords.Navigate To "QoS-Infotainment" Page
    #TA_QoSKeywords.Select a Random Station
    TA_InfotainmentKeywords.Select Station
    TA_InfotainmentKeywords.Select Minden BHF
    #TA_InfotainmentKeywords.Select Topics
    TA_QoSKeywords.Validate Broker Response Table
    TA_QoSKeywords.Check If Data Are Received From Telekom
    TA_QoSKeywords.Check If Data Are Received From Backend
    TA_QoSKeywords.Go To "Datenaktualität" Popup-Page
    TA_QoSKeywords.Validate Datenaktualität Popup-Page Contents
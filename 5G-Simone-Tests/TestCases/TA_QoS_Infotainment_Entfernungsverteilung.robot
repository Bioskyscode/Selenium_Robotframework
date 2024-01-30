*** Settings ***
Documentation                   Test if Tenant Admin can view Distance Distribution of Topics from Selected Station on the QoS page
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_QoSKeywords.robot
Resource                       ../Resources/TA_InfotainmentKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Data on Entfernungsverteilung Page are Correctly Displayed
    [Tags]      QoS      TA
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_QoSKeywords.Navigate To "QoS-Infotainment" Page
    TA_QoSKeywords.Select a Random Station
    #TA_InfotainmentKeywords.Select Station
    #TA_InfotainmentKeywords.Select Minden BHF
    TA_QoSKeywords.Go To "Entfernungsverteilung" Page
    TA_QoSKeywords.Validate "Entfernungsverteilung" Page Contents
*** Settings ***
Documentation                   Test if Tenant Admin can receive MQTT Service Data on the Infotainment page
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_InfotainmentKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Lemgo HBF Reeceives MTTQ Service Data
    [Tags]      Infotainment      TA     TA17
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_InfotainmentKeywords.Navigate To Infotainment Page
    #Repeat Keyword      2    TA_InfotainmentKeywords.Select Topics
    TA_InfotainmentKeywords.Select Station
    TA_InfotainmentKeywords.Select Lemgo BHF
    TA_InfotainmentKeywords.Weather Data
    TA_InfotainmentKeywords.Navigate To Abfahrt
    TA_InfotainmentKeywords.Navigate To Gesundheit
    TA_InfotainmentKeywords.Navigate To Shopping
    TA_InfotainmentKeywords.Navigate To Unterkunft
    TA_InfotainmentKeywords.Navigate To Gastronomie
    TA_InfotainmentKeywords.Navigate To Sehenswürdigkeit
    TA_InfotainmentKeywords.Navigate To Kultur
    #TA_InfotainmentKeywords.Navigate To Annehmlichkeit




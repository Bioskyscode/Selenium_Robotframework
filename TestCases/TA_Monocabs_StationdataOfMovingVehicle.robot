*** Settings ***
Documentation                   Test if Tenant Admin can view Station data on the map from moving vehicles
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
#Resource                        ../Resources/TA_VehicleMoveUpdateKeywords.robot
Resource                        ../Resources/TA_MonocabsKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Station data on the map from moving vehicles
    [Tags]          Monocabs        DisplaOnMap        Vehicle         TA       TA11
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_MonocabsKeywords.Verify Monocabs Table
    TA_MonocabsKeywords.Check If Tenant Admin can View Vehicle Details
    TA_MonocabsKeywords.Show Vehicle on The Map Through The vehicle Pop-up Details
    TA_MonocabsKeywords.Verify Station Data Are Displayed
    

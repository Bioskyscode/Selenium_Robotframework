*** Settings ***
Documentation                   Test if Tenant Admin can view Vehicle position on the map
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_VehicleMoveUpdateKeywords.robot
Resource                        ../Resources/TA_KarteKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Vehicle Position on Map
    [Tags]          Map         Vehicle         TA      TA09
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_VehicleMoveUpdateKeywords.Start Vehicle Move Update
    TA_KarteKeywords.Navigate To Google Map
    TA_KarteKeywords.Check If Google Map and the Zoom Button Are Displayed
    TA_KarteKeywords.Check Vehicle Position On The Map
    TA_KarteKeywords.Check For Its Monocab Details













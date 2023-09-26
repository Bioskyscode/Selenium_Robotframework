*** Settings ***
Documentation                   Test if Tenant Admin can Open Camera View in Tab
Resource                        ../Resources/TA_MoncabsRemoteKeywords.robot
Resource                        ../Resources/TA_MonocabsKeywords.robot
Resource                        ../Resources/Common.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Ability To Open Camera Views In New Tab
    [Tags]          Monocabs        Vehicle         TA       TA14
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_MonocabsKeywords.Verify Monocabs Table
    TA_MonocabsKeywords.Check If Tenant Admin can View Vehicle Details
    TA_MoncabsRemoteKeywords.Open Camera View
    TA_MoncabsRemoteKeywords.Validate If Camera View is Opened
    ##TA_MoncabsRemoteKeywords.Toggle CameraView-1 ACtivation-Deactivation Button
    TA_MoncabsRemoteKeywords.Click To Open CameraView-fahrtrichtungRecht in New Window And Validate The Small View is Disabled
    TA_MoncabsRemoteKeywords.Click To Open CameraView-Kabine in New Window And Validate The Small View is Disabled

*** Settings ***
Documentation                   Test if Tenant Admin can Activate/Deactivate Camera View
Resource                        ../Resources/TA_MoncabsRemoteKeywords.robot
Resource                        ../Resources/TA_MonocabsKeywords.robot
Resource                        ../Resources/Common.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Ability To Activate/Deactivate Camera Views
    [Tags]          Monocabs        Vehicle         TA       TA13
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_MonocabsKeywords.Verify Monocabs Table
    TA_MonocabsKeywords.Check If Tenant Admin can View Vehicle Details
    TA_MoncabsRemoteKeywords.Open Camera View
    TA_MoncabsRemoteKeywords.Validate If Camera View is Opened
    TA_MoncabsRemoteKeywords.Toggle CameraView-fahrtrichtungRecht ACtivation-Deactivation Button
    TA_MoncabsRemoteKeywords.Toggle CameraView-kabine ACtivation-Deactivation Button
    ##Repeat Keyword    4    TA_MoncabsRemoteKeywords.Toggle CameraView-3 ACtivation-Deactivation Button
    #Repeat Keyword    4    TA_MoncabsRemoteKeywords.Toggle CameraView-4 ACtivation-Deactivation Button
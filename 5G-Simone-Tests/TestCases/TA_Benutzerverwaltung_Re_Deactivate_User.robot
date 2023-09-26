*** Settings ***
Documentation                   Test if Tenant Admin can deactivate or reactivate a Tenant
Library                         FakerLibrary
Resource                        ../Resources/TA_LoginKeywords.robot
Resource                        ../Resources/TA_BenutzerverwaltungKeywords.robot
Test Setup                      Common.Start Web Test
Test Teardown                   Common.Stop Web Test

*** Test Cases ***
Validate Tenant Admin Deactivation and Reactivation
    [Tags]              Deactivate_Tenant         TA        TA06
    TA_LoginKeywords.Navigate To 5G Simone Tenant Admin URL
    TA_LoginKeywords.Login Tenant Admin Page
    TA_BenutzerverwaltungKeywords.Click On "Benutzerverwaltung"
    TA_BenutzerverwaltungKeywords.Select A Random Tenant
    TA_BenutzerverwaltungKeywords.Click Deactivate User
    ${random_reason}                FakerLibrary.Sentence
    TA_BenutzerverwaltungKeywords.Enter Reason For Deactivating or Reactivating Tenant    ${random_reason}
    TA_BenutzerverwaltungKeywords.Click On Deaktivieren Button To Deactivate/Reactivate a Tenant
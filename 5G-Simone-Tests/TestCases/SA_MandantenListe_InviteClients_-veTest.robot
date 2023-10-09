*** Settings ***
Documentation           Test if Super Admin receives correct message when invite new client with invalid data
Library                 FakerLibrary
Resource                ../Resources/SA_LoginKeywords.robot
Resource                ../Resources/SA_MandantenListeKeyword.robot
Test Setup              Common.Start Web Test
Test Teardown           Common.Stop Web Test

*** Test Cases ***
SA Invite New Client Validateion -Ve Test
    [Tags]      Invite_Client       SA      SA03
    ${client_name}      FakerLibrary.Random Letter
    ${client_short_name}    FakerLibrary.Random Letter
    ${client_description}       FakerLibrary.Random Letter
    ${admin_name}       FakerLibrary.Random Letter
    ${admin_surname}    FakerLibrary.Random Letter
    ${admin_email}      FakerLibrary.Random Letter

    SA_LoginKeywords.Navigate To 5G Simone Super Admin URL
    SA_LoginKeywords.Login To SA Page
    SA_MandantenListeKeyword.Click On "Neuen Mandanten anlegen"
    SA_MandantenListeKeyword.Enter Wrong Mandant Registration Details For -Ve Test    ${client_name}    ${client_short_name}
    ...     ${client_description}    ${admin_name}    ${admin_surname}    ${admin_email}





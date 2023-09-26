*** Settings ***
Documentation           Test if Super Admin can invite new client
Library                 FakerLibrary
Resource                ../Resources/SA_LoginKeywords.robot
Resource                ../Resources/SA_MandantenListeKeyword.robot
Test Setup              Common.Start Web Test
Test Teardown           Common.Stop Web Test

*** Test Cases ***
SA Invite New Client Validateion
    [Tags]      Invite_Client       SA      SA03
    ${client_name}      FakerLibrary.Company
    ${client_short_name}    FakerLibrary.User Name
    ${client_description}       FakerLibrary.Sentence
    ${admin_name}       FakerLibrary.First Name
    ${admin_surname}    FakerLibrary.Last Name
    ${admin_email}      FakerLibrary.Ascii Safe Email

    SA_LoginKeywords.Navigate To 5G Simone Super Admin URL
    SA_LoginKeywords.Login To SA Page
    SA_MandantenListeKeyword.Click On "Neuen Mandanten anlegen"
    SA_MandantenListeKeyword.Close "Popup"
    SA_MandantenListeKeyword.Click On "Neuen Mandanten anlegen"
    SA_MandantenListeKeyword.Enter Mandant Registration Details    ${client_name}    ${client_short_name}
    ...     ${client_description}    ${admin_name}    ${admin_surname}    ${admin_email}
    SA_MandantenListeKeyword.Click On "Weiter"
    SA_MandantenListeKeyword.Click On "Inner Close Button"
    SA_MandantenListeKeyword.Click On "Weiter"
    SA_MandantenListeKeyword.Click On "Anlegen"
    SA_MandantenListeKeyword.Mandant Toast_alert Validation





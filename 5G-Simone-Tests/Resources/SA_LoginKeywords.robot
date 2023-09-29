*** Settings ***
Library                 SeleniumLibrary         timeout=00:00:30
Variables               ../PageObject/5GSimonePages_locators.py
Resource                ../Resources/baseVariables.robot
Resource                ../Resources/Common.robot

*** Keywords ***
Negative Login Attempt To SA Page
    [Arguments]                                                 ${email}                        ${password}
    Navigate To 5G Simone Super Admin URL
    Enter Email                                                 ${email}
    Click On "Weiter"
    Enter Password                                              ${password}
    Click On "Anmelden"
    SA Login Error Message
    Log To Console                                              Invalid Login Details! Try again
    Click On "Zurück"

Login To SA Page
    Enter Email                                                 ${superAdmin_Email}
    Click On "Weiter"
    Enter Password                                              ${SA_Password_testingStage}
    Click On "Anmelden"
    Log Title
    Verify Sucessful Login
    Log To Console                                              Successful login
    Validate Mandanten-Liste Table Headers

Validate Mandanten-Liste Table Headers
    Wait Until Page Contains Element                    ${tbl_Mandanten_liste}
    Table Column Should Contain                         ${tbl_Mandanten_liste}               3           Name
    Table Column Should Contain                         ${tbl_Mandanten_liste}               4           Kurzname
    Table Column Should Contain                         ${tbl_Mandanten_liste}               5           Beschreibung
    Table Column Should Contain                         ${tbl_Mandanten_liste}               6           Inaktiv

Navigate To 5G Simone Super Admin URL
    Go To                                                       ${superAdmin_URL_testingStage}

Enter Email
    [Arguments]                                                 ${email}
    Wait Until Page Contains                                    E-Mail Adresse
    Wait Until Page Contains Element                            ${txt_superEmail}
    Mouse Over                                                  ${txt_superEmail}
    input text                                                  ${txt_superEmail}                   ${email}

Click On "Weiter"
    Wait Until Page Contains                                    Weiter      #${btn_superNextPage}
    Mouse Over                                                  ${btn_superNextPage}
    Click Element                                               ${btn_superNextPage}

Enter Password
    [Arguments]                                                 ${pwd}
    Wait Until Page Contains                                    Passwort
    Wait Until Page Contains Element                            ${txt_superPassword}
    Mouse Over                                                  ${txt_superPassword}
    Input Text                                                  ${txt_superPassword}                ${pwd}

Click On "Anmelden"
    Wait Until Page Contains                                    Anmelden        #${btn_superLogin}
    Mouse Over                                                  ${btn_superLogin}
    Click Element                                               ${btn_superLogin}

Logout
    Wait Until Page Contains Element                            ${btn_portal_admin}
    Mouse Over                                                  ${btn_portal_admin}
    Click Element                                               ${btn_portal_admin}
    Click On "Abmelden"
    Verify Successful Logout

Click On "Abmelden"
    Wait Until Page Contains Element                            ${lnk_SuperLogout}
    Mouse Over                                                  ${lnk_SuperLogout}
    Click Element                                               ${lnk_SuperLogout}


Click On "Zurück"
    Wait Until Page Contains                                    Zurück      #${btn_SuperBackPage}
    Mouse Over                                                  ${btn_SuperBackPage}
    Click Element                                               ${btn_SuperBackPage}

SA Login Error Message
    Error Message 1

Error Message 1
    Wait Until Page Contains                                    Anmeldung mit angegebenem Benutzernamen und Passwort fehlgeschlagen.

Error Message 2
    Wait Until Page Contains                                    Interner Fehler, bitte wenden Sie sich an einen Administrator.

Verify Sucessful Login
    Wait Until Page Contains Element                            ${title_mandanten}
    #Location Should Be                                          http://82.165.231.18:3001/tenants
    Element Should Contain                                      ${title_mandanten}              Mandanten
    Wait Until Page Contains Element                            ${txt_biqx}
    Element Should Contain                                      ${txt_biqx}                     biqx GmbH

Verify Successful Logout
    Wait Until Page Contains Element                            ${img_WelcomePage}
    Element Should Contain                                      ${btn_WelcomePageLogin}         Anmelden
    Element Should Contain                                      ${txt_WelcomePageText}          Willkommen bei 5G-Simone

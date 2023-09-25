*** Settings ***
Library                     SeleniumLibrary             timeout=00:00:30
Variables                   ../PageObject/5GSimonePages_locators.py
Resource                    ../Resources/baseVariables.robot
Resource                    ../Resources/Common.robot

*** Keywords ***
Negative Login Attempt To TA Page
    [Arguments]               ${email}    ${password}
    Navigate To 5G Simone Tenant Admin URL
    Enter Email                                             ${email}
    Click Next Button
    Enter Password                                          ${password}
    Click Login Button
    TA Login Error Message
    Log To Console                                          Invalid Login Details! Try again
    Click Back Button

Login Tenant Admin Page
    #Reload Page
    Enter Email                                             ${tenantAdmin_Email_simone}
    Click Next Button
    Enter Password                                          ${TA_Password}
    Click Login Button
    Log Title
    Validate Successful Login

Login To Another Tenant Admin Page
    #Reload Page
    Enter Email                                             ${tenantAdmin_Email_stadtbus}
    Click Next Button
    Enter Password                                          ${TA_Password}
    Click Login Button
    Log Title
    Validate Successful Login

Login To Tenant Page
    Enter Email                                             ${mandant_email_abiodun}
    Click Next Button
    Enter Password                                          ${mandant_password_abiodun}
    Click Login Button
    Log Title
    Validate Successful Login

Navigate To 5G Simone Tenant Admin URL
    Go To                                                   ${tenantAdmin_URL}
    Wait Until Page Contains                                Willkommen bei 5G-Simone
    Wait Until Page Contains Element                        ${img_WelcomePage}
    Wait Until Page Contains                                Anmelden
    Click Element                                           ${btn_WelcomePageLogin}


Enter Email
    [Arguments]             ${email}
    Wait Until Page Contains Element                        ${txt_tenantEmail}
    Mouse Over                                              ${txt_tenantEmail}
    input text                                              ${txt_tenantEmail}                      ${email}

Click Next Button
    Wait Until Page Contains Element                        ${btn_tenantNextPage}
    Mouse Over                                              ${btn_tenantNextPage}
    click element                                           ${btn_tenantNextPage}

Enter Password
    [Arguments]             ${pwd}
    Wait Until Page Contains Element                        ${txt_tenantPassword}
    Mouse Over                                              ${txt_tenantPassword}
    input text                                              ${txt_tenantPassword}                   ${pwd}

Click Login Button
    Wait Until Page Contains Element                        ${btn_tenantLogin}
    Mouse Over                                              ${btn_tenantLogin}
    Click Element                                           ${btn_tenantLogin}

Click Back Button
    Wait Until Page Contains Element                        ${btn_tenantBackPage}
    Mouse Over                                              ${btn_tenantBackPage}
    click element                                           ${btn_tenantBackPage}

Logout
    Log To Console                                          Logging out ...
    Wait Until Page Contains Element                        ${btn_tenant_name}
    Mouse Over                                              ${btn_tenant_name}
    Click Element                                           ${btn_tenant_name}
    Wait Until Element Is Visible                           ${lnk_tenantLogout}
    Mouse Over                                              ${lnk_tenantLogout}
    Click Element                                           ${lnk_tenantLogout}

TA Login Error Message
    Wait Until Page Contains                                Anmeldung mit angegebenem Benutzernamen und Passwort fehlgeschlagen.

Validate Successful Login
    Validate Menu-Items
    Location Should Be                                      http://82.165.231.18:3001/monocabs
    Log To Console                                          successful login

Validate Menu-Items
    Wait Until Page Contains            Monocabs
    Wait Until Page Contains            Karte
    Wait Until Page Contains            Quality of Service
    Wait Until Page Contains            Infotainment
    Wait Until Page Contains            Benutzerverwaltung

Validate Successful Logout
    location should be                                      http://20.52.117.91:3000/welcome
    Wait Until Page Contains                                Willkommen bei 5G-Simone
    Log To Console                                          successful logout




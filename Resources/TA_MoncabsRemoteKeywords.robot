*** Settings ***
Library                     SeleniumLibrary         timeout=00:00:30
Variables                   ../PageObject/5GSimonePages_locators.py
Resource                        ../Resources/baseVariables.robot

*** Keywords ***
Open Camera View
    Wait Until Page Contains            Remote
    Mouse Over                          ${btn_Remote}
    Click Element                       ${btn_Remote}

Validate If Camera View is Opened
    Page Should Contain                 ${Vehicle}
    Page Should Contain                 Fahrtrichtung Rechts
    #Page Should Contain                 Gleiskamera
    Page Should Contain                 Kabine
    #Page Should Contain                 Rückrichtung Links
    Page Should Contain                 Remote Steuerung aktivieren

Activate "Remote Steuerung"
    Click Element                       ${lnk_RemoteSteuerungAktivieren}

Toggle CameraView-fahrtrichtungRecht ACtivation-Deactivation Button
    Wait Until Page Contains Element    ${box_fahrtrichtungRecht}
    Element Should Contain              ${box_fahrtrichtungRecht}                   Anzeige inaktiv
    Click Element                       ${svg_activate_deactivate_fahrtrichtungRecht}
    Element Should Not Contain          ${box_fahrtrichtungRecht}                   Anzeige inaktiv
    Click Element                       ${svg_activate_deactivate_fahrtrichtungRecht}
    Element Should Contain              ${box_fahrtrichtungRecht}                   Anzeige inaktiv

Toggle CameraView-kabine ACtivation-Deactivation Button
    Wait Until Page Contains Element    ${box_kabine}
    Element Should Contain              ${box_kabine}                               Anzeige inaktiv
    Click Element                       ${svg_activate_deactivate_kabine}
    Element Should Not Contain          ${box_kabine}                               Anzeige inaktiv
    Click Element                       ${svg_activate_deactivate_kabine}
    Element Should Contain              ${box_kabine}                               Anzeige inaktiv

Toggle CameraView-3 ACtivation-Deactivation Button
    Wait Until Page Contains Element    ${svg_activate_deactivate_CameraView3}
    Click Element                       ${svg_activate_deactivate_CameraView3}

Toggle CameraView-4 ACtivation-Deactivation Button
    Wait Until Page Contains Element    ${svg_activate_deactivate_CameraView4}
    Click Element                       ${svg_activate_deactivate_CameraView4}

Click To Open CameraView-fahrtrichtungRecht in New Window And Validate The Small View is Disabled
    Open CameraView-fahrtrichtungRecht In New Tab
    Validate CAmeraView-fahrtrichtungRecht is Opened In A New Tab
    Validate Small CameraView-fahrtrichtungRecht is Disabled

Click To Open CameraView-Kabine in New Window And Validate The Small View is Disabled
    Open CameraView-Kabine In New Tab
    Validate CAmeraView-Kabine is Opened In A New Tab
    Validate Small CameraView-Kabine is Disabled

Open CameraView-fahrtrichtungRecht In New Tab
    Wait Until Page Contains Element    ${svg_Open_fahrtrichtungRecht_In_New_Tab}
    Click Element                       ${svg_Open_fahrtrichtungRecht_In_New_Tab}
Validate CAmeraView-fahrtrichtungRecht is Opened In A New Tab
    Location Should Be                  ${CameraView_URL_In_New_Tab}
    Sleep    7
Validate Small CameraView-fahrtrichtungRecht is Disabled
    Switch Window                       title=Leitstand
    Wait Until Page Contains Element    ${box_fahrtrichtungRecht}
    Element Should Contain              ${box_fahrtrichtungRecht}    Anzeige inaktiv
    Sleep    3

Open CameraView-Kabine In New Tab
    Wait Until Page Contains Element    ${svg_Open_Kabine_In_New_Tab}
    Click Element                       ${svg_Open_Kabine_In_New_Tab}
Validate CAmeraView-Kabine is Opened In A New Tab
    Location Should Be                  ${CameraView_URL_In_New_Tab}
    Sleep    7
Validate Small CameraView-Kabine is Disabled
    Switch Window                       title=Leitstand
    Wait Until Page Contains Element    ${box_Kabine}
    Element Should Contain              ${box_Kabine}    Anzeige inaktiv
    Sleep    3


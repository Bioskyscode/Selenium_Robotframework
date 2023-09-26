*** Settings ***
Library                         SeleniumLibrary         timeout=00:00:30
Variables                       ../PageObject/5GSimonePages_locators.py

*** Keywords ***
Navigate To Infotainment Page
    Wait Until Page Contains                    Infotainment
    Mouse Over                                  ${li_infotainment}
    Click Element                               ${li_infotainment}
    Validate Infotainment Page is Loaded Successfully

Validate Infotainment Page is Loaded Successfully
    Wait Until Page Contains Element            ${Select_Station}
    Page Should Contain                         Bitte Bahnhof wählen
    Wait Until Page Contains Element            ${Topic_tab}
    Page Should Contain                         Wetter
    Page Should Contain                         Abfahrt
    Page Should Contain                         Gesundheit
    Page Should Contain                         Shopping
    Page Should Contain                         Unterkunft
    Page Should Contain                         Gastronomie
    Page Should Contain                         Sehenswürdigkeiten
    Page Should Contain                         Kultur
    
Select Station
    Wait Until Page Contains Element            ${Select_Station}
    Mouse Over                                  ${Select_Station}
    Click Element                               ${Select_Station}

Select Minden BHF
    Mouse Over                                  ${Minden_HBF}
    Click Element                               ${Minden_HBF}

Select Bielefeld BHF
    Mouse Over                                  ${Bielefeld_HBF}
    Click Element                               ${Bielefeld_HBF}

Select Lemgo BHF
    Mouse Over                                  ${Lemgo_BHF}
    Click Element                               ${Lemgo_BHF}

Select Bösingfeld BHF
    Mouse Over                                  ${Bösingfeld_HBF}
    Click Element                               ${Bösingfeld_HBF}
    
Weather Data
    Wait Until Page Contains Element            ${Temperature}
    Should Not Be Empty                         ${Temperature}
    Wait Until Page Contains Element            ${Weather_Icon}
    Should Not Be Empty                         ${Weather_Icon}
    Wait Until Page Contains Element            ${Weather_Description}
    Should Not Be Empty                         ${Weather_Description}
    Wait Until Page Contains Element            ${Wind}
    Element Should Contain                      ${Wind}                     Wind:
    Element Should Contain                      ${Rain}                     Regen:
    Element Should Contain                      ${Visibility}               Sicht:

Navigate To Abfahrt
    Click Element                               ${li_Abfahrt}
    Abfahrt Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Anschlussverbindungen)

Navigate To Gesundheit
    Click Element                               ${li_Gesundheit}
    Gesundheit Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Thema Gesundheit)

Navigate To Shopping
    Click Element                               ${li_Shopping}
    Shopping Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Thema Shopping)

Navigate To Unterkunft
    Click Element                               ${li_Unterkunft}
    Unterkunft Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Übernachtungsoptionen)

Navigate To Gastronomie
    Click Element                               ${li_Gastronomie}
    Gastronomie Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Gastronomie)

Navigate To Sehenswürdigkeit
    Click Element                               ${li_Sehenswürdigkeiten}
    Sehenswürdigkeiten Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Sehenswürdigkeiten)

Navigate To Kultur
    Click Element                               ${li_Kultur}
    Kultur Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Entertainment)
    
Abfahrt Table Header Validation
    Wait Until Page Contains Element            ${Abfahrt_table}
    Table Column Should Contain                 ${Abfahrt_table}                        1                   Abfahrt
    Table Column Should Contain                 ${Abfahrt_table}                        2                   Gl./HSt.
    Table Column Should Contain                 ${Abfahrt_table}                        3                   Richtung
    Table Column Should Contain                 ${Abfahrt_table}                        4                   Linie
    Table Column Should Contain                 ${Abfahrt_table}                        5                   Dienst

Gesundheit Table Header Validation
    Wait Until Page Contains Element            ${Gesundheit_table}
    Table Column Should Contain                 ${Gesundheit_table}                     1                   Name
    Table Column Should Contain                 ${Gesundheit_table}                     2                   Ausrichtung
    Table Column Should Contain                 ${Gesundheit_table}                     3                   Addresse
    Table Column Should Contain                 ${Gesundheit_table}                     4                   Entfernung
    Table Column Should Contain                 ${Gesundheit_table}                     5                   Telefon
    Table Column Should Contain                 ${Gesundheit_table}                     6                   Website

Shopping Table Header Validation
    Wait Until Page Contains Element            ${Shopping_table}
    Table Column Should Contain                 ${Shopping_table}                       1                   Name
    Table Column Should Contain                 ${Shopping_table}                       2                   Art
    Table Column Should Contain                 ${Shopping_table}                       3                   Addresse
    Table Column Should Contain                 ${Shopping_table}                       4                   Entfernung
    Table Column Should Contain                 ${Shopping_table}                       5                   Telefon
    Table Column Should Contain                 ${Shopping_table}                       6                   Geöffnet
    Table Column Should Contain                 ${Shopping_table}                       7                   Rollstuhl geeignet

Unterkunft Table Header Validation
    Wait Until Page Contains Element            ${Unterkunft_table}
    Table Column Should Contain                 ${Unterkunft_table}                     1                   Name
    Table Column Should Contain                 ${Unterkunft_table}                     2                   Art
    Table Column Should Contain                 ${Unterkunft_table}                     3                   Addresse
    Table Column Should Contain                 ${Unterkunft_table}                     4                   Entfernung
    Table Column Should Contain                 ${Unterkunft_table}                     5                   Telefon
    Table Column Should Contain                 ${Unterkunft_table}                     6                   E-Mail
    Table Column Should Contain                 ${Unterkunft_table}                     7                   Website
Gastronomie Table Header Validation
    Wait Until Page Contains Element            ${Gastronomie_table}
    Table Column Should Contain                 ${Gastronomie_table}                    1                   Name
    Table Column Should Contain                 ${Gastronomie_table}                    2                   Küche
    Table Column Should Contain                 ${Gastronomie_table}                    3                   Vegetarisch
    Table Column Should Contain                 ${Gastronomie_table}                    4                   Vegan
    Table Column Should Contain                 ${Gastronomie_table}                    5                   Addresse
    Table Column Should Contain                 ${Gastronomie_table}                    6                   Entfernung
    Table Column Should Contain                 ${Gastronomie_table}                    7                   Website
    Table Column Should Contain                 ${Gastronomie_table}                    8                   Geöffnet
Sehenswürdigkeiten Table Header Validation
    Wait Until Page Contains Element            ${Sehenswürdigkeiten_table}
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            1                   Name
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            2                   Art
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            3                   Beschreibung
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            4                   Addresse
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            5                   Entfernung
Kultur Table Header Validation
    Wait Until Page Contains Element            ${Kultur_table}
    Table Column Should Contain                 ${Kultur_table}                        1                   Name
    Table Column Should Contain                 ${Kultur_table}                        2                   Art
    Table Column Should Contain                 ${Kultur_table}                        3                   Addresse
    Table Column Should Contain                 ${Kultur_table}                        4                   Entfernung
    Table Column Should Contain                 ${Kultur_table}                        5                   Telefon
    Table Column Should Contain                 ${Kultur_table}                        6                   E-Mail
    Table Column Should Contain                 ${Kultur_table}                        7                   Geöffnet
    Table Column Should Contain                 ${Kultur_table}                        8                   Rollstuhl geeignet

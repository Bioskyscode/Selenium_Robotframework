*** Settings ***
Library                         SeleniumLibrary         timeout=00:00:30
Library                         FakerLibrary
Library    Collections
Variables                       ../PageObject/5GSimonePages_locators.py

*** Keywords ***
Navigate To Infotainment Page
    Wait Until Page Contains                    Infotainment
    Mouse Over                                  ${li_infotainment}
    Click Element                               ${li_infotainment}
    Validate Infotainment Page is Loaded Successfully

Validate Infotainment Page is Loaded Successfully
    Wait Until Page Contains Element            ${Select_Station}
    ${Selected_Station}                         Get Text                        ${Select_Station}
    Log To Console    ${Selected_Station}
    Page Should Contain                         ${Selected_Station}
    Page Should Contain                         Routen ausgehend vom Bahnhof
    Wait Until Page Contains Element            ${Topic_tab}
    Page Should Contain                         Wetter
    Page Should Contain                         Abfahrt
    Page Should Contain                         Gesundheit
    Page Should Contain                         Shopping
    Page Should Contain                         Unterkunft
    Page Should Contain                         Gastronomie
    Page Should Contain                         Sehenswürdigkeiten
    Page Should Contain                         Kultur
    Page Should Contain                         Annehmlichkeit
    Page Should Contain                         Leihräder/-roller

Select Topics
    #Select Wetter
    Select Abfahrt
    Select Gesundheit
    Select Shopping
    Select Unterkunft
    Select Gastronomie
    Select Sehenswürdigkeiten
    Select Kultur
    Select Annehmlichkeit

Select Wetter
    #Selenium Speed
    Wait Until Page Contains Element            ${topic_wetter}
    Click Element                               ${topic_wetter}
    Wait Until Page Contains Element            ${li_Wetter}
    Page Should Contain Element                 ${li_Wetter}

Select Abfahrt
    Wait Until Page Contains Element            ${topic_abfahrt}
    Mouse Over                                  ${topic_abfahrt}
    Click Element                               ${topic_abfahrt}
    Wait Until Page Contains Element            ${li_Abfahrt}
    Page Should Contain Element                 ${li_Abfahrt}

Select Gesundheit
    Wait Until Page Contains Element            ${topic_gesundheit}
    Mouse Over                                  ${topic_gesundheit}
    Click Element                               ${topic_gesundheit}

Select Shopping
    Wait Until Page Contains Element            ${topic_shopping}
    Mouse Over                                  ${topic_shopping}
    Click Element                               ${topic_shopping}

Select Unterkunft
    Wait Until Page Contains Element            ${topic_unterkunft}
    Mouse Over                                  ${topic_unterkunft}
    Click Element                               ${topic_unterkunft}

Select Gastronomie
    Wait Until Page Contains Element            ${topic_gastronomie}
    Mouse Over                                  ${topic_gastronomie}
    Click Element                               ${topic_gastronomie}

Select Sehenswürdigkeiten
    Wait Until Page Contains Element            ${topic_sehenswürdigkeiten}
    Mouse Over                                  ${topic_sehenswürdigkeiten}
    Click Element                               ${topic_sehenswürdigkeiten}

Select Kultur
    Wait Until Page Contains Element            ${topic_kultur}
    Mouse Over                                  ${topic_kultur}
    Click Element                               ${topic_kultur}

Select Annehmlichkeit
    Wait Until Page Contains Element            ${topic_annehmlichkeit}
    Mouse Over                                  ${topic_annehmlichkeit}
    Click Element                               ${topic_annehmlichkeit}

    
Select Station
    Wait Until Page Contains Element            ${Select_Station}
    Mouse Over                                  ${Select_Station}
    Click Element                               ${Select_Station}

Select Minden BHF
    #Wait Until Page Contains Element            ${Minden_HBF}
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

Select BÜ Bruchstraße BHF
    Mouse Over                                  ${BÜ_Bruchstr_HBF}
    Click Element                               ${BÜ_Bruchstr_HBF}

Select Brückenweg BHF
    Mouse Over                                  ${Brückenweg_HBF}
    Click Element                               ${Brückenweg_HBF}
    
Weather Data
    #Common.Selenium Speed
    Wait Until Page Contains Element            ${Weather_Container}
    Should Not Be Empty                         ${Weather_Container}
    Wait Until Page Contains Element            ${Temperature}
    Should Not Be Empty                         ${Temperature}
    Wait Until Page Contains Element            ${Weather_Icon}
    Should Not Be Empty                         ${Weather_Icon}
    Wait Until Page Contains Element            ${Weather_Description}
    Should Not Be Empty                         ${Weather_Description}
    Wait Until Page Contains Element            ${Wind}
    Element Should Contain                      ${Wind}                                 Wind:
    Element Should Contain                      ${Rain}                                 Regen:
    Element Should Contain                      ${Visibility}                           Sicht:

Navigate To Abfahrt
    Click Element                               ${li_Abfahrt}
    Abfahrt Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Abfahrt)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Abfahrt_row}                              Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Abfahrt_row_Text}                         Get Text                                ${Abfahrt_row}
    Element Text Should Be                      ${Abfahrt_row}                          ${Abfahrt_row_Text}

Navigate To Gesundheit
    Click Element                               ${li_Gesundheit}
    Gesundheit Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Gesundheit)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Gesundheit_row}                           Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Gesundheit_row_Text}                      Get Text                                ${Gesundheit_row}
    Element Text Should Be                      ${Gesundheit_row}                       ${Gesundheit_row_Text}

Navigate To Shopping
    Click Element                               ${li_Shopping}
    Shopping Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Shopping)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Shopping_row}                             Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Shopping_row_Text}                        Get Text                                ${Shopping_row}
    Element Text Should Be                      ${Shopping_row}                          ${Shopping_row_Text}

Navigate To Unterkunft
    Click Element                               ${li_Unterkunft}
    Unterkunft Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (unterkunft)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Unterkunft_row}                           Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Unterkunft_row_Text}                      Get Text                                ${Unterkunft_row}
    Element Text Should Be                      ${Unterkunft_row}                       ${Unterkunft_row_Text}

Navigate To Gastronomie
    Click Element                               ${li_Gastronomie}
    Gastronomie Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Gastronomie)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Gastronomie_row}                          Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Gastronomie_row_Text}                     Get Text                                ${Gastronomie_row}
    Element Text Should Be                      ${Gastronomie_row}                      ${Gastronomie_row_Text}

Navigate To Sehenswürdigkeit
    Click Element                               ${li_Sehenswürdigkeiten}
    Sehenswürdigkeiten Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Sehenswürdigkeiten)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Sehenswürdigkeit_row}                     Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Sehenswürdigkeit_row_Text}                Get Text                                ${Sehenswürdigkeit_row}
    Element Text Should Be                      ${Sehenswürdigkeit_row}                 ${Sehenswürdigkeit_row_Text}

Navigate To Kultur
    Click Element                               ${li_Kultur}
    Kultur Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Kultur)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Kultur_row}                               Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Kultur_row_Text}                          Get Text                                ${Kultur_row}
    Element Text Should Be                      ${Kultur_row}                           ${Kultur_row_Text}

Navigate To Annehmlichkeit
    Click Element                               ${li_annehmlichkeit}
    Annehmlichkeit Table Header Validation
    Page Should Not Contain                     Keine Daten geladen (Annehmlichkeit)
    ${Total_Row}                                Get Element Count                       ${table_InfotainmentTopic_row}
    ${Random_row}                               FakerLibrary.Random Int                 1                                   ${Total_Row}
    ${Annehmlichkeit_row}                       Set Variable                            //table[@role="table"]/tbody/tr[${Random_row}]
    ${Annehmlichkeit_row_Text}                  Get Text                                ${Annehmlichkeit_row}
    Element Text Should Be                      ${Annehmlichkeit_row}                   ${Annehmlichkeit_row_Text}

Navigate To Leihräder/-roller
    Click Element                               ${li_leihräder}
    
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
    Table Column Should Contain                 ${Gesundheit_table}                     4                   Luftlinie
    Table Column Should Contain                 ${Gesundheit_table}                     5                   Route
    Table Column Should Contain                 ${Gesundheit_table}                     6                   Telefon
    Table Column Should Contain                 ${Gesundheit_table}                     7                   Website

Shopping Table Header Validation
    Wait Until Page Contains Element            ${Shopping_table}
    Table Column Should Contain                 ${Shopping_table}                       1                   Name
    Table Column Should Contain                 ${Shopping_table}                       2                   Art
    Table Column Should Contain                 ${Shopping_table}                       3                   Addresse
    Table Column Should Contain                 ${Shopping_table}                       4                   Luftlinie
    Table Column Should Contain                 ${Shopping_table}                       5                   Route
    Table Column Should Contain                 ${Shopping_table}                       6                   Telefon
    Table Column Should Contain                 ${Shopping_table}                       7                   Geöffnet
    Table Column Should Contain                 ${Shopping_table}                       8                   Rollstuhl geeignet

Unterkunft Table Header Validation
    Wait Until Page Contains Element            ${Unterkunft_table}
    Table Column Should Contain                 ${Unterkunft_table}                     1                   Name
    Table Column Should Contain                 ${Unterkunft_table}                     2                   Art
    Table Column Should Contain                 ${Unterkunft_table}                     3                   Addresse
    Table Column Should Contain                 ${Unterkunft_table}                     4                   Luftlinie
    Table Column Should Contain                 ${Unterkunft_table}                     5                   Route
    Table Column Should Contain                 ${Unterkunft_table}                     6                   Telefon
    Table Column Should Contain                 ${Unterkunft_table}                     7                   E-Mail
    Table Column Should Contain                 ${Unterkunft_table}                     8                   Website
Gastronomie Table Header Validation
    Wait Until Page Contains Element            ${Gastronomie_table}
    Table Column Should Contain                 ${Gastronomie_table}                    1                   Name
    Table Column Should Contain                 ${Gastronomie_table}                    2                   Küche
    Table Column Should Contain                 ${Gastronomie_table}                    3                   Vegetarisch
    Table Column Should Contain                 ${Gastronomie_table}                    4                   Vegan
    Table Column Should Contain                 ${Gastronomie_table}                    5                   Addresse
    Table Column Should Contain                 ${Gastronomie_table}                    6                   Luftlinie
    Table Column Should Contain                 ${Gastronomie_table}                    7                   Route
    Table Column Should Contain                 ${Gastronomie_table}                    8                   Website
    Table Column Should Contain                 ${Gastronomie_table}                    9                   Geöffnet
Sehenswürdigkeiten Table Header Validation
    Wait Until Page Contains Element            ${Sehenswürdigkeiten_table}
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            1                   Name
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            2                   Art
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            3                   Beschreibung
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            4                   Addresse
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            5                   Luftlinie
    Table Column Should Contain                 ${Sehenswürdigkeiten_table}            6                   Route
Kultur Table Header Validation
    Wait Until Page Contains Element            ${Kultur_table}
    Table Column Should Contain                 ${Kultur_table}                        1                   Name
    Table Column Should Contain                 ${Kultur_table}                        2                   Art
    Table Column Should Contain                 ${Kultur_table}                        3                   Addresse
    Table Column Should Contain                 ${Kultur_table}                        4                   Luftlinie
    Table Column Should Contain                 ${Kultur_table}                        5                   Route
    Table Column Should Contain                 ${Kultur_table}                        6                   Telefon
    Table Column Should Contain                 ${Kultur_table}                        7                   E-Mail
    Table Column Should Contain                 ${Kultur_table}                        8                   Geöffnet
    Table Column Should Contain                 ${Kultur_table}                        9                   Rollstuhl geeignet

Annehmlichkeit Table Header Validation
    Wait Until Page Contains Element            ${Annehmlichkeit_table}
    Table Column Should Contain                 ${Annehmlichkeit_table}                1                   Name
    Table Column Should Contain                 ${Annehmlichkeit_table}                2                   Service
    Table Column Should Contain                 ${Annehmlichkeit_table}                3                   Addresse
    Table Column Should Contain                 ${Annehmlichkeit_table}                4                   Luftlinie
    Table Column Should Contain                 ${Annehmlichkeit_table}                5                   Route
    Table Column Should Contain                 ${Annehmlichkeit_table}                6                   Gebühr
    Table Column Should Contain                 ${Annehmlichkeit_table}                7                   Geöffnet


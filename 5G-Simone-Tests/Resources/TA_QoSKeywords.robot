*** Settings ***
Library                         SeleniumLibrary         timeout=00:00:30
Library    Process
Library    OperatingSystem
Variables                       ../PageObject/5GSimonePages_locators.py
Resource                       ../Resources/TA_InfotainmentKeywords.robot
Resource                       ../Resources/Common.robot


*** Keywords ***
Navigate To "QoS-Infotainment" Page
    Wait Until Page Contains Element                    ${btn_Qos}
    Mouse Over                                          ${btn_Qos}
    Click Element                                       ${btn_Qos}
    Wait Until Page Contains Element                    ${btn_Qos_Infotainment}
    Mouse Over                                          ${btn_Qos_Infotainment}
    Click Element                                       ${btn_Qos_Infotainment}
    Wait Until Page Contains Element                    ${btn_Datenaktualität}
    Page Should Contain Button                          ${btn_Datenaktualität}
    Page Should Contain Button                          ${btn_Entfernungsverteilung}
     Wait Until Page Contains                            Broker Response:

Validate Broker Response Table
    Wait Until Page Contains Element                    ${table_brokerResponse}
    Table Column Should Contain                         ${table_brokerResponse}                 1               Daten
    Table Column Should Contain                         ${table_brokerResponse}                 2               Werte
    Table Column Should Contain                         ${table_brokerResponse}                 3               Fehler
    Table Column Should Contain                         ${table_brokerResponse}                 4               Basis
    ${brokerResponse_row1}                              Set Variable                            ${table_brokerResponse_row1}
    ${brokerResponse_row1_Text}                         Get Text                                ${brokerResponse_row1}
    Element Text Should Be                              ${brokerResponse_row1}                  ${brokerResponse_row1_Text}
    ${brokerResponse_row2}                              Set Variable                            ${table_brokerResponse_row2}
    ${brokerResponse_row2_Text}                         Get Text                                ${brokerResponse_row2}
    Should Not Be Empty    ${brokerResponse_row2_Text}
    ${brokerResponse_row3}                              Set Variable                            ${table_brokerResponse_row3}
    ${brokerResponse_row3_Text}                         Get Text                                ${brokerResponse_row3}
    Should Not Be Empty    ${brokerResponse_row3_Text}

Check If Data Are Received From Telekom
    ${initialSentData}                                  Get Text                                ${telekomData_row}
    Sleep    10
    ${subsequentSentData}                               Get Text                                ${telekomData_row}
    Should Not Be Equal                                 ${initialSentData}                      ${subsequentSentData}

Check If Data Are Received From Backend
    ${initialSentData1}                                 Get Text                                ${backendData_row}
    Sleep    10
    ${subsequentSentData}                               Get Text                                ${backendData_row}
    Should Not Be Equal                                 ${initialSentData1}                     ${subsequentSentData}

Select a Random Station
    #Selenium Speed
    ${Stations}                                         Create Dictionary               station1=${Minden_HBF}          station2=${Lemgo_BHF}       station3=${Bielefeld_HBF}       station4=${Bösingfeld_HBF}       station5=${BÜ_Bruchstr_HBF}       station6=${Brückenweg_HBF}
    ${random_station_Key}                               Evaluate                        random.choice(list($Stations.keys()))
    ${random_station}                                   Get From Dictionary             ${Stations}                     ${random_station_Key}
    Select Station
    Wait Until Page Contains Element                    ${random_station}
    Click Element                                       ${random_station}
    ${BHF}                                              SeleniumLibrary.Get Text                        ${random_station}
    Set Global Variable                                 ${GlobalVar_BHF}                ${BHF}
    Wait Until Page Contains                            ${BHF}

Go To "Datenaktualität" Popup-Page
    Wait Until Page Contains Element                    ${btn_Datenaktualität}
    Mouse Over                                          ${btn_Datenaktualität}
    Click Element                                       ${btn_Datenaktualität}

Validate Datenaktualität Popup-Page Contents
    Wait Until Page Contains Element                    ${container_Datenaktualität}
    Page Should Contain Element                         ${btn_Pause}
    Page Should Contain                                 Infotainment Datenaktualität
    Page Should Contain                                 Zeitdifferenzen zwischen Datenaktualisierung des TELEKOM Brokers und Eingang im Backend der App
    Page Should Contain                                 Offset Aktualität [s]
    Page Should Contain                                 Dateneingang Backend
    Validate "Topics" Are Displayed on Datenaktualität Page

Validate "Topics" Are Displayed on Datenaktualität Page
    Page Should Contain Element                         ${container_Datenaktualität_topics}
    Should Not Be Empty                                 ${container_Datenaktualität_topics}

Go To "Entfernungsverteilung" Page
    Wait Until Page Contains Element                    ${btn_Entfernungsverteilung}
    Mouse Over                                          ${btn_Entfernungsverteilung}
    Click Element                                       ${btn_Entfernungsverteilung}

Validate "Entfernungsverteilung" Page Contents
    Page Should Contain                                 Infotainment Entfernungsverteilung
    Page Should Contain                                 Verteilung der nach Thema jeweils geringsten, mittleren und weitesten Entfernung der Angebote in und bei ${GlobalVar_BHF}
    Page Should Contain                                 Gesetzte akzeptable Entfernung (grün):
    Page Should Contain                                 Minimum
    Page Should Contain                                 Mittelwert
    Page Should Contain                                 Maximum

Navigate To "Fzg-Meldungen"
    Wait Until Page Contains Element                    ${btn_Qos}
    Mouse Over                                          ${btn_Qos}
    Click Element                                       ${btn_Qos}
    Wait Until Page Contains Element                    ${btb_FzgMeldung}
    Mouse Over                                          ${btb_FzgMeldung}
    Click Element                                       ${btb_FzgMeldung}
    Wait Until Page Contains                            Geschwindigkeitsanalyse
    Page Should Contain Button                          ${btn_Geschwindigkeitsanalyse}
    Page Should Contain                                 Datenverbindung
    Page Should Contain                                 Fahrzeugsendestatus
    Page Should Contain                                 Anzahl
    Page Should Contain                                 Fahrzeugmeldungen
    Page Should Contain                                 Letztes sendendes Fahrzeug
    
Validate "Fahrzeuge Bewegungsdaten"
    ${update}       Process.Start Process           C:/Users/AbiodunAjibade/PycharmProjects/5G-Simone-Frontend/5G-Simone-Tests/PageObject/vehicle_mover.py         status-window      shell=True      cwd=${OUTPUT_DIR}
    Wait Until Page Contains Element                    ${btn_Geschwindigkeitsanalyse}
    Mouse Over                                          ${btn_Geschwindigkeitsanalyse}
    Click Element                                       ${btn_Geschwindigkeitsanalyse}
    Wait Until Page Contains Element                    ${container_fahrzeugeBewegungsdaten}
    Page Should Contain                                 Fahrzeuge Bewegungsdaten
    Page Should Contain Button                          ${btn_Geschwindigkeitsanalyse_pause}
    Page Should Contain                                 Max. Geschw.
    Page Should Contain                                 Max. Beschl.
    Page Should Contain                                 Geschwindigkeiten...
    Page Should Contain                                 Datengenerierung
    Page Should Contain                                 Beschleunigungen...
    Page Should Contain                                 Datengenerierung
    Page Should Contain                                 Fahrzeug
    Page Should Contain                                 Fehler
    Page Should Contain                                 Eingang
    Page Should Contain                                 Bus 2
    Page Should Contain                                 Bus 11
    Fahrzeug
    Fehler
    Eingang
    Wait Until Page Contains Element                    ${btn_Geschwindigkeitsanalyse_pause}
    Click Element                                       ${btn_Geschwindigkeitsanalyse_pause}
    Sleep    3
    Click Element                                       ${btn_Geschwindigkeitsanalyse_pause}

Fahrzeug
    Click Element                                       ${btn_fahrzeug_filter}
    Wait Until Page Contains Element                    ${fahrzeug_filter}
    Click Element                                       ${fahrzeug_filter_matchAll}
    Page Should Contain                                 Match All
    Page Should Contain                                 Match Any
    Click Element                                       ${li_fahrzeug_filter_matchAny}
    Click Element                                       ${fahrzeug_filter_startsWith}
    Page Should Contain                                 Starts with
    Page Should Contain                                 Contains
    Page Should Contain                                 Not contains
    Page Should Contain                                 Ends with
    Click Element                                       ${li_fahrzeug_filter_contain}
    Click Element                                       ${fahrzeug_filter_AddRule}
    Page Should Contain                                 Remove Rule
    Click Element                                       ${fahrzeug_filter_RemoveRule}
    Click Element                                       ${fahrzeug_filter_clear}


Fehler
     Click Element                                      ${btn_fehler_filter}
    Wait Until Page Contains Element                    ${fahrzeug_filter}
    Click Element                                       ${fahrzeug_filter_matchAll}
    Page Should Contain                                 Match All
    Page Should Contain                                 Match Any
    Click Element                                       ${li_fahrzeug_filter_matchAny}
    Click Element                                       ${fehler_filter_klasse}
    Page Should Contain                                 Ohne Zeit
    Page Should Contain                                 Eingang alt
    Page Should Contain                                 Ohne Koord.
    Page Should Contain                                 Ang. Geschw.
    Click Element                                       ${li_fehler_filter_eingangAlt}
    Click Element                                       ${btn_fehler_filter_Klasse_close}
    Click Element                                       ${fahrzeug_filter_AddRule}
    Page Should Contain                                 Remove Rule
    Click Element                                       ${fehler_filter_RemoveRule}
    Click Element                                       ${fahrzeug_filter_clear}

Eingang
    Click Element                                       ${btn_eingang_filter}
    Wait Until Page Contains Element                    ${fahrzeug_filter}
    Click Element                                       ${fahrzeug_filter_matchAll}
    Page Should Contain                                 Match All
    Page Should Contain                                 Match Any
    Click Element                                       ${li_fahrzeug_filter_matchAny}
    Click Element                                       ${fahrzeug_filter_startsWith}
    Page Should Contain                                 Starts with
    Page Should Contain                                 Contains
    Page Should Contain                                 Not contains
    Page Should Contain                                 Ends with
    Click Element                                       ${li_fahrzeug_filter_contain}
    Click Element                                       ${fahrzeug_filter_AddRule}
    Page Should Contain                                 Remove Rule
    Click Element                                       ${fahrzeug_filter_RemoveRule}
    Click Element                                       ${fahrzeug_filter_clear}




*** Settings ***
Library                         SeleniumLibrary         timeout=00:00:30
Variables                       ../PageObject/5GSimonePages_locators.py
Resource                       ../Resources/TA_InfotainmentKeywords.robot
#Resource    Common.robot
#Library         Collections
#Library    OperatingSystem

*** Variables ***
#&{Stations}         station1=${Minden_HBF}          station2=${Lemgo_BHF}       station3=${Bielefeld_HBF}       station4=${Bösingfeld_HBF}       station5=${BÜ_Bruchstr_HBF}       station6=${Brückenweg_HBF}

*** Keywords ***
Navigate To "QoS-Infotainment" Page
    #Selenium Speed
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
    ${BHF}     Get Text    ${random_station}
    Set Global Variable    ${GlobalVar_BHF}               ${BHF}
    Wait Until Page Contains    ${BHF}

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
    #${Total_Topic1}                                     Get Element Count                       ${container_Datenaktualität_topics}
    #Sleep    100
    #${Total_Topic2}                                     Get Element Count                       ${container_Datenaktualität_topics}
    #Sleep    30
    #${Total_Topic3}                                     Get Element Count                       ${container_Datenaktualität_topics}
    #${total}                                            Create Dictionary                       topic1=${Total_Topic1}                  topic2=${Total_Topic2}       #topic3=${Total_Topic3}
    #${random_topic_Key}                                 Evaluate                                random.choice(list($total.keys()))
    #${random_total}                                     Get From Dictionary                     ${total}                                ${random_topic_Key}
    #${isTopicMoreThan1}                                 Evaluate                                ${random_total}>0
    #Should Be True                                      ${isTopicMoreThan1}

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




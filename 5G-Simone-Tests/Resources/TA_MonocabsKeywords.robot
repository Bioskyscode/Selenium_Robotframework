*** Settings ***
Library                     SeleniumLibrary
Variables                   ../PageObject/5GSimonePages_locators.py
Resource                    ../Resources/TA_LoginKeywords.robot
Resource                    ../Resources/TA_VehicleMoveUpdateKeywords.robot
Resource                    ../Resources/baseVariables.robot

*** Keywords ***
Table Header Validation
    Wait Until Page Contains Element                    ${tbl_monocabs_table}
    table column should contain                         ${tbl_monocabs_table}               1           Fzg.-ID
    table column should contain                         ${tbl_monocabs_table}               2           Bezeichnung
    #table column should contain                         ${tbl_monocabs_table}               3           Kurzbez.
    table column should contain                         ${tbl_monocabs_table}               3           Batterie
    table column should contain                         ${tbl_monocabs_table}               4           Geschw.
    table column should contain                         ${tbl_monocabs_table}               5           Passagiere
    table column should contain                         ${tbl_monocabs_table}               6           Fehler
    table column should contain                         ${tbl_monocabs_table}               7           Zur Karte

Verify Monocabs Table
    Table Header Validation
    TA_VehicleMoveUpdateKeywords.Start Vehicle Move Update
    Toggle Between QoS and Monocabs Page
    Monocabs Table Should Not Be Empty
    Check If Monocabs Table Contains Vehicle

Toggle Between QoS and Monocabs Page
    Click Element                                   ${btn_Qos}
    Click Element                                   ${btn_Monocabs}

Monocabs Table Should Not Be Empty
    Wait Until Page Contains Element                    ${tbl_monocabs_table_BusData}

Check If Monocabs Table Contains Vehicle
    Table Should Contain                                ${tbl_monocabs_table}                ${Vehicle}

Check If Tenant Admin can View Vehicle Details
    Click A Bus On The Monocabs Table
    Display Bus Pop-Up Detail

Click A Bus On The Monocabs Table
    Wait Until Page Contains Element                    ${tbl_monocabs_table_BusData}
    Mouse Over                                          ${tbl_monocabs_table_BusData}
    Click Element                                       ${tbl_monocabs_table_BusData}

Display Bus Pop-Up Detail
    Wait Until Page Contains Element                    ${popup_monocabVehicleDetails}
    ${monocabVehicleDetailsTitle}                       Get Text                            ${title_monocabsVehicleDetails}
    Log To Console                                      Monocab-vehicle: ${monocabVehicleDetailsTitle}
    Page Should Contain                                 ${monocabVehicleDetailsTitle}
    Page Should Contain                                 Latenz Datenermittlung
    Page Should Contain                                 Beschleunigung
    Page Should Contain                                 Fahrstatus
    Page Should Contain                                 Gesamtstatus
    Page Should Contain                                 Ladestand
    Page Should Contain                                 Ist-Geschwindigkeit
    Page Should Contain                                 Fahrgastzahl aktuell
    Page Should Contain                                 Meldung
    Page Should Contain                                 Fahrzeugliste
    Page Should Contain                                 Auf Karte ansehen
    Page Should Contain                                 Remote

Return To Monocabs Fahrzeugliste
    Selenium Speed
    Wait Until Page Contains Element                    ${Dynamics_VehicleDetails_Popup}
    Wait Until Page Contains Element                    ${btn_ReturnToDetailOverview}
    Click Element                                       ${btn_ReturnToDetailOverview}
    Wait Until Page Contains                            Fahrzeugliste
    Click Element                                       ${btn_Fahrzeugliste}
    Wait Until Page Contains Element                    ${tbl_monocabs_table}

Show Vehicle on The Map Through Monocabs Table
    Wait Until Page Contains Element                    ${MonocabsTable_VehicleIcon}
    Mouse Over                                          ${MonocabsTable_VehicleIcon}
    Click Element                                       ${MonocabsTable_VehicleIcon}
    Verify Vehicle Is On The Map

Show Vehicle on The Map Through The vehicle Pop-up Details
    Wait Until Page Contains Element                    ${Auf_Karte_Ansehen_popupDetails}
    Mouse Over                                          ${Auf_Karte_Ansehen_popupDetails}
    Click Element                                       ${Auf_Karte_Ansehen_popupDetails}
    Verify Vehicle Is On The Map

Verify Vehicle Is On The Map
    Wait Until Page Contains Element                    ${img_vehicle}
    Mouse Over                                          ${img_vehicle}
    Wait Until Page Contains Element                    ${vehicleDetailPopup}
    Click Element                                       ${img_vehicle}

Verify Station Data Are Displayed
    Fahrzeug Info
    Fahrzeugstatus
    Fahrstatus
    Mobilfunk
    Raspberry Pi
    Umgebungswerte
    Abfahrt
    Wetter

Fahrzeug Info
    Page Should Contain                                 Fahrzeug
    Page Should Contain                                 ${Vehicle}
    Page Should Contain                                 Verkehrsunternehmen
    Page Should Contain                                 Linienfahrt
    Page Should Contain                                 ${Linie_Id}
    Page Should Contain                                 Transport
    Page Should Contain                                 Fahrgäste
    Page Should Contain                                 ${Current_Passangers}
    Page Should Contain                                 Pers.
    Page Should Contain                                 Ladung
    Page Should Contain                                 Kg

Fahrzeugstatus
    Click Element                                       ${btn_Fahrzeugstatus}
    Page Should Contain                                 Gesamtstatus
    Page Should Contain                                 Notfallmeldung
    Page Should Contain                                 ${Emmergency_Message}
    Page Should Contain                                 Tankfüllung
    Page Should Contain                                 Ltr.
    Page Should Contain                                 Tankkapazität
    Page Should Contain                                 Ltr.
    Page Should Contain                                 Batterie Ladung
    Page Should Contain                                 ${Battery-Level}
    Page Should Contain                                 Batterie Anforderung
    Page Should Contain                                 Temperatur Kabine
    Page Should Contain                                 Temperatur Antrieb
    Page Should Contain                                 Temperatur Außenhülle
    Page Should Contain                                 Neigung
    Page Should Contain                                 °C
    Page Should Contain                                 %
    Page Should Contain                                 °

Fahrstatus
    Click Element                                       ${btn_Fahrstatus}
    Page Should Contain                                 Orientierung
    Page Should Contain                                 Geschwindigkeit
    Page Should Contain                                 Km/h
    Page Should Contain                                 Beschleunigung
    Page Should Contain                                 m/sq
    Page Should Contain                                 Fahrleistung gesamt
    Page Should Contain                                 Km
    Page Should Contain                                 Nächster Halt
    Page Should Contain                                 Fahrleistung aktuell
    Page Should Contain                                 Fahrtrichtung
    Page Should Contain                                 Position
    Page Should Contain                                 Gps Sensorstatus
    Page Should Contain                                 m
    Page Should Contain                                 Breitengrad
    Page Should Contain                                 ${lat}
    Page Should Contain                                 Längengrad
    Page Should Contain                                 ${lon}
    Page Should Contain                                 Fehler Breite
    Page Should Contain                                 Fehler Länge
    Page Should Contain                                 Verfügbare Satelliten
    Page Should Contain                                 Genauigkeitlevel (string)

Mobilfunk
    Click Element                                       ${btn_Mobilfunk}
    Page Should Contain                                 Cell Ip
    Page Should Contain                                 Verbindungsstatus
    Page Should Contain                                 Signalstärke
    Page Should Contain                                 Netzwerktyp
    Page Should Contain                                 Verbindungsdauer

Raspberry Pi
    Click Element                                       ${btn_RaspbeerryPi}
    Page Should Contain                                 CPU Auslastung
    Page Should Contain                                 CPU Temperatur
    Page Should Contain                                 RAM Auslastung
    Page Should Contain                                 Drosselung
    Page Should Contain                                 Freier Speicher
    Page Should Contain                                 %
    Page Should Contain                                 °C
    Page Should Contain                                 GiB

Umgebungswerte
    Click Element                                       ${btn_Umgebungswerte}
    Page Should Contain                                 Relativer Wind
    Page Should Contain                                 Km/h
    Page Should Contain                                 aus Richtung
    Page Should Contain                                 °N
Abfahrt
    Click Element                                       ${btn_Abfahrt}
    Page Should Contain                                 Abfahrt
    Page Should Contain                                 Gl./HSt.
    Page Should Contain                                 Richtung
    Page Should Contain                                 Linie
    Page Should Contain                                 Dienst

Wetter
    Click Element                                       ${btn_Wetter}
    Page Should Contain                                 Wind:
    Page Should Contain                                 km/h
    Page Should Contain                                 Regen:
    Page Should Contain                                 mm
    Page Should Contain                                 Sicht:
    Page Should Contain                                 m
    Page Should Contain                                 °C


*** Settings ***
Library                 SeleniumLibrary
Variables               ../PageObject/5GSimonePages_locators.py
Resource                ../Resources/baseVariables.robot

*** Keywords ***
Navigate To Google Map
    #Pause Execution
    Wait Until Page Contains Element                ${btn_map}
    Mouse Over                                      ${btn_map}
    Click Element                                   ${btn_map}

Check If Google Map and the Zoom Button Are Displayed
    Wait Until Page Contains Element                ${googleMap}
    Wait Until Page Contains Element                ${btn_zoomButtons}

ZoomOut
    Wait Until Page Contains Element                ${btn_zoomOut}
    Mouse Over                                      ${btn_zoomOut}
    Click Element                                   ${btn_zoomOut}

Check Vehicle Position On The Map
    Repeat Keyword    7    ZoomOut
    Wait Until Page Contains Element                ${img_vehicle}
    Mouse Over                                      ${img_vehicle}
    Wait Until Page Contains Element                ${vehicleDetailPopup}
    Wait Until Page Contains Element                ${btn_closeVehicleDetails}
    Click Element                                   ${btn_closeVehicleDetails}

Check Stations Positions On The Map
    #Repeat Keyword    5    ZoomOut
    Wait Until Page Contains Element                ${Bielefeld_station}
    Wait Until Page Contains Element                ${Lemgo_station}
    Wait Until Page Contains Element                ${Minden_station}
    Wait Until Page Contains Element                ${Bückeburg_station}
    Wait Until Page Contains Element                ${Brückenweg_station}
    Wait Until Page Contains Element                ${BÜ_Bruchstr_station}
    Wait Until Page Contains Element                ${Bösingfeld_station}
    Wait Until Page Contains Element                ${Wunstorf_station}
    #Page Should Contain Element                     ${Seelze_station}
    Wait Until Page Contains Element                ${Hannover_station}
    
Check For Its Monocab Details
    Click Element                                   ${img_vehicle}
    Wait Until Page Contains                        Zur Detailansicht
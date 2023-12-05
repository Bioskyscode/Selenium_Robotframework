*** Settings ***
Library                         RequestsLibrary
Library                         Collections
Variables                       ../PageObject/5GSimonePages_locators.py
Resource                        ../Resources/baseVariables.robot
Resource                         ../Resources/API_Keywords.robot

*** Keywords ***
 Start Vehicle Move Update
    API_Keywords.Tenant Admin Login
    Create Base Session
    ${VMU_JsonBody}                                 API_Keywords.Convert "VMU" Request Body To Json
    API_Keywords.Request Header
    Create Relative Post Session                    ${Vehicle_moveUpdate_url}           ${VMU_JsonBody}
    #${VMU_res}                          POST On Session                 ${API Session Alias}              ${Vehicle_moveUpdate_url}           json=${VMU_JsonBody}           headers=${headers}
    API_Keywords.Validate Post Request is Successful


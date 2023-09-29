*** Settings ***
Library                         RequestsLibrary
Library                         Collections
Variables                       ../PageObject/5GSimonePages_locators.py
Resource                        ../Resources/baseVariables.robot

*** Keywords ***
 Start Vehicle Move Update
    [Tags]      Vehicle_MoveUpdate
    Create Session                      TA_Login                        ${api_base_url_testingStage}
    ${res}                              POST On Session                 TA_Login                                    ${login_url}                        json=&{TaLogin_request_body}
    Set Global Variable                 ${auth_token}                   ${res.json()['token']}
    Should Be Equal As Strings          ${res.status_code}              200
    
    Create Session                      MoveUpdate                      ${api_base_url_testingStage}
    ${VMU_JsonBody}                     Convert VMU Reponse Body To Json
    ${req_headers}                      Create Dictionary               Authorization=Bearer ${auth_token}          Content-Type=application/json       #Connection=keep-alive
    ${VMU_res}                          POST On Session                 MoveUpdate                                  ${Vehicle_moveUpdate_url}           json=${VMU_JsonBody}           headers=${req_headers}
    Should Be Equal As Strings          ${VMU_res.status_code}          200
*** Keywords ***
Convert VMU Reponse Body To Json
    ${json_value}                       Evaluate                        json.loads($VehicleMoveUpdate_resBody)      #json
    [Return]                            ${json_value}
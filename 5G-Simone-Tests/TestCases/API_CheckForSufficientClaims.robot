*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate CheckForSufficientClaims
    [Tags]      API         Post
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    ${CheckForSufficientClaims_JsonBody}        API_Keywords. Convert "CheckForSufficientClaims" Request Body To Json
    API_Keywords.Request Header
    ${vali}     POST On Session         ${API Session Alias}        ${UserModulePermissions_CheckForSufficientClaims}          json=${CheckForSufficientClaims_JsonBody}           headers=${headers}
    API_Keywords.Stop Request
    Should Be Equal    OK    ${vali.reason}
    API_Keywords.Validate Post Request is Successful
    API_Keywords.Validate Response Time IS Less Than 500ms

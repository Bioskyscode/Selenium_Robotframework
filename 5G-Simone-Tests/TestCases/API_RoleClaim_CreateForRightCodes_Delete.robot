*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "RoleClaim_CreateForRightCodes" "GetById" and "Delete"
    [Tags]      API         Get     Post        RoleClaim
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    #API_Keywords.Request Header
    API_Keywords.RoleClaim_CreateForRightsCode Post Request
    Validate "Create" Post Request is Successful
    API_Keywords.Create Get Request Session For "RoleClaimCreateForRightCodes_GetById"
    API_Keywords.Validate Get Request is Successful
    DELETE On Session           ${API Session Alias}            ${RoleClaim_CreateForRightsCode_Delete}${RoleClaimCreateForRightsCode_ID}           headers=${headers}
    API_Keywords.Stop Request
    API_Keywords.Validate Delete Request
    API_Keywords.Validate Response Time IS Less Than 500ms
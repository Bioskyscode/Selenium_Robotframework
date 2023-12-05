#*** Settings ***
#Resource                         ../Resources/API_Keywords.robot
##Resource                          ../Resources/baseVariables.robot
#Suite Setup                       Start Request
#
#*** Test Cases ***
#Validate "RoleClaim_Create"
#    [Tags]      API         Post        RoleClaim
#    API_Keywords.Tenant Admin Login
#    API_Keywords.Create Base Session
#    ${RoleClaim_CreateForRightCodes_JsonBody}                     API_Keywords.Convert "RoleClaim_CreateForRightCodes" Reponse Body To Json
#    API_Keywords.Request Header
#    POST On Session                 ${API Session Alias}              ${RoleClaim_CreateForRightsCode}           json=${RoleClaim_CreateForRightCodes_JsonBody}           headers=${headers}
#    API_Keywords.Stop Request
#    API_Keywords.Validate "Create" Post Request is Successful
#    API_Keywords.Validate Response Time IS Less Than 500ms
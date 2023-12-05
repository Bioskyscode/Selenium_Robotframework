*** Settings ***
Resource                         ../Resources/API_Keywords.robot
#Resource    ../Resources/Common.robot
Suite Setup                       Start Request
#Suite Teardown                    Stop Request
*** Test Cases ***
Validate "RoleClaim_GetAllOfRoleByIdPaged"
    [Tags]      API         Get         RoleClaim
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Request Header
    API_Keywords.Create Get Request Session For "Account User Data"
    API_Keywords.Create Get Request Session For "RoleClaimGetAllOfRoleByIdPaged"
    API_Keywords.Stop Request
    API_Keywords.Validate Get Request is Successful
    API_Keywords.Validate Response Time IS Less Than 500ms
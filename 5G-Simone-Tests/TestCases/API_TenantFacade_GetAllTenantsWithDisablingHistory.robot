*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate TenantFacade_GetAllTenantsWithDisablingHistory
    [Tags]      API         Get         TenantFacade
    API_Keywords.Super Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Request Header
    API_Keywords.Create Get Request Session For "TenantFacade_GetAllTenantsWithDisablingHistory"
    API_Keywords.Stop Request
    API_Keywords.Validate Get Request is Successful
    API_Keywords.Validate Response Time IS Less Than 500ms
*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "AccountTenant_LockOnTenant"
    [Tags]      API         Post        AccountTenant
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.AccountTenant_LockOnTenant Post Request
    API_Keywords.Validate Post Request is Successful
    API_Keywords.Stop Request
    API_Keywords.Validate Response Time IS Less Than 500ms
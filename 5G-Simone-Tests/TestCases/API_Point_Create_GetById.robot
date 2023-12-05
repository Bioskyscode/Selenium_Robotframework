*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "Point Create" and "GetById"
    [Tags]      API         Get         Post        Point
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Point Post Request
    API_Keywords.Validate "Create" Post Request is Successful
    API_Keywords.Create Get Request Session For "Point_GetById"
    API_Keywords.Validate Get Request is Successful
    API_Keywords.Stop Request
    API_Keywords.Validate Response Time IS Less Than 500ms
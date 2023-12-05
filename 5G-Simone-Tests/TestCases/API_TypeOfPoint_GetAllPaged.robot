*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "TypeOfPoint_GetAllPaged"
    [Tags]      API         Get        TypeOfPoint
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Request Header
    API_Keywords.Create Get Request Session For "TypeOfPoint_GetAllPaged"
    API_Keywords.Stop Request
    API_Keywords.Validate Get Request is Successful
    API_Keywords.Validate Response Time IS Less Than 500ms
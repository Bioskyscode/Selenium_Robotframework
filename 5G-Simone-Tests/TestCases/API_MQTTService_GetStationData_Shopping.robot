*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "MQTTService_GetStationData_Shopping"
    [Tags]      API         Post        MQTTService
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Request Header
    API_Keywords.MQTTService_GetStationData_Shopping Post Request
    API_Keywords.Stop Request
    API_Keywords.Validate Post Request is Successful
    API_Keywords.Validate Response Time IS Less Than 500ms
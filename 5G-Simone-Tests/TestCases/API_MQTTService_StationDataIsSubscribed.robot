*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request
#Suite Teardown                    Stop Request
*** Test Cases ***
Validate "MQTTService_StationDataIsSubscribed"
    [Tags]      API         Get         MQTTService
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Request Header
    API_Keywords.Create Get Request Session For "MQTTService_StationDataIsSubscribed"
    API_Keywords.Stop Request
    API_Keywords.Validate Get Request is Successful
    API_Keywords.Validate Response Time IS Less Than 500ms
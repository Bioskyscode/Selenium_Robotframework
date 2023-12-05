*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "VehicleType Create" "GetById" and "Delete"
    [Tags]      API         Get         Post        VehicleType
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.VehicleType Post Request
    API_Keywords.Validate "Create" Post Request is Successful
    API_Keywords.Create Get Request Session For "VehicleType_GetById"
    API_Keywords.Validate Get Request is Successful
    DELETE On Session           ${API Session Alias}            ${VehicleType_Delete}${VehicleType_ID}          headers=${headers}
    API_Keywords.Stop Request
    API_Keywords.Validate Delete Request
    API_Keywords.Validate Response Time IS Less Than 500ms
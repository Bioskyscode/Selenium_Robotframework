*** Settings ***
Resource                         ../Resources/API_Keywords.robot
Suite Setup                       Start Request

*** Test Cases ***
Validate "Vehicle Create" "GetById" and "Delete"
    [Tags]      API         Get         Post        Vehicle
    API_Keywords.Tenant Admin Login
    API_Keywords.Create Base Session
    API_Keywords.Vehicle Post Request
    API_Keywords.Validate "Create" Post Request is Successful
    API_Keywords.Create Get Request Session For "Vehicle_GetById"
    API_Keywords.Validate Get Request is Successful
    DELETE On Session           ${API Session Alias}            ${Vehicle_Delete}${Vehicle_ID}          headers=${headers}
    API_Keywords.Stop Request
    API_Keywords.Validate Delete Request
    API_Keywords.Validate Response Time IS Less Than 500ms
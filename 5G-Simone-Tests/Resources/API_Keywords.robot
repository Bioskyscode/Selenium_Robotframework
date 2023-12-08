*** Settings ***
Library                         RequestsLibrary
Library                         DateTime
Library                         FakerLibrary
Variables                       ../PageObject/5GSimonePages_locators.py
Resource                        ../Resources/baseVariables.robot

*** Keywords ***
Start Request
    ${Start_time}               Get Current Date
    Set Global Variable         ${Begin}         ${Start_time}

Stop Request
    ${Stop_time}                Get Current Date
    Set Global Variable         ${End}         ${Stop_time}

Request Header
    ${req_headers}                      Create Dictionary                               Authorization=Bearer ${auth_token}          Content-Type=application/json       #Connection=keep-alive
    Set Global Variable                 ${headers}                                      ${req_headers}


##################### Session Creations ##################################
Create Base Session
    Create Session                      ${API Session Alias}                            ${api_base_url_testingStage}

Create Relative Get Session
    [Arguments]                         ${relative_uri}
    ${response_body}                    GET On Session                                  ${API Session Alias}                                    ${relative_uri}                 headers=${headers}
    Set Global Variable                 ${Get_response_body}                            ${response_body}

Create Relative Post Session
    [Arguments]                         ${post_relative_uri}         ${JsonBody}
    ${response_body1}                    POST On Session                     ${API Session Alias}                            ${post_relative_uri}                     json=${JsonBody}                headers=${headers}
    Set Global Variable                 ${Post_response_body}                         ${response_body1}
##################### Logins ###############################
Tenant Admin Login
    [Tags]      API
    Create Base Session
    ${Login_response_body}               POST On Session                                ${API Session Alias}                                    ${TA_login_url}                    json=&{TaLogin_request_body}
    Set Global Variable                 ${auth_token}                                   ${Login_response_body.json()['token']}
    Validate Post Request is Successful

Super Admin Login
    [Tags]      API
    Create Base Session
    ${SA_Login_response_body}            POST On Session                                 ${API Session Alias}                                    ${SA_login_url}                    json=&{SaLogin_request_body}
    Set Global Variable                 ${auth_token}                                    ${SA_Login_response_body.json()['token']}
    Validate Post Request is Successful

##################### Validations ########################

Validate Get Request is Successful
    Status Should Be                    200                                             msg=Expected status code is 200
    Should Be Equal As Strings          OK                                              ${Get_response_body.reason}
    Should Not Be Empty                 ${Get_response_body.content}

Validate Post Request is Successful
    Status Should Be                    200                                             msg=Expected status code is 200

Validate "Create" Post Request is Successful
    Status Should Be                    201                                             msg=Expected status code is 201
    Should Be Equal As Strings          Created                                         ${Post_response_body.reason}

Validate Delete Request
    Status Should Be                    204                                             msg=Expected status code is 204

Validate Response Time IS Less Than 500ms
    ${elapsed_time}                     Subtract Date From Date                         ${End}    ${Begin}
    ${response_time}                    Evaluate                                        0<$elapsed_time<${Max_Response_Time}
    Should Be True                      ${response_time}                                msg=API response time should be less than 1.5s ms


##################### Get Request Session ###################
Create Get Request Session For "Account User Data"
    Create Relative Get Session         ${account_userData}
    Set Global Variable                 ${TenantAdmin_RoleId}                           ${Get_response_body.json()['roles'][1]['id']}
    Log To Console                      User Data: ${Get_response_body.content}

Create Get Request Session For "Rights"
    Create Relative Get Session         ${Rights_getAll}
    Log To Console                      Rights: ${Get_response_body.content}

Create Get Request Session For "ModuleClaims"
    Create Relative Get Session         ${ModuleClaims}
    Log To Console                      Module Claims: ${Get_response_body.content}

Create Get Request Session For "VehicleQuery_FindByTextPaged"
    Create Relative Get Session         ${VehicleQuery_FindByTextPaged}Bus 11
    Log To Console                      VehicleQuery_FindByTextPaged: ${Get_response_body.content}

Create Get Request Session For "VehicleQuery_GetByGlobalId"
    Create Relative Get Session         ${VehicleQuery_GetByGlobalId}TestZug2
    Log To Console                      VehicleQuery_GetByGlobalId: ${Get_response_body.content}

Create Get Request Session For "VehicleMessage_GetOperators"
    Create Relative Get Session         ${VehicleMessage_GetOperators}
    Log To Console                      VehicleMessage_GetOperators: ${Get_response_body.content}

Create Get Request Session For "TenantFacade_GetAllTenantsWithDisablingHistory"
    Create Relative Get Session         ${TenantFacade_GetAllTenantsWithDisablingHistory}
    Log To Console                      "GetAllTenantsWithDisablingHistory": ${Get_response_body.content}

Create Get Request Session For "TenantFacade_GetDefaultTenantMap"
    Create Relative Get Session         ${TenantFacade_GetDefaultTenantMap}
    Log To Console                      "GetDefaultTenantMap": ${Get_response_body.content}

Create Get Request Session For "TenantFacade_TenantFacade_GetAllTenantUsers"
    Create Relative Get Session         ${TenantFacade_GetAllTenantUsers}
    Log To Console                      "GetAllTenantUsers": ${Get_response_body.content}

Create Get Request Session For "VehicleModel_GetAllPaged"
    Create Relative Get Session         ${VehicleModel_GetAllPaged}
    Log To Console                      "RoleClaim_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "RoleClaim_GetAllPaged"
    Create Relative Get Session         ${RoleClaim_GetAllPaged}
    Log To Console                      "RoleClaim_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "Role_GetAllPaged"
    Create Relative Get Session         ${Role_GetAllPaged}
    Log To Console                      "Role_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "SelfService_GetLastInfotainmentTopics"
    Create Relative Get Session         ${SelfService_GetLastInfotainmentTopics}
    Log To Console                      "SelfService_GetLastInfotainmentTopics": ${Get_response_body.content}

Create Get Request Session For "Point_GetAllPaged"
    Create Relative Get Session         ${Point_GetAllPaged}
    Log To Console                      "Point_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "TypeOfPoint_GetAllPaged"
    Create Relative Get Session         ${TypeOfPoint_GetAllPaged}
    Log To Console                      "TypeOfPoint_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "MQTTService_StationDataIsSubscribed"
    Create Relative Get Session         ${MQTTService_StationDataIsSubscribed}
    Should Be True                      ${Get_response_body.content}
    Log To Console                      "MQTTService_StationDataIsSubscribed": ${Get_response_body.content}

Create Get Request Session For "AccountTenant_GetTenantLinksAllPaged"
    Create Relative Get Session         ${Account_GetTenantLinksAllPaged}
    Set Global Variable                 ${User_Id}                              ${Get_response_body.json()['data'][20]['userId']}
    Set Global Variable                 ${Tenant_Id}                            ${Get_response_body.json()['data'][20]['tenantId']}
    Set Global Variable                 ${User_Id2}                             ${Get_response_body.json()['data'][0]['userId']}
    Set Global Variable                 ${Tenant_Id2}                           ${Get_response_body.json()['data'][0]['tenantId']}
    Log To Console                      user21***: ${Get_response_body.json()['data'][20]}
    Log To Console                      user0****: ${Get_response_body.json()['data'][0]}
    Log To Console                      "AccountTenant_GetTenantLinksAllPaged": ${Get_response_body.content}

Create Get Request Session For "Vehicle_GetAllPaged"
    Create Relative Get Session         ${Vehicle_GetAllPaged}
    Log To Console                      "Vehicle_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "Log_GetLogFiles"
    Create Relative Get Session         ${Log_GetLogFiles}
    Log To Console                      "Log_GetLogFiles": ${Get_response_body.content}

Create Get Request Session For "VehicleType_GetAllPaged"
    Create Relative Get Session         ${VehicleType_GetAllPaged}
    Log To Console                      "VehicleType_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "Operator_GetAllPaged"
    Create Relative Get Session         ${Operator_GetAllPaged}
    Log To Console                      "Operator_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "ContactDetails_GetAllPaged"
    Create Relative Get Session         ${ContactDetails_GetAllPaged}
    Log To Console                      "ContactDetails_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "Address_GetAllPaged"
    Create Relative Get Session         ${Address_GetAllPaged}
    Log To Console                      "Address_GetAllPaged": ${Get_response_body.content}

Create Get Request Session For "RoleClaim_GetById"
    Create Relative Get Session         ${RoleClaim_GetById}${RoleClaim_ID}
    Log To Console                      "RoleClaim_GetById": ${Get_response_body.content}

Create Get Request Session For "Role_GetById"
    Create Relative Get Session         ${Role_GetById}${Role_ID}
    Log To Console                      "RoleClaim_GetById": ${Get_response_body.content}

Create Get Request Session For "TypeOfPoint_GetById"
    Create Relative Get Session         ${TypeOfPoint_GetById}${TypeOfPoint_ID}
    Log To Console                      "TypeOfPoint_GetById": ${Get_response_body.content}

Create Get Request Session For "Vehicle_GetById"
    Create Relative Get Session         ${Vehicle_GetById}${Vehicle_ID}
    Log To Console                      "Vehicle_GetById": ${Get_response_body.content}

Create Get Request Session For "VehicleType_GetById"
    Create Relative Get Session         ${VehicleType_GetById}${VehicleType_ID}
    Log To Console                      "VehicleType_GetById": ${Get_response_body.content}

Create Get Request Session For "Operator_GetById"
    Create Relative Get Session         ${Operator_GetById}${Operator_ID}
    Log To Console                      "Operator_GetById": ${Get_response_body.content}

Create Get Request Session For "Address_GetById"
    Create Relative Get Session         ${Address_GetById}${Address_ID}
    Log To Console                      "Address_GetById": ${Get_response_body.content}

Create Get Request Session For "RoleClaimCreateForRightCodes_GetById"
    Create Relative Get Session         ${RoleClaim_GetById}${RoleClaimCreateForRightsCode_ID}
    Log To Console                      "RoleClaimCreateForRightCodes_GetById": ${Get_response_body.content}

Create Get Request Session For "RoleClaimGetAllOfRoleByIdPaged"
    Create Relative Get Session         ${RoleClaim_GetAllOfRoleByIdPaged}${TenantAdmin_RoleId}
    Log To Console                      "RoleClaim_GetAllOfRoleByIdPaged": ${Get_response_body.content}

Create Get Request Session For "RoleClaimGetAllOfRoleByKeyPaged"
    Create Relative Get Session         ${RoleClaim_GetAllOfRoleByKeyPaged}
    Log To Console                      "RoleClaim_GetAllOfRoleByKeyPaged": ${Get_response_body.content}

Create Get Request Session For "VehicleModel_GetById"
    Create Relative Get Session         ${VehicleModel_GetById}${VehicleModel_ID}
    Log To Console                      "VehicleModel_GetById": ${Get_response_body.content}

Create Get Request Session For "Organisation_GetAllOrganisationTypes"
    Create Relative Get Session         ${Organisation_GetAllOrganisationTypes}
    Log To Console                      Organisation_GetAllOrganisationTypes: ${Get_response_body.content}

Create Get Request Session For "ContactDetails_GetById"
    Create Relative Get Session         ${ContactDetails_GetById}${ContactDetails_ID}
    Log To Console                      ContactDetails: ${Get_response_body.content}

Create Get Request Session For "Point_GetById"
    Create Relative Get Session         ${Point_GetById}${Point_ID}
    Log To Console                      Point: ${Get_response_body.content}


####################### Conversion Request Body To JSON ###########################################
 Convert "CheckForSufficientClaims" Request Body To Json
    ${json_CheckForSufficientClaims}                        Evaluate                                                    json.loads($CheckForSufficientClaims_requestBody)      #json
    [Return]                                                ${json_CheckForSufficientClaims}

Convert "VehicleQuery_GetByGlobalIds" Request Body To Json
    ${json_VehicleQuery_GetByGlobalIds}                        Evaluate                                                    json.loads($VehicleQuery_GetByGlobalIds_requestBody)
    [Return]                                                ${json_VehicleQuery_GetByGlobalIds}

Convert "VMU" Request Body To Json
    ${json_VMU}                                             Evaluate                                                    json.loads($VehicleMoveUpdate_resBody)
    [Return]                                                ${json_VMU}

Convert "RoleClaim" Request Body To Json
    Request Header
    Create Get Request Session For "Account User Data"
    ${RoleClaim_requestBody}                                Set Variable                                                {"roleId": "${TenantAdmin_RoleId}", "ClaimType": "FR|03|04", "claimValue": 47}
    ${json_RoleClaim}                                       Evaluate                                                    json.loads($RoleClaim_requestBody)
    [Return]                                                ${json_RoleClaim}

Convert "Role" Request Body To Json
    ${Role_name}                                            FakerLibrary.Job
    ${Role_requestBody}                                     Set Variable                                                {"name": "${Role_name}"}
    ${json_Role}                                            Evaluate                                                    json.loads($Role_requestBody)
    [Return]                                                ${json_Role}

Convert "VehicleModel" Request Body To Json
    ${VehicleModel_name}                                    FakerLibrary.User Name
    ${description}                                          FakerLibrary.Sentence
    ${manufacturer}                                         FakerLibrary.Company
    ${VehicleModel_requestBody}                             Set Variable                                                {"name": "Fahrzeug-${VehicleModel_name}", "description": "${description}", "manufacturer": "${manufacturer}"}
    ${json_VehicleModel}                                    Evaluate                                                    json.loads($VehicleModel_requestBody)
    [Return]                                                ${json_VehicleModel}

Convert "RoleClaim_CreateForRightCodes" Request Body To Json
    Request Header
    Create Get Request Session For "Account User Data"
    ${RoleClaim_CreateForRightCodes_requestBody}            Set Variable                                                {"module": 5, "moduleEntityOrProcessId": 2, "claimValue": 47, "roleId": "${TenantAdmin_RoleId}"}
    ${json_RoleClaim_CreateForRightCodes}                   Evaluate                                                    json.loads($RoleClaim_CreateForRightCodes_requestBody)
    [Return]                                                ${json_RoleClaim_CreateForRightCodes}

Convert "ContactDetails" Request Body To Json
    ${randomFullName}                                       FakerLibrary.Name
    ${randomEmail}                                          FakerLibrary.Email
    ${num}                                                  FakerLibrary.Random Number
    ${Details}                                              FakerLibrary.Sentence
    ${randomPhoneNumber}                                    FakerLibrary.Basic Phone Number
    ${randomUrl}                                            FakerLibrary.Url
    ${ContactDetails_requestBody}                           Set Variable                                                {"contactPerson": "${randomFullName}", "email": "${randomEmail}", "fax": ${num}, "furtherDetails": "${Details}", "phone": "${randomPhoneNumber}", "url": "${randomUrl}"}
    ${json_ContactDetails}                                  Evaluate                                                                   json.loads($ContactDetails_requestBody)
    [Return]                                                ${json_ContactDetails}

Convert "Address" Request Body To Json
    ${Date}                                                 Get Current Date
    ${BuildingName}                                         FakerLibrary.Company
    ${randomStreetAddress}                                  FakerLibrary.Street Address
    ${num}                                                  FakerLibrary.Building Number
    ${Addition}                                             FakerLibrary.Sentence
    ${randomCity}                                           FakerLibrary.City
    ${ZipCode}                                              FakerLibrary.Zipcode
    ${CountryCode}                                          FakerLibrary.Country Code
    ${Address_requestBody}                                  Set Variable                                                {"clientCreationDate": "${Date}", "building": "${BuildingName}", "street": "${randomStreetAddress}", "houseNumber": ${num}, "addition": "${Addition}", "city": "${randomCity}", "zipCode": ${ZipCode}, "zipCodeExtension": "${CountryCode}", "countryCode": 29}
    ${json_Address}                                         Evaluate                                                    json.loads($Address_requestBody)
    [Return]                                                ${json_Address}

 Convert "Operator" Request Body To Json
    ${randomProductMaterial}                                FakerLibrary.User Name
    ${randomAlphabet}                                       FakerLibrary.Random Letter
    ${randomNumeric}                                        FakerLibrary.Random Digit Above Two
    ${name}                                                 FakerLibrary.Company
    ${randomCompanySuffix}                                  FakerLibrary.Company Suffix
    ${Date}                                                 Get Current Date
    ${Future_Date}                                          FakerLibrary.Future Datetime
    ${Details}                                              FakerLibrary.Sentence
    ${Operator_requestBody}                                 Set Variable                                                {"globalId": "DE:${randomProductMaterial}", "primaryMode": 1, "privateCode": "${randomAlphabet}${randomNumeric}", "publicCode": "DE:${randomAlphabet}${randomNumeric}", "companyNumber": "${randomNumeric}", "name": "${name}", "shortName": "${randomCompanySuffix}", "tradingName": "CoP", "legalName": "Mobility Company of America AG", "description": "${Details}", "remarks": "${Details}", "status": true, "validFromDate": "${Date}", "validToDate": "${Future_Date}"}
    ${json_Operator}                                        Evaluate                                                    json.loads($Operator_requestBody)
    [Return]                                                ${json_Operator}

Convert "VehicleType" Request Body To Json
    ${Company}                                              FakerLibrary.Company
    ${description}                                          FakerLibrary.Sentence
    ${ShortName}                                            FakerLibrary.Company Suffix
    ${VehicleType_requestBody}                              Set Variable                                                {"name": "${Company}", "shortName": "${ShortName}", "description": "${description}", "reversionDirection": true, "selfPropelled": true, "length": 1000, "typeOfFuel": 1, "seatingCapacity": 200, "standingCapacity": 50, "specialPlaceCapacity": 50, "wheelchairPlaceCapacity": 1000, "lowFloor": true, "hasLiftOrRamp": true, "vehicleMode": 1}
    ${json_VehicleType}                                     Evaluate                                                    json.loads($VehicleType_requestBody)
    [Return]                                                ${json_VehicleType}

Convert "Vehicle" Request Body To Json
    ${Vehicle_name}                                         FakerLibrary.Color Name
    ${ShortName}                                            FakerLibrary.Company Suffix
    ${Name}                                          FakerLibrary.First Name
    ${Vehicle_requestBody}                                  Set Variable                                                {"golbalId": "${Vehicle_name}_${Name}", "name": "${Name}", "shortName": "${ShortName}", "vehicleModelId": "d357418c-4afe-4d1d-b8ce-018ad2c5be27", "vehicleTypeId": "700f6e9d-3f1c-497d-b80f-0290c824473b"}
    ${json_Vehicle}                                         Evaluate                                                    json.loads($Vehicle_requestBody)
    [Return]                                                ${json_Vehicle}

Convert "AccountTenant_LockOnTenant" Request Body To Json
    ${Reason}                                                                     FakerLibrary.Sentence
    Request Header
    Create Get Request Session For "AccountTenant_GetTenantLinksAllPaged"
    ${AccountTenant_LockOnTenant_requestBody}                                     Set Variable                                                {"userId": "${User_Id}", "tenantId": "${Tenant_Id}", "reasons": "${Reason}"}
    ${json_AccountTenant_LockOnTenant}                                            Evaluate                                                    json.loads($AccountTenant_LockOnTenant_requestBody)
    [Return]                                                                      ${json_AccountTenant_LockOnTenant}

Convert "AccountTenant_LockOnTenantTemporary" Request Body To Json
    ${Reason}                                                                     FakerLibrary.Sentence
    ${FutureDate}                                                                 FakerLibrary.Future Datetime
    Request Header
    Create Get Request Session For "AccountTenant_GetTenantLinksAllPaged"
    ${AccountTenant_LockOnTenantTemporary_requestBody}                             Set Variable                                                {"lockUntil": "${FutureDate}", "userId": "${User_Id}", "tenantId": "${Tenant_Id}", "reasons": "${Reason}"}
    ${json_AccountTenant_LockOnTenantTemporary}                                    Evaluate                                                    json.loads($AccountTenant_LockOnTenantTemporary_requestBody)
    [Return]                                                                       ${json_AccountTenant_LockOnTenantTemporary}

Convert "AccountTenant_TenantLinkOnUser" Request Body To Json
    Request Header
    Create Get Request Session For "AccountTenant_GetTenantLinksAllPaged"
    ${AccountTenant_TenantLinkOnUser_requestBody}                             Set Variable                                                {"userId": "${User_Id2}"}
    ${json_AccountTenant_TenantLinkOnUser}                                    Evaluate                                                    json.loads($AccountTenant_TenantLinkOnUser_requestBody)
    [Return]                                                                       ${json_AccountTenant_TenantLinkOnUser}

Convert "TypeOfPoint" Request Body To Json
    ${Date}                                                 Get Current Date
    ${randomCity}                                           FakerLibrary.City
    ${TypeOfPoint_requestBody}                              Set Variable                                                {"clientCreationDate": "${Date}", "name": "${randomCity}"}
    ${json_TypeOfPoint}                                     Evaluate                                                    json.loads($TypeOfPoint_requestBody)
    [Return]                                                ${json_TypeOfPoint}

Convert "Point" Request Body To Json
    ${Date}                                                 Get Current Date
    ${randomCity}                                           FakerLibrary.City
    ${randomCity2}                                          FakerLibrary.City
    ${randomLongitude}                                      FakerLibrary.Random Int                 7              10
    ${randomLatitude}                                       FakerLibrary.Random Int                 50              59
    ${randomAltitude}                                       FakerLibrary.Random Digit Above Two
    ${Point_requestBody}                                    Set Variable                                    {"useForTypes": [{"clientCreationDate": "${Date}","name": "${randomCity} Bahnhof"}], "clientCreationDate": "${Date}", "name": "${randomCity2} Bahnhof", "locations": [{"locatingSystemId": 4326, "latitude": ${randomLatitude}, "longitude": ${randomLongitude}, "altitude": ${randomAltitude}, "precision": 0}]}

    ${json_Point}                                  Evaluate                                                                   json.loads($Point_requestBody)
    [Return]                                                ${json_Point}

########################### Post Request Sessions ################################
RoleClaim Post Request
    ${RoleClaim_JsonBody}                                   API_Keywords.Convert "RoleClaim" Request Body To Json
    Request Header
    Create Relative Post Session                            ${RoleClaim_Create}           ${RoleClaim_JsonBody}
    Set Global Variable                                     ${RoleClaim_ID}                 ${Post_responseBody.json()['id']}

Role Post Request
    ${Role_JsonBody}                                        API_Keywords.Convert "Role" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Role_Create}           ${Role_JsonBody}
    Set Global Variable                                     ${Role_ID}                 ${Post_responseBody.json()['id']}

TypeOfPoint Post Request
    ${TypeOfPoint_JsonBody}                                        API_Keywords.Convert "TypeOfPoint" Request Body To Json
    Request Header
    Create Relative Post Session                            ${TypeOfPoint_Create}           ${TypeOfPoint_JsonBody}
    Set Global Variable                                     ${TypeOfPoint_ID}                   ${Post_responseBody.json()['id']}


MQTTService_GetStationData_Weather Post Request
    Request Header
    ${MQTTService_GetStationData_Weather}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Weather}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Weather.content}

MQTTService_GetStationData_Schedule Post Request
    Request Header
    ${MQTTService_GetStationData_Schedule}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Schedule}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Schedule.content}

MQTTService_GetStationData_Gastronomy Post Request
    Request Header
    ${MQTTService_GetStationData_Gastronomy}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Gastronomy}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Gastronomy.content}

MQTTService_GetStationData_Healthcare Post Request
    Request Header
    ${MQTTService_GetStationData_Healthcare}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_HealthCare}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Healthcare.content}

MQTTService_GetStationData_Tourism Post Request
    Request Header
    ${MQTTService_GetStationData_Tourism}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Tourism}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Tourism.content}

MQTTService_GetStationData_Entertainment Post Request
    Request Header
    ${MQTTService_GetStationData_Entertainment}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Entertainment}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Entertainment.content}

MQTTService_GetStationData_Shopping Post Request
    Request Header
    ${MQTTService_GetStationData_Shopping}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Shopping}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Shopping.content}

MQTTService_GetStationData_Accommodation Post Request
    Request Header
    ${MQTTService_GetStationData_Accommodation}                   POST On Session                 ${API Session Alias}              ${MQTTServices_GetStationData_Accommodation}              headers=${headers}
    Should Not Be Empty                                     ${MQTTService_GetStationData_Accommodation.content}

VehicleQuery_GetByGlobalIds Post Request
    ${VehicleQuery_GetByGlobalIds_JsonBody}                                        API_Keywords.Convert "VehicleQuery_GetByGlobalIds" Request Body To Json
    Request Header
    Create Relative Post Session                            ${VehicleQuery_GetByGlobalIds}           ${VehicleQuery_GetByGlobalIds_JsonBody}

AccountTenant_LockOnTenant Post Request
    ${AccountTenant_LockOnTenant_JsonBody}                                        API_Keywords.Convert "AccountTenant_LockOnTenant" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Account_LockOnTenant}           ${AccountTenant_LockOnTenant_JsonBody}

AccountTenant_UnlockOnTenant Post Request
    ${AccountTenant_UnlockOnTenant_JsonBody}                                        API_Keywords.Convert "AccountTenant_LockOnTenant" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Account_UnlockOnTenant}           ${AccountTenant_UnlockOnTenant_JsonBody}

AccountTenant_LockOnTenantTemporary Post Request
    ${AccountTenant_LockOnTenantTemporary_JsonBody}                                        API_Keywords.Convert "AccountTenant_LockOnTenantTemporary" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Account_LockOnTenantTemporary}           ${AccountTenant_LockOnTenantTemporary_JsonBody}

AccountTenant_TenantLinkOnUser Post Request
    ${AccountTenant_TenantLinkOnUser_JsonBody}                                        API_Keywords.Convert "AccountTenant_TenantLinkOnUser" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Account_TenantLinkOnUser}           ${AccountTenant_TenantLinkOnUser_JsonBody}

AccountTenant_UnregisterOnTenant Post Request
    ${AccountTenant_UnregisterOnTenant_JsonBody}                                        API_Keywords.Convert "AccountTenant_LockOnTenant" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Account_UnregisterOnTenant}           ${AccountTenant_UnregisterOnTenant_JsonBody}

Vehicle Post Request
    ${Vehicle_JsonBody}                                        API_Keywords.Convert "Vehicle" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Vehicle_Create}           ${Vehicle_JsonBody}
    Set Global Variable                                     ${Vehicle_ID}                 ${Post_responseBody.json()['id']}

VehicleType Post Request
    ${VehicleType_JsonBody}                                        API_Keywords.Convert "VehicleType" Request Body To Json
    Request Header
    Create Relative Post Session                            ${VehicleType_Create}           ${VehicleType_JsonBody}
    Set Global Variable                                     ${VehicleType_ID}                 ${Post_responseBody.json()['id']}

Operator Post Request
    ${Operator_JsonBody}                                    API_Keywords. Convert "Operator" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Operator_Create}           ${Operator_JsonBody}
    Set Global Variable                                     ${Operator_ID}                 ${Post_responseBody.json()['id']}

VehicleModel Post Request
    ${VehicleModel_JsonBody}                                API_Keywords.Convert "VehicleModel" Request Body To Json
    Request Header
    Create Relative Post Session                            ${VehicleModel_Create}           ${VehicleModel_JsonBody}
    Set Global Variable                                     ${VehicleModel_ID}                 ${Post_responseBody.json()['id']}

RoleClaim_CreateForRightsCode Post Request
    ${RoleClaim_CreateForRightsCode_JsonBody}               API_Keywords.Convert "RoleClaim_CreateForRightCodes" Request Body To Json
    Request Header
    Create Relative Post Session                            ${RoleClaim_CreateForRightsCode}           ${RoleClaim_CreateForRightsCode_JsonBody}
    Set Global Variable                                     ${RoleClaimCreateForRightsCode_ID}                                    ${Post_responseBody.json()['id']}

ContactDetails Post Request
    ${ContactDetails_JsonBody}                              API_Keywords.Convert "ContactDetails" Request Body To Json
    Request Header
    Create Relative Post Session                            ${ContactDetails_Create}           ${ContactDetails_JsonBody}
    Set Global Variable                                     ${ContactDetails_ID}                                    ${Post_responseBody.json()['id']}

Point Post Request
    ${Point_JsonBody}                                       API_Keywords.Convert "Point" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Point_Create}           ${Point_JsonBody}
    Set Global Variable                                     ${Point_ID}                                    ${Post_responseBody.json()['id']}

Address Post Request
    ${Address_JsonBody}                                     API_Keywords.Convert "Address" Request Body To Json
    Request Header
    Create Relative Post Session                            ${Address_Create}           ${Address_JsonBody}
    Set Global Variable                                     ${Address_ID}                 ${Post_responseBody.json()['id']}
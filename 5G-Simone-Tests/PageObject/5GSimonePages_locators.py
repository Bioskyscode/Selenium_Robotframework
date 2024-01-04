                    #Welcome Page
txt_WelcomePageText = '//*[@id="root"]/div/div/div[4]/div/div/div[1]'
btn_WelcomePageLogin = '//*[@id="root"]/div/div/div[4]/div/div/div[4]/button'
img_WelcomePage = 'xpath://*[@id="root"]/div/div/div[4]/div/div/div[2]/img'

# Super-Admin Login Page
txt_superEmail = 'xpath://*[@id="emailInput"]'
btn_superNextPage = '//*[@id="login-continue"]'
btn_superBackPage = '//*[@id="login-back-sa"]'
txt_superPassword = 'xpath://*[@id="passwordInput"]/input'
btn_superLogin = '//*[@id="login-sa"]'
btn_portal_admin = 'xpath://*[@id="root"]/div/div/div[3]/div/div[3]/div/a[1]/span'
lnk_SuperLogout = '//*[@id="popup_menu"]/ul/li/a'

# Super-Admin Mandante-Liste Page
lnk_ClientList = 'xpath://*[@id="root"]/div/div/div[2]/div/div[2]/div/a[2]'
btn_client_re_deactivate = 'xpath://*[@id="toggle-tenant-active-status"]'
txt_deactivateClient_reason = 'xpath://*[@id="tenant-status-description"]'
btn_deactivateClient = '//*[@id="pr_id_2"]/div[3]/div/button[2]'
txt_searchClient = '//*[@id="root"]/div/div/div[4]/div/div/div[3]/div[1]/div/span/input'
title_mandanten = '//*[@id="header-text"]'
txt_biqx = '//*[@id="root"]/div/div/div[3]/div/div[4]/span/a/span'
tbl_Mandanten_liste = '//*[@id="tenant-table"]'

        # SA Invite New Client Popup
btn_invite_new_client = 'xpath://*[@id="invite-new-tenant-button"]'
txt_clientName = 'xpath://*[@id="tenantName"]'
tooltip_mandantenname = '//*[@id="invalid-input-icon-input-tooltip-tenantName"]'
txt_clientShortName = 'xpath://*[@id="tenantShort"]'
tooltip_mandantenkurzname = '//*[@id="invalid-input-icon-input-tooltip-tenantShort"]'
txt_clientDescription = 'xpath://*[@id="tenantDescription"]'
txt_adminName = 'xpath://*[@id="adminName"]'
tooltip_adminname = '//*[@id="invalid-input-icon-input-tooltip-adminName"]'
tooltip_adminnachname = '//*[@id="invalid-input-icon-input-tooltip-adminSurName"]'
tooltip_adminemail = '//*[@id="invalid-input-icon-input-tooltip-adminEmail"]'
txt_adminSurname = 'xpath://*[@id="adminSurName"]'
txt_adminEmail = 'xpath://*[@id="adminEmail"]'
btn_continue = '//*[@id="continue-tenant-invitation"]'
btn_close = '//button[@aria-label="Close"]'
btn_innerClose = '(//button[@aria-label="Close"])[2]'
btn_invite = '//*[@id="save-tenant-button-action"]'
mandant_toast_alert = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div/div/div/div[1]'
txt_mandant_toast_alert_top = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div/div/div/div/span'
txt_mandant_toast_alert_buttom = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div/div/div/div[1]/div'

################## Tenant-Admin Login Page ##################################
txt_tenantEmail = 'xpath://*[@id="emailInput"]'
btn_tenantNextPage = '//*[@id="login-continue"]'
btn_tenantBackPage = '//*[@id="login-back"]'
txt_tenantPassword = 'xpath://*[@id="passwordInput"]/input'
btn_tenantLogin = '//*[@id="login-ta"]'
btn_tenant_name = 'xpath://*[@id="root"]/div/div/div[3]/div/div[3]/div/a[1]'
lnk_tenantLogout = '//*[@id="popup_menu"]/ul/li[1]/a'

            # Tenant-Admin User Administration Page
btn_userAdmin = 'xpath://*[@id="userlist-link"]'
btn_addNewUser = 'xpath://*[@id="toggle-add-user-overlay"]'
btn_addNewUser_closePopup = '//*[@id="create-user-dialog"]/div[1]/div[2]/button'
btn_addNewUser_closeInnerPopup = '//*[@id="check-dialog"]/div[1]/div[2]/button'
tbl_Benutzerliste = '//*[@id="user-table"]'
row_account_Owner = '//div[@id="user-table"]//table[@role="table"]/tbody/tr[2]'

        # Invite user
txt_addNewUser_email = 'xpath://*[@id="userEmail"]'
txt_addNewUser_name = 'xpath://*[@id="userName"]'
txt_addNewUser_surname = 'xpath://*[@id="userSurname"]'
txt_addNewUser_username = 'xpath://*[@id="username"]'
Rollenauswahl_container = '//*[@id="create-user-dialog_content"]/div/div[1]/div'
Supervisor_Role = '//*[@id="selectable-role-Supervisor"]'
EmergencyAssistant_Role = '//*[@id="selectable-role-EmergencyAssistant"]'
TenantAdmin_Role = '//*[@id="selectable-role-TenantAdmin"]'
toast_alert = 'xpath://*[@id="root"]/div/div/div[4]/div/div/div[1]'
txt_toast_alert_1 = 'xpath://*[@id="root"]/div/div/div[4]/div/div/div[1]/div/div/div/div/span'
txt_toast_alert_2 = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div/div/div/div/div'
btn_addNewUser_continue = 'xpath://*[@id="toggle-verify-inputs-overlay"]'
btn_addNewUser_invite = 'xpath://*[@id="invite-user-button"]'

        # Edit User
btn_editUser = '//*[@id="toggle-edit-user-overlay"]'
btn_editUser_closePopup = 'xpath:/html/body/div[2]/div/div[1]/div[2]/button'
btn_editUser_cancelPopup = 'xpath://*[@id="cancel-role-edit"]'
btn_editUser_confirmChange = 'xpath://*[@id="role-edit"]'
tbl_tableBody = '//*[@id="user-table"]/div[2]/table/tbody'
tbl_table = '//*[@id="user-table"]/div[2]/table'

        # Re/Deativate User
btn_deactivateUser = 'xpath://*[@id="toggle-active-state-overlay"]'
btn_deactivateUser_closePopup = 'xpath://*[@id="active-state-overlay"]/div[1]/div[2]/button'
txt_deactivateUser_reason = 'xpath://*[@id="active-state-message"]'
btn_deactivateUser_cancelPopup = 'xpath://*[@id="cancel-toggle-active-state"]'
btn_deactivateUser_deactivate = 'xpath://*[@id="toggle-active-state"]'
msg_deactivateActivate = 'xpath://*[@id="active-state-overlay_content"]/div/p[2]'
txt_searchUser = '//*[@id="userTable-filter-input"]'
dropdown_pagination = 'xpath://*[@id="root"]/div/div/div[3]/div/div/div[3]/div[3]/div/div[3]'

            # Monocabs
btn_Monocabs = '//a[@id="monocabs-list-link"]'
tbl_monocabs_table = '//div[@id="monocabs-table"]'
tbl_monocabs_table_bus_1 = '//*[@id="monocabs-table"]/div[1]/table/tbody/tr[1]/td[1]'
tbl_monocabs_table_bus_2 = '//*[@id="monocabs-table"]/div[1]/table/tbody/tr[2]/td[1]'
tbl_monocabs_table_bus_3 = '//*[@id="monocabs-table"]/div[1]/table/tbody/tr[3]/td[1]'
Dynamics_VehicleDetails_Popup = '//div[@role="complementary"]'
btn_ReturnToDetailOverview = '//button[@id="navigate-to-details"]'
btn_Fahrzeugliste = '//button[@id="monocab-detail-card-back"]'
popup_monocabVehicleDetails = '//*[@id="monocab-detail-card"]'
title_monocabsVehicleDetails = '//*[@id="monocab-detail-card"]/p'
Auf_Karte_Ansehen_popupDetails = '//*[@id="monocab-detail-card-to-map"]'
btn_Fahrzeugstatus = '//div[@id="vehicleDataAccordion"]/div[2]'
btn_Fahrstatus = '//div[@id="vehicleDataAccordion"]/div[3]'
btn_Mobilfunk = '//div[@id="vehicleDataAccordion"]/div[4]'
btn_RaspbeerryPi = '//div[@id="vehicleDataAccordion"]/div[5]'
btn_Umgebungswerte = '//div[@id="vehicleDataAccordion"]/div[6]'
btn_Abfahrt = '//div[@id="vehicleDataAccordion"]/div[7]'
btn_Wetter = '//div[@id="vehicleDataAccordion"]/div[8]'

            # Monocabs Remote
btn_Remote = '//*[@id="monocab-detail-card-remotecontrol"]'
lnk_RemoteSteuerungAktivieren = '//*[text()="Remote Steuerung aktivieren"]'
btn_CloseCameraView = '//*[@id="pr_id_13"]/div[1]/div[2]/button'
box_fahrtrichtungRecht = '//*[@id="pr_id_3_content"]/div/div/div[1]/div[1]'
box_kabine = '//*[@id="pr_id_3_content"]/div/div/div[2]/div[1]'

svg_activate_deactivate_fahrtrichtungRecht = '//button[@id="stream-stop-icon-0"]'
svg_activate_deactivate_kabine = '//button[@id="stream-stop-icon-1"]'
svg_activate_deactivate_CameraView3 = '//*[@id="stream-stop-icon-2"]'
svg_activate_deactivate_CameraView4 = '//*[@id="stream-stop-icon-3"]'
svg_Open_fahrtrichtungRecht_In_New_Tab = '//*[@id="stream-maximize-icon-0"]'
svg_Open_kabine_In_New_Tab = '//*[@id="stream-maximize-icon-1"]'

            # MAP
btn_map = 'xpath://*[@id="monocabsmap-link"]'
btn_zoomButtons = '//div[@class="leaflet-control-zoom leaflet-bar leaflet-control"]'
btn_zoomOut = '//a[@title="Zoom out"]'
btn_closeVehicleDetails = '//a[contains(@aria-label,"Close popup")]'
vehicleDetailPopup = '//div[@class="leaflet-popup-content-wrapper"]'
googleMap = '//div[@class="mapContainer leaflet-container leaflet-touch leaflet-retina leaflet-fade-anim leaflet-grab leaflet-touch-drag leaflet-touch-zoom"]'
Bielefeld_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[3]'
Lemgo_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[4]'
Minden_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[8]'
Bückeburg_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[11]'
Brückenweg_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[7]'
BÜ_Bruchstr_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[6]'
Bösingfeld_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[5]'
Stadthagen_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[9]'
Wunstorf_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[12]'
Seelze_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[13]'
Hannover_station = '//*[@id="root"]/div/div/div[4]/div/div/div[1]/div[1]/div[4]/img[10]'

            # QoS
btn_Qos = '//a[@id="qos-link"]'

########## API Base Url ############################################
api_base_url_testingStage = 'https://5gsimone-test.staging.biqx.de:6100'
api_base_url_productionStage = 'https://5gsimone.staging.biqx.de:5100'

########## API Relative Url ############################################
TA_login_url = '/Account/Login'
SA_login_url = '/Account/LoginSa'
Vehicle_moveUpdate_url = '/VehicleMessage/MoveUpdate'
account_userData = '/Account/UserData'
Rights_getAll = '/Rights/GetAll'
ModuleClaims = '/ModuleClaims/GetAssignableRightsForAllModuleEntitysAndFunctions'
UserModulePermissions_CheckForSufficientClaims = '/UserModulePermissions/CheckForSufficientClaims'
RoleClaim_Create = '/RoleClaim/Create'
RoleClaim_CreateForRightsCode = '/RoleClaim/CreateForRightsCode'
RoleClaim_Delete = '/RoleClaim/Delete/'
RoleClaim_CreateForRightsCode_Delete = '/RoleClaim/Delete/'
RoleClaim_GetAllPaged = '/RoleClaim/GetAllPaged?page-number=1'
RoleClaim_GetById = '/RoleClaim/GetById/'
RoleClaim_GetAllOfRoleByIdPaged = '/RoleClaim/GetAllOfRoleByIdPaged?page-number=1&roleId='
RoleClaim_GetAllOfRoleByKeyPaged = '/RoleClaim/GetAllOfRoleByKeyPaged?page-number=1&roleKey=TENANTADMIN'
Role_Create = '/Role/Create'
Role_GetAllPaged = '/Role/GetAllPaged?page-number=1'
Role_GetById = '/Role/GetById/'
Role_Delete = '/Role/Delete/'
VehicleModel_Create = '/VehicleModel/Create'
VehicleModel_GetById = '/VehicleModel/GetById/'
VehicleModel_GetAllPaged = '/VehicleModel/GetAllPaged?page-number=1'
VehicleModel_Delete = '/VehicleModel/Delete/'
Organisation_GetAllOrganisationTypes = '/Organisation/GetAllOrganisationTypes'
ContactDetails_Create = '/ContactDetails/Create'
ContactDetails_GetAllPaged = '/ContactDetails/GetAllPaged?page-number=1'
ContactDetails_GetById = '/ContactDetails/GetById/'
ContactDetails_Delete = '/ContactDetails/Delete/'
Address_Create = '/Address/Create'
Address_GetAllPaged = '/Address/GetAllPaged'
Address_GetById = '/Address/GetById/'
Address_Delete = '/Address/Delete/'
Operator_Create = '/Operator/Create'
Operator_GetAllPaged = '/Operator/GetAllPaged'
Operator_GetById = '/Operator/GetById/'
Operator_Delete = '/Operator/Delete/'
VehicleType_Create = '/VehicleType/Create'
VehicleTypeGetAllPaged = '/VehicleType/GetAllPaged'
VehicleType_GetById = '/VehicleType/GetById/'
VehicleType_Delete = '/VehicleType/Delete/'
Vehicle_Create = '/Vehicle/Create'
Vehicle_GetAllPaged = '/Vehicle/GetAllPaged'
Vehicle_GetById = '/Vehicle/GetById/'
Vehicle_Delete = '/Vehicle/Delete/'
Account_GetTenantLinksAllPaged = '/Account/GetTenantLinksAllPaged'
Account_LockOnTenant = '/Account/LockOnTenant'
Account_UnlockOnTenant = '/Account/UnlockOnTenant'
Account_LockOnTenantTemporary = '/Account/LockOnTenantTemporary'
Account_TenantLinkOnUser = '/Account/TenantLinkOnUser'
Account_UnregisterOnTenant = '/Account/UnregisterOnTenant'
TenantFacade_GetAllTenantsWithDisablingHistory = '/TenantFacade/GetAllTenantsWithDisablingHistory'
TenantFacade_GetDefaultTenantMap = '/TenantFacade/GetDefaultTenantMap'
TenantFacade_GetAllTenantUsers = '/TenantFacade/GetAllTenantUsers'
VehicleMessage_GetOperators = '/VehicleMessage/GetOperators'
VehicleQuery_FindByTextPaged = '/VehicleQuery/FindByTextPaged?q='
VehicleQuery_GetByGlobalId = '/VehicleQuery/GetByGlobalId/'
VehicleQuery_GetByGlobalIds = '/VehicleQuery/GetByGlobalIds'
MQTTServices_GetStationData_Weather = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=weather&page-number=1&page-size=10'
MQTTServices_GetStationData_Schedule = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=schedule&page-number=1&page-size=10'
MQTTServices_GetStationData_Gastronomy = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=gastronomy&page-number=1&page-size=10'
MQTTServices_GetStationData_HealthCare = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=healthcare&page-number=1&page-size=10'
MQTTServices_GetStationData_Tourism = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=tourism&page-number=1&page-size=10'
MQTTServices_GetStationData_Entertainment = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=entertainment&page-number=1&page-size=10'
MQTTServices_GetStationData_Shopping = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=shopping&page-number=1&page-size=10'
MQTTServices_GetStationData_Accommodation = '/MQTTServices/GetStationData?stationId=de%3A05766%3A2500&topics=accommodation&page-number=1&page-size=10'
MQTTService_StationDataIsSubscribed = '/MQTTServices/StationDataIsSubscribed?stationId=de%3A05766%3A2500'
TypeOfPoint_Create = '/TypeOfPoint/Create'
TypeOfPoint_GetAllPaged = '/TypeOfPoint/GetAllPaged'
TypeOfPoint_GetById = '/TypeOfPoint/GetById/'
TypeOfPoint_Delete = '/TypeOfPoint/Delete/'
Point_Create = '/Point/Create'
Point_GetById = '/Point/GetById/'
Point_GetAllPaged = '/Point/GetAllPaged'
SelfService_GetLastInfotainmentTopics = '/SelfService/GetLastInfotainmentTopics'
Log_GetLogFiles = '/Log/GetLogFiles'

            # Infotainment
li_infotainment = '//*[@id="infotainment-link"]'
Select_Station = '//div[@id="station-dropdown"]'
Topic_tab = '//div[@id="tabs"]'
Minden_HBF = '//li[@aria-label="Minden Bahnhof"]'
Bielefeld_HBF = '//li[@aria-label="Bielefeld Hbf"]'
Lemgo_BHF = '//li[@aria-label="Lemgo, Bahnhof"]'
Bösingfeld_HBF = '//li[@aria-label="Am Bhf 1, Bösingfeld"]'
BÜ_Bruchstr_HBF = '//li[@aria-label="BÜ Bruchstr."]'
Brückenweg_HBF = '//li[@aria-label="Brückenweg"]'
li_Wetter = '//*[@id="tabs"]/ul/li[1]'
li_Abfahrt = '//*[@id="tabs"]/ul/li[2]'
li_Gesundheit = '//*[@id="tabs"]/ul/li[3]'
li_Shopping = '//*[@id="tabs"]/ul/li[4]'
li_Unterkunft = '//*[@id="tabs"]/ul/li[5]'
li_Gastronomie = '//*[@id="tabs"]/ul/li[6]'
li_Sehenswürdigkeiten = '//*[@id="tabs"]/ul/li[7]'
li_Kultur = '//*[@id="tabs"]/ul/li[8]'
li_annehmlichkeit = '//*[@id="tabs"]/ul/li[9]'
li_leihräder = '//*[@id="tabs"]/ul/li[10]'
topic_wetter = '//div[@title="Wetter"]'
topic_abfahrt = '//div[@title="Abfahrt"]'
topic_gesundheit = '//div[@title="Gesundheit"]'
topic_shopping = '//div[@title="Shopping"]'
topic_unterkunft = '//div[@title="Unterkunft"]'
topic_gastronomie = '//div[@title="Gastronomie"]'
topic_sehenswürdigkeiten = '//div[@title="Sehenswürdigkeiten"]'
topic_kultur = '//div[@title="Kultur"]'
topic_annehmlichkeit = '//div[@title="Annehmlichkeit"]'
topic_leihräder = '//div[@title="title="Leihräder/-roller""]'
Weather_Container = '//div[@class="p-tabview-panels"]'
Temperature = '//div[@class="temperature"]'
Weather_Icon = '//div[@class="icon"]'
Weather_Description = '//div[@class="description"]'
Wind = '//div[@class="wind"]'
Rain = '//div[@class="rain"]'
Visibility = '//div[@class="visibility"]'
Abfahrt_table = '//div[@id="tabs_content_1"]'
Gesundheit_table = '//div[@id="tabs_content_2"]'
Shopping_table = '//div[@id="tabs_content_3"]'
Unterkunft_table = '//div[@id="tabs_content_4"]'
Gastronomie_table = '//div[@id="tabs_content_5"]'
Sehenswürdigkeiten_table = '//div[@id="tabs_content_6"]'
Kultur_table = '//div[@id="tabs_content_7"]'
Annehmlichkeit_table = '//div[@id="tabs_content_8"]'

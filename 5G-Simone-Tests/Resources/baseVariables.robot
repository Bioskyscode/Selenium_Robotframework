*** Variables ***
${chrome}                                   chrome
${edge}                                     edge
${firefox}                                  firefox

${TA_Password}                 HalliGalli2!
#${tenantAdmin_AzureURL}                          http://20.52.117.91:3000/welcome
${tenantAdmin_URL_productionStage}          http://82.165.231.18:3000/welcome
${tenantAdmin_URL_testingStage}             http://82.165.231.18:3001/welcome
${tenantAdmin_Email_testing}                proj.testing@biqx.de
${tenantAdmin_Email_simone}                 proj.simone@biqx.de
${tenantAdmin_Email_stadtbus}               proj.stadtbus@biqx.de
${tenantAdmin_Email_regehr}                 d@regehr.de
${TA_Password_regehr}                       Yy!45678


#${tenantAdmin_Email_tommy}                  tommy.steiner@biqx.de
#${tenantAdmin_Password_tommy}               !Test1234

#${tenantAdmin_Email_aleena}                 francisaleena2019@gmail.com
#${tenantAdmin_Password_aleena}              Aleena@12

${mandant_email_abiodun}                    abiodun.ajibade@biqx.de
${mandant_password_abiodun}                 Project5GSimone#

#${tenant_Email_1}                           ajibade.abiodun@outlook.com
#${tenant_1_Password}                        Project5GSimone#

#${tenant_Email_2}   empresaparajesus@gmail.com
#${tenant_2_Password}  5GSimoneProject@

#${superAdmin_AzureURL}                           http://20.52.117.91:3000/login/superadmin
${superAdmin_URL_ProductionStage}           http://82.165.231.18:3000/login/superadmin
${superAdmin_URL_testingStage}              http://82.165.231.18:3001/login/superadmin
${superAdmin_Email}                         detlef.regehr@biqx.de
${SA_Password_ProductionStage}              Yy!45678
${SA_Password_testingStage}                 HalliGalli2!

${Vehicle}                                  Simonex
${Vehicle_OpId}                             Biqx
${Linie_Id}                                 L841
${Current_Passangers}                       21
${Emmergency_Message}                       Technical Problem
${Battery-Level}                            90
${lat}                                      52.00000
${lon}                                      10.0000

############ API
&{TaLogin_request_body}                      email=${tenantAdmin_Email_testing}    password=${TA_Password}
${VehicleMoveUpdate_resBody}                 {"cameras": [{"url": "/VID_rechts.mp4","focus": "Fahrtrichtung Rechts"},{"url": "/VID_cabin.mp4","focus": "Kabine"}],
...     "remoteControl": {"startupParams": "RemoteControl"},
...     "gpsFix": "string",
...     "cell": {"ip": "string","conStat": "string","signal": 0,"netwType": "string","conTime": 0},
...     "metrics": {"cpuUse": 0,"cpuTemp": 0,"ramUse": 0,"throtl": "string","diskFree": 0},
...     "timeUtc": "2023-08-23T11:05:21.934Z",
...     "timeLoc": "2023-08-23T11:05:21.934Z",
...     "use": {"vId": "${Vehicle}","opId": "${Vehicle_OpId}","lId": "${Linie_Id}"},
...     "coords": {"lat": ${lat},"lon": ${lon},"alt": 0,
...     "err": {"lat": 0,"lon": 0,"alt": 0},
...     "accL": 0,"prv": "string","satellites": 0},
...     "move": {"acc": 0,"drivingStage": 0,"kilometrage": 0,"currentlyDrivenDistance": 0,"hSpeed": 0,"vSpeed": 0,"dir": 0},
...     "wind": {"hSpeed": 0,"vSpeed": 0,"dir": 0},
...     "health": {"fuelLevel": 0,"tankCapacity": 0,"battery": ${Battery-Level},"rqBattery": 0,"tmpCbn": 0,"tmpSrf": 0,"tmpDrive": 0,"tilt": 0,"rqTilt": 3,"status": 0,"redMsg": "${Emmergency_Message}"},
...     "carriage": {"currentPassengers": ${Current_Passangers},"currentWeight": 0}}

############ Search For SA Clients #############
${client1}                                  Aleena
${client2}                                  pnich
${client3}                                  Demo-Mandant
${client4}                                  White
${client5}                                  Hayroyal

########### Search For Tenants ######################
${tenant1}                                  Götz
${tenant2}                                  Jennifer
${tenant3}                                  Brian

${CameraView_URL_In_New_Tab}                http://82.165.231.18:3001/monocabs/${Vehicle}

############# Xpaths with Variables ###########
${img_vehicle}                              //img[@title="${Vehicle}"]
${tbl_monocabs_table_BusData}               xpath://*[text()="${Vehicle}"]
${MonocabsTable_VehicleIcon}                //*[@id="ico_${Vehicle}"]
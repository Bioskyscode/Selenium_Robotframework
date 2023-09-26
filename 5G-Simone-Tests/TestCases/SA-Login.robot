*** Settings ***
Documentation           Test Login to SA Page
#Library             AutoRecorder            mode=test,exclude_tags=dont
Resource                ../Resources/SA_LoginKeywords.robot
Test Setup              Common.Start Web Test
Test Teardown           Common.Stop Web Test

*** Test Cases ***
Super Admin Login/Logout Validation
    [Tags]      dont              Login     SA        SA02
    SA_LoginKeywords.Navigate To 5G Simone Super Admin URL
    SA_LoginKeywords.Login To SA Page
    SA_LoginKeywords.Logout
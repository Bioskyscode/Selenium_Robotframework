*** Settings ***
Library             SeleniumLibrary
Library             Process
Resource            ../Resources/baseVariables.robot

*** Keywords ***
Start Web Test
    #Selenium Speed
    ${options}                          Evaluate                sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method                         ${options}              add_argument            test-type
    Call Method                         ${options}              add_argument            --headless
    Call Method                         ${options}              add_argument            --disable-extensions
    #Call Method                        ${options}              add_argument            -- disable-infobars
    Call Method                         ${options}              add_argument            --disable-gpu
    Call Method                         ${options}              add_argument            --disable-dev-shm-usage
    Call Method                         ${options}              add_argument            --no-sandbox
    [Return]                            ${options}

    Log To Console                      Start 5G Simone App on Web Browser
    Open Browser                        about:blank             ${chrome}               options=${options}
    Clear Cookies
    Set Window Position                 -7                      -20
    Set Window Size                     1920                    1080

Stop Web Test
    Close All Browsers
    Log To Console                      Browser closed
    
Selenium Speed
    Set Selenium Speed                  .2s

Clear Cookies
    Delete All Cookies

Resize Browser Window
   # Selenium Speed
    Set Window Size                     375                     667
    Set Window Size                     414                     896
    Set Window Size                     390                     844
    Set Window Size                     412                     915
    Set Window Size                     820                     1180
    Set Window Size                     912                     1368
    Set Window Size                     540                     720
    Set Window Size                     280                     653
    Set Window Size                     1024                    600
    Set Window Size                     1280                    800
    Set Window Size                     800                     800
    Maximize Browser Window



    

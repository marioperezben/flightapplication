*** Settings ***
Library           SeleniumLibrary
Resource          usekeywords.txt

*** Test Cases ***
Openbrowser
    Open Browser    https://google.com    chrome
    sleep    2
    Close Browser

openbrowser2
    Open Browser    https://facebook.com    chrome
    Maximize Browser Window
    sleep    2
    Input Text    xpath://*[@id="email"]    ngendigital
    sleep    2
    input text    css:#pass    abcd
    sleep    2
    close browser

Fligh Application
    open browser    https://ngendigital.com/demo-application    chrome
    sleep    2
    Maximize Browser Window
    select frame    id=iframe-015
    input text    xpath://input[@type='email']    demo@gmail.com
    input text    xpath://input[@type='password']    demopassword
    Click Element    xpath://div[@class='btn' ]
    sleep    2
    [Teardown]    Close Browser

Fligh Application 2
    open browser    https://ngendigital.com/demo-application    chrome
    sleep    2
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    login_to_flight    demo@gmail.com    demopassword
    sleep    2
    [Teardown]    Close Browser

Fligh Application 3
    open browser    https://ngendigital.com/demo-application    chrome
    sleep    2
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    login_to_flight    support@ngendidgital.com    abc12345
    sleep    2
    Page Should Contain    css:#InvalidLogin > p > label > font
    sleep    2
    [Teardown]    Close Browser

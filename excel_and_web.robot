*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          usekeywords.txt

*** Test Cases ***
excel_web
    open browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    sleep    2
    Select Frame    id=iframe-015
    sleep    2
    Wait Until Keyword Succeeds    1 min    5s    login_to_flight_excel
    sleep    4
    [Teardown]    close browser

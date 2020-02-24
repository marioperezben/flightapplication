*** Settings ***
Library           SeleniumLibrary

*** Variables ***
@{cities}
${City}           ${EMPTY}

*** Test Cases ***
text_box
    Open Browser    https://ngendigital.com/practice
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    It has failed    Debug
    sleep    2
    Input Text    xpath://input[@name='FirstName']    MARIO
    sleep    2
    Textfield Value Should Be    xpath://input[@name='FirstName']    MARIO
    sleep    2
    Clear Element Text    xpath://input[@name='FirstName']
    Page Should Contain Textfield    xpath://input[@name='FirstNamo']    It has failed    Warn
    sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstNemo']    It has failed    Warn
    [Teardown]    Close Browser

botton
    Open Browser    https://www.facebook.com    chrome
    Maximize Browser Window
    sleep    2
    Click Button    xpath://input[@value='Entrar']
    sleep    4
    [Teardown]    Close Browser

checkbox
    Open Browser    https://www.ngendigital.com/practice    chrome
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    Page Should Contain Checkbox    //input[@value='bmw']    Checkbox not found    Info
    sleep    4
    Select Checkbox    //input[@value='bmw']
    sleep    2
    Checkbox Should Be Selected    //input[@value='bmw']
    sleep    2
    Unselect Checkbox    //input[@value='bmw']
    sleep    2
    [Teardown]    Close Browser

list_test
    Open Browser    https://www.ngendigital.com/practice    chrome
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    Page Should Contain List    css:#FromCity
    sleep    2
    @{cities}    Get List Items    css:#FromCity
    FOR    ${City}    IN    @{cities}
    /    LOG    ${City}
    Sleep    2
    List Selection Should Be    css:#FromCity    Toronto
    Select From List By Index    css:#FromCity    1
    sleep    2
    Select From List By Label    css:#FromCity    Chicago
    sleep    2
    [Teardown]    Close Browser

radio_botom
    Open Browser    https://www.ngendigital.com/practice    chrome
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    Page Should Contain Radio Button    xpath://input[@value='flight']
    sleep    2
    Select Radio Button    flight    flighthotel
    sleep    2
    Radio Button Should Be Set To    flight    flighthotel
    sleep    2
    [Teardown]    Close Browser

image
    Open Browser    https://www.ngendigital.com/practice    chrome
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    Click Image    //*[@id="header_stickynav5256"]/nav/div/div[1]/div[2]/div/a/img
    sleep    3
    [Teardown]    Close Window

table
    Open Browser    https://www.ngendigital.com/practice    chrome
    Maximize Browser Window
    select frame    id=iframe-015
    sleep    2
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    Info
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    sleep    2
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    sleep    2
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau    log
    sleep    2
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    sleep    2
    ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
    log to console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    sleep    2
    [Teardown]    Close Browser

*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          UserDefineKeywords.txt
Library           DateTime

*** Variables ***
${var1}           4    # This is my first scaler variable
${var2}           4    # This is my second variable
@{USER}           mario    mario
&{credentials}    username=mario    password=mario

*** Test Cases ***
TC_01
    Should Be Equal    ${var1}    ${var2}

TC02
    [Tags]    Login
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    @{USER}[0]    @{USER}[1]
    [Teardown]    TeardownDemo

TC03
    Should Be Equal As Strings    &{credentials}[username]    &{crede5n6tials}[password]

TC04
    [Tags]    Login
    Should Be Equal    4    4

TC05
    [Template]    Should Be Equal As Integers
    [Timeout]    2 minutes 20 seconds    # Timeout test
    4    4    4
    6    6    6
    5    5    5

TC06
    Comparetwovariables

Current Date
    ${d}    Get Current Date
    Log to Console    ${d}

*** Keywords ***
SetupDemo
    Log To Console    This is Setup Method

TeardownDemo
    Log To Console    This is Teardown Method

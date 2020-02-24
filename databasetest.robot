*** Settings ***
Library           DatabaseLibrary
Library           SeleniumLibrary
Library           Collections
Resource          Commonkeywords.txt
Resource          Commonkeywords.txt

*** Test Cases ***
TC01-databaseautomation
    [Timeout]
    Connect To Database    pymssql    sqlmario    sqlmario    sqlmario    localhost    1433
    @{queryresults}    Description    Select * from Student
    Log Many    @{queryresults}
    @{queryresults}    query    Select * from Student
    Log Many    @{queryresults}
    ${count}    Row Count    Select * from Student
    log    ${count}
    Row Count Is Equal To X    Select * from Student    5
    Table Must Exist    student
    Check If Exists In Database    select FirstName from Student where LastName = 'Perez'

TC02_database_and_web
    Connect To Database    pymssql    sqlmario    sqlmario    sqlmario    localhost    1433
    Table Must Exist    ngendigital
    @{queryresults}    query    select Username from Ngendigital where id =1
    ${var5}    Convert To List    @{queryresults}
    @{queryresults1}    query    select Password from Ngendigital where id =1
    ${var6}    Convert To List    @{queryresults1}
    open browser    https://ngendigital.com/demo-application    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='email']    ${var5}
    Wait Until Keyword Succeeds    2    1    Input Text    xpath://input[@type='password']    ${var6}
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://div[contains(text(), 'Sign In')]

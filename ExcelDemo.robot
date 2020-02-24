*** Settings ***
Library           ExcelLibrary

*** Variables ***
${Count}          ${EMPTY}
@{Count1}
${var1}           ${EMPTY}
${sheetname}      ${EMPTY}
[Arguments]       ${Column_Number}    ${Row_Number}
${TC_Name}        Read Cell Data By Coordinates    Sheet1    0    ${Row_Number}
Log To Console    ${Row_Number}
Log To Console    ${TC_Name}

*** Test Cases ***
Excelcase1
    Open Excel    D:/TRABAJO/Auben/Automatizacion/robot/Demo/prueba1.xls    True

Check Cell Type
    Sheet1    2    1
    ${Count}    get column count    Sheet1
    @{Count1}    Get Column Values    Sheet1    2
    FOR    ${var1}    IN    @{Count1}
    Log    ${var1}
    ${sheetname}    Get Sheet Names
    ${sheetname}    Read Cell Data By Coordinates    Sheet1    1    1
    ${sheetname}    Read Cell Data By Name    Sheet1    E2

create_excel
    Create Excel Workbook    sample123
    save excel    D:/TRABAJO/Auben/Automatizacion/robot/Demo/prueba2.xls

changevalues
    open excel    D:/TRABAJO/Auben/Automatizacion/robot/Demo/prueba2.xls
    put number to cell    sample123    1    0    10
    save excel    D:/TRABAJO/Auben/Automatizacion/robot/Demo/prueba3.xls

testcase_1
    Open Excel    D:/TRABAJO/Auben/Automatizacion/robot/Demo/case_assigment.xls    case_assigment
    FOR    ${ExecuteStatusValue}    IN    @{ExecuteStatusList}
    /    ${ColumnValue}    Read Cell Data By Coordinates    Sheet1    1    ${Count}
    /    ${Row_ID}    Set Variable If    '${ColumnValue}'=='Yes'    ${Count}
    /    Run Keyword If    '${Row_ID}'=='${Count}'    Get values from Rows    0    ${Row_ID}
    /    ${Count}=    Evaluate    ${Count}+1
    ${Count}=    Set Variable    0

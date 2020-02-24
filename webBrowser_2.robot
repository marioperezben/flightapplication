*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
open_int_explor
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    sleep    2
    select frame    id=iframe-015
    sleep    2
    Select From List By Index    id:FromCity

webbrowser3
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Click Element    xpath:/html/body/fieldset[3]/input[1]
    sleep    2
    Click Element    xpath://input[@value='merc']
    [Teardown]    Close Browser

advancedxpath
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Element Text Should Be    xpath://option[text()='Toronto']    Toronto
    sleep    2

webbrowser4
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Click Element    xpath://input[contains(@value,'bmw')]
    sleep    2
    Click Element    xpath://input[starts-with(@value,'m')]
    sleep    2
    click element    xpath://input[@type='checkbox'][3]
    sleep    2
    click element    xpath://input[@type='checkbox' and @value='bmw']
    sleep    2
    close browser

browser5
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Click Element    xpath://html/body/descendant::input[@value='bmw' ]
    sleep    2
    Click Element    xpath://input[@value='merc']/preceding-sibling::*[2]
    sleep    2
    Click Element    xpath://input[@value='merc']/following-sibling::*[2]
    sleep    2
    Click Element    xpath://input[@value='merc']/preceding-sibling::input[@value='bmw']
    sleep    2
    close browser

case_selector
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Click Element    css:select#FromCity
    sleep    2
    Click Element    css:input[value$='w']
    sleep    2
    Click Element    css:div.popup
    sleep    2
    close browser

css_wildcards
    Open Browser    https://ngendigital.com/practice    chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    sleep    2
    Click Element    css:fieldset>select :first-child
    sleep    2
    Click Element    css:fieldset>select :last-child
    sleep    2
    Click Element    css:fieldset>select :nth-child(2)
    sleep    2
    close browser

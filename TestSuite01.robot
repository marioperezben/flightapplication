*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${p}              Hello World

*** Test Cases ***
TC01
    Log To Console    ${p}

Assign id to Element
    Set Selenium Speed    0.3
    open browser    https://ngendigital.com/practice    chrome
    select frame    id=iframe-015
    Assign Id To Element    xpath://tbody/tr[4]/td[3]    pm
    ${p}    get text    pm
    log    ${p}
    capture page screenshot
    [Teardown]    close browser

Miscelanous
    Set Selenium Speed    0.3
    open browser    https://ngendigital.com/practice    chrome
    select frame    id=iframe-015
    Current Frame Should Contain    Select Example
    Element Attribute Value Should Be    xpath://input[@value='bmw']    name    car
    [Teardown]    close browser

Count_elements
    Set Selenium Speed    0.5
    open browser    https://ngendigital.com/practice    chrome
    select frame    id=iframe-015
    ${p}    get element count    //input[@name='car']
    should be true    ${p}==3
    [Teardown]    close browser

go and back
    open browser    https://ngendigital.com/practice    chrome
    sleep    2
    go to    https://www.cineplex.com
    sleep    2
    go back
    [Teardown]

url verify
    open browser    https://ngendigital.com/    chrome
    location should be    https://ngendigital.com/    it is no the same
    close browser
    open browser    https://www.google.com/    chrome
    log location
    log source
    log title
    close browser
    [Teardown]

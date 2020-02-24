*** Settings ***
Test Teardown     close browser
Resource          Commonkeywords.txt
Resource          ExcelDataFechc.txt

*** Test Cases ***
TC01-LoginScreen_Objects on page
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    Objectsonwebpage
    [Teardown]    close browser

TC02_Login screen - default text for username and password
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    Default_user_password

TC03_User does not enter mail
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    Empty_username

TC04_User does not enter password
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    Emptypassword

TC05_User does not enter mail or password
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    emptyuserpassword

TC06_user enters invalid mail and pass
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    invalidusernameformat

TC07
    Load Excel Data    Login    TC07    email

TC08
    Loginandnavigatetourl
    Change to iframe    id=iframe-015
    Login
    Select Frame    id=iframe-115
    verifyafterlogin

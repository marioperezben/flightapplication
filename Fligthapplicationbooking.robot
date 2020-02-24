*** Settings ***
Test Teardown     close browser
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          Commonkeywords.txt
Resource          UserDefineKeywords.txt
Resource          ExcelDataFechc.txt

*** Test Cases ***
TC01_Booking_1
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    Validatefromcity
    Logout
    [Teardown]    close browser

TC02_booking_2_tocity
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    validatetocity
    [Teardown]    close browser

TC03_Booking_trip
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    Validateclass
    [Teardown]    close browser

TC04_Booking_radio_button
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    checkboxvalidation
    [Teardown]

TC05_book_fligth_oneway_toronto_paris_eco
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    book_economic_flight

TC06_newyork_to_mumbay
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    book_economic

TC07_Businessclass
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    bookbusiness

TC08_select_flight_hotel
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    Validationbooking
    Click Element    xpath://button[contains(text(),'Get Fare')]
    Wait Until Keyword Succeeds    2    1    Page Should Contain    Please choose one of Flight or Flight + Hotel!

TEST_MARIO
    Loginandnavigatetourl
    change to iframe    id=iframe-015
    login
    change to iframe    id=iframe-115
    verifyafterlogin
    searchflight
    sleep    4

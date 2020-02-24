*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
openfire
    Open Browser    http://www.google.com    ff

TC07_User logs in with valid username and password
    Loginandnavigatetourl
    Change to iframe

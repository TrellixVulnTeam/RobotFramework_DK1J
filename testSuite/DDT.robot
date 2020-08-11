# Data Driven Testing for login

*** Settings ***
Documentation  This is data driven demo testing
Library  Selenium2Library
#Test Setup    open Browser  ${url}  ${browser}
#Test Teardown   close Browser
Suite Setup      open Browser  ${url}  ${browser}
Suite Teardown   close Browser
Test Template   Invalid Login Scenarios


*** Variables ***
${url}    https://www.saucedemo.com/
${browser}   Chrome
${error_box}    //*[@id="login_button_container"]/div/form/h3

*** Keywords ***
Invalid Login Scenarios
   [Arguments]    ${username}  ${password}   ${error_message}
   Input Text     id:user-name  ${username}
   Input Text     id:password     ${password}
   Click Element  id:login-button
   Element should contain  ${error_box}   ${error_message}

*** Test Cases ***                                   USERNAME          PASSWORD        ERROR MESSAGE

Verify Login Fails - Blank username and Password    ${EMPTY}           ${EMPTY}       Epic sadface: Username is required
Verify Login Fails - Blank Password                 standard_user      ${EMPTY}       Epic sadface: Password is required
Verify Login Fails - Wrong User                     standard_us        secret_sau     Epic sadface: Username and password do not match any user in this service
Verify Login Fails - Wrong Password                 standard_user      secret_sau     Epic sadface: Username and password do not match any user in this service
Verify Login Fails - LockedOut user                 locked_out_user    secret_sauce   Epic sadface: Sorry, this user has been locked out





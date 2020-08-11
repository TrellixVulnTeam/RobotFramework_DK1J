# Data Driven Testing with CSV file for login

*** Settings ***
Documentation  This is data driven demo testing
Library  Selenium2Library
Library    DataDriver   file=../TestData/TestData.xlsx   sheet_name=Sheet1   dialect=excel
Suite Setup      open Browser  ${url}  ${browser}
Suite Teardown   close Browser
Test Template   Invalid Login Scenarios

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}   Chrome
${error_box}    //*[@id="login_button_container"]/div/form/h3

*** Keywords ***
Invalid Login Scenarios
   [Arguments]    ${username}   ${password}    ${error_message}
   log to console  ${username}   ${password}    ${error_message}
   Input Text     id:user-name  ${username}
   Input Text     id:password     ${password}
   Click Element  id:login-button
   Element should contain  ${error_box}   ${error_message}

*** Test Cases ***
Verify Login Fails With invalid Credentials   ${username}   ${password}    ${error_message}


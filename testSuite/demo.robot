*** Settings ***
Documentation  This is simple demo for testing a site using Robot Framework
Library  Selenium2Library
Resource  ../Resources/userDefineKeywords.robot


*** Variables ***
${url}  https://www.google.com
${browser}  Chrome

*** Keywords ***

Validate that page have offical site
    Page should Contain     QA InfoTech

*** Test Cases ***

Go to Website
    open browser    ${url}   ${browser}
    Input Text       name:q     qainfotech
    Click Button    name:btnk
    Validate that page have offical site
    close Browser


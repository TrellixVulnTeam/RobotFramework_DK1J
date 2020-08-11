*** Settings ***
Library  Selenium2Library


*** Variables ***
${url}  https://www.seleniumeasy.com/test/
${browser}  Chrome
${GET_STARTED}  //*[@id='image-darkener']

*** Keywords ***

Start browser
    Open Browser     ${url}  ${browser}
#    Maximize browser window
    wait until Page Contains element  ${GET_STARTED}
    Click element   xpath://*[@id='at-cv-lightbox-close']


Exit Browser
    sleep  1s
   [Teardown]   Close Browser





*** Settings ***
Library  Selenium2Library

*** Variables ***
${Home_Page}    //*[@href='/test']


*** Keywords ***
Go to Basic section for Demo example
   click element  ${Home_Page}
   click element   //*[@class='nav nav-tabs']//li[@class='tab-toggle']//*[@id='basic_example']


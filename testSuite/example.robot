*** Settings ***
Documentation  This is simple demo for testing a site using Robot Framework
Library  Selenium2Library
Resource  ../Resources/commonFunctionality.robot
Resource  ../Resources/userDefineKeywords.robot

Test Setup     commonFunctionality.Start browser
Test Teardown  commonFunctionality.Exit Browser

*** Variables ***
${site_url}     www.google.com

*** Keywords ***
Welcome page should be open
   Title Should Be    Selenium Easy - Best Demo website to practice Selenium Webdriver Online

validate Element is present at page
  [Arguments]  ${element}
#  ${status}=  Run Keyword and Return Status   Page Should Contain Element  ${element}
  Page Should Contain Element  ${element}
#  log to console  ${status}

Select Simple input demo page
   validate Element is present at page  //div[@class='list-group']//a[contains(text(),'Simple Form Demo')]
#   Execute Javascript    window.scrollTo(0,600)
   sleep  1s
   click element   link:Simple Form Demo

validate Simple input field section
   ${text}=  set variable  This is simple text
   Input Text   //*[@id='get-input']//input   ${text}
   Click Element  //*[@id='get-input']//*[@class='btn btn-default']
   ${out}   Get Text   //*[@id='user-message']//span
   Should Be Equal As Strings    ${out}    ${text}

validate Simple two input field section
   ${num1}=  set variable  231
   ${num2}=  set variable  269
   Input Text   id=sum1   ${num1}
   Input Text   id:sum2   ${num2}
   Click Element  //*[@id='gettotal']//*[@class='btn btn-defaul']
   ${out}   Get Text   //*[@id='displayvalue']
   ${total}=  evaluate  ${num1}+${num2}
   Should Be Equal As Strings    ${out}  ${total}


*** Test Cases ***

Verify Home Page os site
   [Documentation]    This test case verifies the home page of site
   [Tags]              functional
   log to console  ${\n}Validate title of Home page
   Welcome page should be open
   log to console  Side nav is present ?
   validate element is present at page  //div[@class='panel panel-default']
   validate element is present at page  //*[@id='home_bar']


Verify Simple Form demo page
   [Documentation]   This test case verifies simple Form demo page
   Go to Basic section for Demo example
   Select Simple input demo page
   validate Simple input field section
   validate Simple two input field section


#Example action  log     this is test case
#   @{StringItems}    Create List    Selenium    Master    Test    Automation
#   FOR  ${Item}  IN    @{StringItems}
#      log to console    ${Item}
#      END


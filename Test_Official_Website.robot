*** Settings ***
Resource  ${CURDIR}/lib/home_page.robot

Test Setup       Open App
Test Teardown    Test Teardown

*** Test Cases ***

Test Official Website
    [Tags]  Test_Official_Website
    [Documentation]  國泰官網測試

    Go To Home Page
    Check Credit Card Menu
    Check Suspended Card

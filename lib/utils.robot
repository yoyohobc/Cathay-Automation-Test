*** Settings ***
Resource  resource.robot
Library  OperatingSystem  WITH NAME  os
Library  setup.py
*** Keywords ***
Open App
    [Documentation]  開啟瀏覽器或APP

    Directory Set Up
    IF  "${PLATFORM}"=="Android"
        Open Application  ${Appium_Host}  platformName=${ANDROID_PLATFORM_NAME}
        ...  deviceName=${Andorid_Device_Name}  platformVersion=${ANDROID_PLATFORM_VERSION}
        ...  browserName=${BROWSER}  noReset=${TRUE}
        Set Appium Timeout  ${time_out_secs}
    ELSE IF  "${PLATFORM}"=="Web"
        Open Browser  browser=${BROWSER}
        Set Selenium Implicit Wait  ${time_out_secs}
        Set Window Size  ${Width}  ${Height}
    END


Click Element And Wait
    [Arguments]  ${element}
    [Documentation]  點擊並等待

    Click Element  ${element}
    Sleep  1


Test Teardown
    [Documentation]  關閉頁面

    IF  "${PLATFORM}"=="Web"
        Close All Browsers
    ELSE
        Close All Applications
    END


Directory Set Up
    [Documentation]  初始化截圖路徑

    Run Keyword And Ignore Error
    ...  os.Empty Directory  ${Screenshot_Path}
    Directory Set Up Py
*** Settings ***
Resource  utils.robot

*** Keywords ***

Go To Home Page
    [Documentation]  1.國泰世華銀行官網

    Log to console  \n首頁
    Run Keyword If  "${PLATFORM}"=="Android"
    ...  Go To Url  ${HOME_URL}
    Run Keyword If  "${PLATFORM}"=="Web"
    ...  Go To  ${HOME_URL}
    Wait Until Page Contains  ${home_page_check_text}  timeout=${time_out_secs}
    Capture Page Screenshot  ${Screenshot_Path}${step1_png}

    Log to console  1.首頁截圖


Check Credit Card Menu
    [Documentation]  2.信用卡列表選單

    Click Element And Wait  ${home_page_menu}
    Click Element And Wait  ${product_list_button}
    Click Element And Wait  ${credit_card_menu_button}
    Capture Page Screenshot  ${Screenshot_Path}${step2_png}
    Log to console  信用卡列表選單截圖
    IF  "${PLATFORM}"=="Android"
        ${total}=  Get Matching Xpath Count  ${credit_card_menu}${menu_options}
    ELSE IF  "${PLATFORM}"=="Web"
        ${total}=  Get Element Count  ${xpath}${credit_card_menu}${menu_options}
    END

    Log  2.信用卡選單項目數:${total}
    Log to console  2.信用卡選單項目數:${total}


Check Suspended Card
    [Documentation]  3.(停發)信用卡

    Click Element And Wait  ${credit_card_introduce_button}
    IF  "${PLATFORM}"=="Android"
        Swipe By Percent  50  90  50  10  400
        ${amount}=  Get Matching Xpath Count  ${suspended_card_slider}
        ${amount}=  Convert To Integer  ${amount}
    ELSE IF  "${PLATFORM}"=="Web"
        Set Screenshot Directory  ${Screenshot_Card_Path}
        Scroll Element Into View  ${xpath}${suspended_card_slider}
        ${amount}=  Get Element Count  ${xpath}${suspended_card_slider}
    END
    Set Test Variable  ${suspended_card_slider}  ${xpath}${suspended_card_slider}
    ${card_count}=  evaluate  0
    FOR  ${i}  IN RANGE  1  ${amount+1}
        Click Element And Wait  ${suspended_card_slider + '[${i}]'}
        ${card_title_text}=  Get Suspended Card Name  ${i}
        Log to console  ${card_title_text}
        IF  "(停發)" in "${card_title_text}"
            ${card_count}=  evaluate  ${card_count} + 1
            Capture Page Screenshot  ${Screenshot_Card_Path}/${card_title_text}.png
        END
    END
    ${png_count}=  os.Count Files In Directory  ${Screenshot_Card_Path}

    Log  3.停發卡數量:${card_count} 截圖數量:${png_count}
    Log to console  3.停發卡數量:${card_count} 截圖數量:${png_count}
    Should Be Equal  ${card_count}  ${png_count}


Get Suspended Card Name
    [Documentation]  取得(停發)信用卡名稱
    [Arguments]  ${index}

    ${card_title}=  Catenate  ${xpath}/html/body/div[1]/main/article/section[6]
    ...  /div/div[2]/div/div[1]/div[${index}]/div/div[2]
    ${card_title_text}=  Get Text  ${card_title}

    [Return]  ${card_title_text}
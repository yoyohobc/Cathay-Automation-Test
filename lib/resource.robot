*** Settings ***
Variables  variables.py

*** Variables ***
#平台選擇參數(Android/Web)
${PLATFORM}  Web
#Android
${ANDROID_PLATFORM_NAME}     Android
${ANDROID_PLATFORM_VERSION}  %{ANDROID_PLATFORM_VERSION=12}
${Andorid_Device_Name}       Mi 11
${Appium_Host}    http://127.0.0.1:4723/wd/hub
#Web
${BROWSER}    Chrome
${Height}  ${844}
${Width}   ${390}
#等待元素秒數
${time_out_secs}  10
${HOME_URL}  https://www.cathaybk.com.tw/cathaybk/
${Screenshot_Path}  ${EXECDIR}/screenshot_${PLATFORM}/
${Screenshot_Card_Path}  ${Screenshot_Path}/suspended_card
${step1_png}  Step1.png
${step2_png}  Step2.png
${home_page_check_text}  開戶
${home_page_menu}  ${xpath}/html/body/div[1]/header/div/div[1]/a/img[2]
${product_list_button}  ${xpath}/html/body/div[1]/header/div/div[3]/div/div[2]/div/div/div[1]
${menu_options}  //*[@id="lnk_Link"]
${credit_card_menu}  /html/body/div[1]/header/div/div[3]/div/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]
${credit_card_menu_button}  ${xpath}/html/body/div[1]/header/div/div[3]/div/div[2]/div/div/div[1]/div[2]/div/div[1]/div[1]
${credit_card_introduce_button}  ${xpath}/html/body/div[1]/header/div/div[3]/div/div[2]/div/div/div[1]/div[2]/div/div[1]/div[2]/a[1]
${suspended_card_slider}  /html/body/div[1]/main/article/section[6]/div/div[2]/div/div[2]/span


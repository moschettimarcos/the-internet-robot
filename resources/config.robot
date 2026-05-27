*** Settings ***
Documentation     Configuration file for The Internet automation project
...               Contains variables and common settings

Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://the-internet.herokuapp.com
${BROWSER}        chrome
${HEADLESS}       ${False}
${IMPLICIT_WAIT}  10s
${EXPLICIT_WAIT}  30s

# Test credentials
${VALID_USERNAME}    tomsmith
${VALID_PASSWORD}    SuperSecretPassword!
${INVALID_USERNAME}  invalid
${INVALID_PASSWORD}  invalid

# Page URLs
${LOGIN_URL}              ${BASE_URL}/login
${CHECKBOXES_URL}         ${BASE_URL}/checkboxes
${DROPDOWN_URL}           ${BASE_URL}/dropdown
${DYNAMIC_CONTROLS_URL}  ${BASE_URL}/dynamic_controls
${ADD_REMOVE_URL}         ${BASE_URL}/add_remove_elements/
${FILE_UPLOAD_URL}        ${BASE_URL}/upload
${JS_ALERTS_URL}          ${BASE_URL}/javascript_alerts
${KEY_PRESSES_URL}        ${BASE_URL}/key_presses
${INPUTS_URL}             ${BASE_URL}/inputs
${HOVERS_URL}             ${BASE_URL}/hovers

*** Keywords ***
Open Browser To Base URL
    [Documentation]    Open browser and navigate to base URL
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${chrome_options}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Window Size    1920    1080

Close Browser Session
    [Documentation]    Close browser
    Close All Browsers

Capture Screenshot If Test Failed
    [Documentation]    Capture screenshot if test failed
    Run Keyword If Test Failed    Capture Page Screenshot

*** Settings ***
Documentation     Test suite for JavaScript Alerts functionality
...               Tests JS Alert, Confirm, and Prompt interactions

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To JavaScript Alerts Page

*** Variables ***
${JS_ALERT_BUTTON}     css=button[onclick='jsAlert()']
${JS_CONFIRM_BUTTON}   css=button[onclick='jsConfirm()']
${JS_PROMPT_BUTTON}    css=button[onclick='jsPrompt()']
${RESULT_MESSAGE}      id=result

*** Test Cases ***
Accept JS Alert
    [Documentation]    Verify JS Alert can be accepted
    [Tags]    alerts    js_alert
    Click Element With Wait    ${JS_ALERT_BUTTON}
    Sleep    1s
    ${text}=    Handle Alert    ACCEPT
    Should Be Equal    ${text}    I am a JS Alert
    Verify Element Contains Text    ${RESULT_MESSAGE}    You successfully clicked an alert

Dismiss JS Confirm
    [Documentation]    Verify JS Confirm can be dismissed
    [Tags]    alerts    js_confirm
    Click Element With Wait    ${JS_CONFIRM_BUTTON}
    Sleep    1s
    ${text}=    Handle Alert    DISMISS
    Should Be Equal    ${text}    I am a JS Confirm
    Verify Element Contains Text    ${RESULT_MESSAGE}    You clicked: Cancel

Accept JS Confirm
    [Documentation]    Verify JS Confirm can be accepted
    [Tags]    alerts    js_confirm
    Click Element With Wait    ${JS_CONFIRM_BUTTON}
    Sleep    1s
    ${text}=    Handle Alert    ACCEPT
    Should Be Equal    ${text}    I am a JS Confirm
    Verify Element Contains Text    ${RESULT_MESSAGE}    You clicked: Ok

Accept JS Prompt With Text
    [Documentation]    Verify JS Prompt can accept text input
    [Tags]    alerts    js_prompt
    Click Element With Wait    ${JS_PROMPT_BUTTON}
    Sleep    1s
    Handle Alert    ACCEPT
    Verify Element Contains Text    ${RESULT_MESSAGE}    You entered:

Dismiss JS Prompt
    [Documentation]    Verify JS Prompt can be dismissed
    [Tags]    alerts    js_prompt
    Click Element With Wait    ${JS_PROMPT_BUTTON}
    Sleep    1s
    Handle Alert    DISMISS
    Verify Element Contains Text    ${RESULT_MESSAGE}    You entered: 

Accept JS Prompt Without Text
    [Documentation]    Verify JS Prompt can be accepted without text
    [Tags]    alerts    js_prompt
    Click Element With Wait    ${JS_PROMPT_BUTTON}
    Sleep    1s
    Handle Alert    ACCEPT
    Verify Element Contains Text    ${RESULT_MESSAGE}    You entered: 

*** Keywords ***
Navigate To JavaScript Alerts Page
    [Documentation]    Navigate to JavaScript alerts page
    Go To    ${JS_ALERTS_URL}
    Wait For Page Load

*** Settings ***
Documentation     Test suite for Key Presses functionality
...               Tests keyboard input and key press detection

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Key Presses Page

*** Variables ***
${TARGET_INPUT}       id=target
${RESULT_TEXT}       id=result

*** Test Cases ***
Press Escape Key
    [Documentation]    Verify Escape key press is detected
    [Tags]    key_presses    keys
    Press Keys    ${TARGET_INPUT}    ESCAPE
    Verify Element Contains Text    ${RESULT_TEXT}    ESCAPE

Press Space Key
    [Documentation]    Verify Space key press is detected
    [Tags]    key_presses    keys
    Press Keys    ${TARGET_INPUT}    SPACE
    Verify Element Contains Text    ${RESULT_TEXT}    SPACE

Press Tab Key
    [Documentation]    Verify Tab key press is detected
    [Tags]    key_presses    keys
    Press Keys    ${TARGET_INPUT}    TAB
    Verify Element Contains Text    ${RESULT_TEXT}    TAB

Press Letter Key
    [Documentation]    Verify letter key press is detected
    [Tags]    key_presses    keys
    Press Keys    ${TARGET_INPUT}    A
    Verify Element Contains Text    ${RESULT_TEXT}    A

Press Number Key
    [Documentation]    Verify number key press is detected
    [Tags]    key_presses    keys
    Press Keys    ${TARGET_INPUT}    1
    Verify Element Contains Text    ${RESULT_TEXT}    1

Press Special Character Key
    [Documentation]    Verify special character key press is detected
    [Tags]    key_presses    keys
    Press Keys    ${TARGET_INPUT}    /
    Verify Element Contains Text    ${RESULT_TEXT}    SLASH

*** Keywords ***
Navigate To Key Presses Page
    [Documentation]    Navigate to key presses page
    Go To    ${KEY_PRESSES_URL}
    Wait For Page Load

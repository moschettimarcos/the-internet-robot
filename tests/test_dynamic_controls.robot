*** Settings ***
Documentation     Test suite for Dynamic Controls functionality
...               Tests dynamic element addition/removal and enable/disable

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Dynamic Controls Page

*** Variables ***
${CHECKBOX}           id=checkbox
${REMOVE_BUTTON}      css=button[onclick='swapCheckbox()']
${INPUT_FIELD}        css=input[type='text']
${ENABLE_BUTTON}      css=button[onclick='swapInput()']
${MESSAGE}            id=message

*** Test Cases ***
Remove Checkbox
    [Documentation]    Verify checkbox can be removed
    [Tags]    dynamic_controls    removal
    Verify Element Is Visible    ${CHECKBOX}
    Click Element With Wait    ${REMOVE_BUTTON}
    Wait Until Element Is Not Visible    ${CHECKBOX}    ${EXPLICIT_WAIT}
    Verify Element Is Not Visible    ${CHECKBOX}

Add Checkbox
    [Documentation]    Verify checkbox can be added back
    [Tags]    dynamic_controls    addition
    Click Element With Wait    ${REMOVE_BUTTON}
    Wait Until Element Is Not Visible    ${CHECKBOX}    ${EXPLICIT_WAIT}
    Click Element With Wait    ${REMOVE_BUTTON}
    Wait Until Element Is Visible    ${CHECKBOX}    ${EXPLICIT_WAIT}
    Verify Element Is Visible    ${CHECKBOX}

Enable Input Field
    [Documentation]    Verify input field can be enabled
    [Tags]    dynamic_controls    enable
    Verify Element Is Disabled    ${INPUT_FIELD}
    Click Element With Wait    ${ENABLE_BUTTON}
    Wait Until Element Is Enabled    ${INPUT_FIELD}    ${EXPLICIT_WAIT}
    Verify Element Is Enabled    ${INPUT_FIELD}
    Verify Element Contains Text    ${MESSAGE}    It's enabled

Disable Input Field
    [Documentation]    Verify input field can be disabled
    [Tags]    dynamic_controls    disable
    Click Element With Wait    ${ENABLE_BUTTON}
    Wait Until Element Is Enabled    ${INPUT_FIELD}    ${EXPLICIT_WAIT}
    Click Element With Wait    ${ENABLE_BUTTON}
    Wait Until Keyword Succeeds    ${EXPLICIT_WAIT}    1s    Element Should Be Disabled    ${INPUT_FIELD}
    Verify Element Is Disabled    ${INPUT_FIELD}
    Verify Element Contains Text    ${MESSAGE}    It's disabled

Type In Enabled Input Field
    [Documentation]    Verify text can be entered in enabled input
    [Tags]    dynamic_controls    input
    Click Element With Wait    ${ENABLE_BUTTON}
    Wait Until Element Is Enabled    ${INPUT_FIELD}    ${EXPLICIT_WAIT}
    Input Text With Wait    ${INPUT_FIELD}    Hello World
    ${value}=    Get Value    ${INPUT_FIELD}
    Should Be Equal    ${value}    Hello World

*** Keywords ***
Navigate To Dynamic Controls Page
    [Documentation]    Navigate to dynamic controls page
    Go To    ${DYNAMIC_CONTROLS_URL}
    Wait For Page Load

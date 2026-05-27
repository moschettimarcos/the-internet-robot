*** Settings ***
Documentation     Test suite for Inputs functionality
...               Tests number input field and arrow key interactions

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Inputs Page

*** Variables ***
${NUMBER_INPUT}      css=input[type='number']

*** Test Cases ***
Enter Valid Number
    [Documentation]    Verify valid number can be entered
    [Tags]    inputs    entry
    Input Text With Wait    ${NUMBER_INPUT}    123
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    123

Enter Decimal Number
    [Documentation]    Verify decimal number can be entered
    [Tags]    inputs    entry
    Input Text With Wait    ${NUMBER_INPUT}    12.5
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    12.5

Enter Negative Number
    [Documentation]    Verify negative number can be entered
    [Tags]    inputs    entry
    Input Text With Wait    ${NUMBER_INPUT}    -42
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    -42

Clear Input Field
    [Documentation]    Verify input field can be cleared
    [Tags]    inputs    clearing
    Input Text With Wait    ${NUMBER_INPUT}    100
    Clear Element Text    ${NUMBER_INPUT}
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    ${EMPTY}

Increment Number With Arrow Up
    [Documentation]    Verify number can be incremented with arrow up
    [Tags]    inputs    arrow_keys
    Input Text With Wait    ${NUMBER_INPUT}    5
    Press Keys    ${NUMBER_INPUT}    ARROW_UP
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    6

Decrement Number With Arrow Down
    [Documentation]    Verify number can be decremented with arrow down
    [Tags]    inputs    arrow_keys
    Input Text With Wait    ${NUMBER_INPUT}    10
    Press Keys    ${NUMBER_INPUT}    ARROW_DOWN
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    9

Multiple Arrow Up Presses
    [Documentation]    Verify multiple arrow up presses work
    [Tags]    inputs    arrow_keys
    Input Text With Wait    ${NUMBER_INPUT}    0
    Press Keys    ${NUMBER_INPUT}    ARROW_UP    ARROW_UP    ARROW_UP
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    3

Enter Zero
    [Documentation]    Verify zero can be entered
    [Tags]    inputs    entry
    Input Text With Wait    ${NUMBER_INPUT}    0
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    0

Enter Large Number
    [Documentation]    Verify large number can be entered
    [Tags]    inputs    entry
    Input Text With Wait    ${NUMBER_INPUT}    999999
    ${value}=    Get Value    ${NUMBER_INPUT}
    Should Be Equal    ${value}    999999

*** Keywords ***
Navigate To Inputs Page
    [Documentation]    Navigate to inputs page
    Go To    ${INPUTS_URL}
    Wait For Page Load

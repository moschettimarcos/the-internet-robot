*** Settings ***
Documentation     Test suite for Dropdown functionality
...               Tests dropdown selection and option handling

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Dropdown Page

*** Variables ***
${DROPDOWN}       id=dropdown

*** Test Cases ***
Select Option By Visible Text
    [Documentation]    Verify option can be selected by visible text
    [Tags]    dropdown    selection
    Select From List By Label    ${DROPDOWN}    Option 1
    ${selected}=    Get Selected List Label    ${DROPDOWN}
    Should Be Equal    ${selected}    Option 1

Select Option By Value
    [Documentation]    Verify option can be selected by value
    [Tags]    dropdown    selection
    Select From List By Value    ${DROPDOWN}    2
    ${selected}=    Get Selected List Label    ${DROPDOWN}
    Should Be Equal    ${selected}    Option 2

Select Option By Index
    [Documentation]    Verify option can be selected by index
    [Tags]    dropdown    selection
    Select From List By Index    ${DROPDOWN}    1
    ${selected}=    Get Selected List Label    ${DROPDOWN}
    Should Be Equal    ${selected}    Option 1

Verify Default Selection
    [Documentation]    Verify default option is selected
    [Tags]    dropdown    validation
    ${selected}=    Get Selected List Label    ${DROPDOWN}
    Should Be Equal    ${selected}    Please select an option

Get All Available Options
    [Documentation]    Verify all options can be retrieved
    [Tags]    dropdown    validation
    @{options}=    Get List Items    ${DROPDOWN}
    Should Contain    ${options}    Please select an option
    Should Contain    ${options}    Option 1
    Should Contain    ${options}    Option 2

*** Keywords ***
Navigate To Dropdown Page
    [Documentation]    Navigate to dropdown page
    Go To    ${DROPDOWN_URL}
    Wait For Page Load

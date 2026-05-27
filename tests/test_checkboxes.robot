*** Settings ***
Documentation     Test suite for Checkboxes functionality
...               Tests checkbox selection and deselection

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Checkboxes Page

*** Variables ***
${CHECKBOXES}     css=input[type='checkbox']

*** Test Cases ***
Select First Checkbox
    [Documentation]    Verify first checkbox can be selected
    [Tags]    checkboxes    selection
    ${checkbox1}=    Set Variable    xpath=(//input[@type='checkbox'])[1]
    Select Checkbox    ${checkbox1}
    Checkbox Should Be Selected    ${checkbox1}

Deselect First Checkbox
    [Documentation]    Verify first checkbox can be deselected
    [Tags]    checkboxes    selection
    ${checkbox1}=    Set Variable    xpath=(//input[@type='checkbox'])[1]
    Unselect Checkbox    ${checkbox1}
    Checkbox Should Not Be Selected    ${checkbox1}

Select Second Checkbox
    [Documentation]    Verify second checkbox can be selected
    [Tags]    checkboxes    selection
    ${checkbox2}=    Set Variable    xpath=(//input[@type='checkbox'])[2]
    Select Checkbox    ${checkbox2}
    Checkbox Should Be Selected    ${checkbox2}

Toggle Both Checkboxes
    [Documentation]    Verify both checkboxes can be toggled
    [Tags]    checkboxes    selection
    ${checkbox1}=    Set Variable    xpath=(//input[@type='checkbox'])[1]
    ${checkbox2}=    Set Variable    xpath=(//input[@type='checkbox'])[2]
    Select Checkbox    ${checkbox1}
    Select Checkbox    ${checkbox2}
    Checkbox Should Be Selected    ${checkbox1}
    Checkbox Should Be Selected    ${checkbox2}

Verify Two Checkboxes Exist
    [Documentation]    Verify page contains exactly two checkboxes
    [Tags]    checkboxes    validation
    ${checkbox_count}=    Get Element Count    ${CHECKBOXES}
    Should Be Equal As Numbers    ${checkbox_count}    2

*** Keywords ***
Navigate To Checkboxes Page
    [Documentation]    Navigate to checkboxes page
    Go To    ${CHECKBOXES_URL}
    Wait For Page Load

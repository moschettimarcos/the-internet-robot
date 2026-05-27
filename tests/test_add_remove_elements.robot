*** Settings ***
Documentation     Test suite for Add/Remove Elements functionality
...               Tests dynamic element addition and removal

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Add Remove Elements Page

*** Variables ***
${ADD_BUTTON}         css=button[onclick='addElement()']
${DELETE_BUTTON}      css=button[onclick='deleteElement()']

*** Test Cases ***
Add Single Element
    [Documentation]    Verify single element can be added
    [Tags]    add_remove    addition
    ${count_before}=    Get Element Count    ${DELETE_BUTTON}
    Click Element With Wait    ${ADD_BUTTON}
    ${count_after}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Numbers    ${count_after}    ${count_before + 1}

Add Multiple Elements
    [Documentation]    Verify multiple elements can be added
    [Tags]    add_remove    addition
    ${count_before}=    Get Element Count    ${DELETE_BUTTON}
    Click Element With Wait    ${ADD_BUTTON}
    Click Element With Wait    ${ADD_BUTTON}
    Click Element With Wait    ${ADD_BUTTON}
    ${count_after}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Numbers    ${count_after}    ${count_before + 3}

Remove Single Element
    [Documentation]    Verify single element can be removed
    [Tags]    add_remove    removal
    Click Element With Wait    ${ADD_BUTTON}
    ${count_before}=    Get Element Count    ${DELETE_BUTTON}
    Click Element With Wait    ${DELETE_BUTTON}
    ${count_after}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Numbers    ${count_after}    ${count_before - 1}

Remove All Elements
    [Documentation]    Verify all elements can be removed
    [Tags]    add_remove    removal
    Click Element With Wait    ${ADD_BUTTON}
    Click Element With Wait    ${ADD_BUTTON}
    Click Element With Wait    ${ADD_BUTTON}
    ${count}=    Get Element Count    ${DELETE_BUTTON}
    WHILE    ${count} > 0
        Click Element With Wait    ${DELETE_BUTTON}
        ${count}=    Get Element Count    ${DELETE_BUTTON}
    END
    ${final_count}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Numbers    ${final_count}    0

Verify No Elements Initially
    [Documentation]    Verify no delete buttons exist initially
    [Tags]    add_remove    validation
    ${count}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Numbers    ${count}    0

*** Keywords ***
Navigate To Add Remove Elements Page
    [Documentation]    Navigate to add/remove elements page
    Go To    ${ADD_REMOVE_URL}
    Wait For Page Load

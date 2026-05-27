*** Settings ***
Documentation     Common keywords and utilities for The Internet automation project
...               Reusable keywords for test automation

Library           SeleniumLibrary
Library           Collections
Library           String

Resource          config.robot

*** Keywords ***
Wait Until Element Is Visible And Enabled
    [Documentation]    Wait until element is both visible and enabled
    [Arguments]    ${locator}    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}

Wait For Page Load
    [Documentation]    Wait for page to fully load
    Wait For Condition    return document.readyState == "complete"    ${EXPLICIT_WAIT}

Get Element Text
    [Documentation]    Get text from element with error handling
    [Arguments]    ${locator}
    ${text}=    Get Text    ${locator}
    RETURN    ${text}

Click Element With Wait
    [Documentation]    Click element with explicit wait
    [Arguments]    ${locator}    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Element Is Visible And Enabled    ${locator}    ${timeout}
    Click Element    ${locator}

Input Text With Wait
    [Documentation]    Input text with explicit wait
    [Arguments]    ${locator}    ${text}    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Clear Element Text    ${locator}
    Input Text    ${locator}    ${text}

Verify Element Contains Text
    [Documentation]    Verify element contains expected text
    [Arguments]    ${locator}    ${expected_text}
    ${actual_text}=    Get Element Text    ${locator}
    Should Contain    ${actual_text}    ${expected_text}

Verify Element Is Visible
    [Documentation]    Verify element is visible
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}

Verify Element Is Not Visible
    [Documentation]    Verify element is not visible
    [Arguments]    ${locator}
    Element Should Not Be Visible    ${locator}

Verify Element Is Enabled
    [Documentation]    Verify element is enabled
    [Arguments]    ${locator}
    Element Should Be Enabled    ${locator}

Verify Element Is Disabled
    [Documentation]    Verify element is disabled
    [Arguments]    ${locator}
    Element Should Be Disabled    ${locator}

Get Current URL
    [Documentation]    Get current browser URL
    ${url}=    Get Location
    RETURN    ${url}

Verify URL Contains
    [Documentation]    Verify current URL contains expected text
    [Arguments]    ${expected_text}
    ${current_url}=    Get Current URL
    Should Contain    ${current_url}    ${expected_text}

Scroll To Element
    [Documentation]    Scroll to element
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute JavaScript    arguments[0].scrollIntoView(true);    ${element}

Wait For Alert And Accept
    [Documentation]    Wait for alert and accept it
    [Arguments]    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Keyword Succeeds    ${timeout}    1s    Alert Should Be Present
    Handle Alert    ACCEPT

Wait For Alert And Dismiss
    [Documentation]    Wait for alert and dismiss it
    [Arguments]    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Keyword Succeeds    ${timeout}    1s    Alert Should Be Present
    Handle Alert    DISMISS

Get Alert Text
    [Documentation]    Get text from alert
    [Arguments]    ${timeout}=${EXPLICIT_WAIT}
    Wait Until Keyword Succeeds    ${timeout}    1s    Alert Should Be Present
    ${text}=    Handle Alert    LEAVE
    RETURN    ${text}

Switch To Frame By Index
    [Documentation]    Switch to frame by index
    [Arguments]    ${index}
    Select Frame    index=${index}

Switch To Default Content
    [Documentation]    Switch back to default content
    Unselect Frame

Execute JavaScript With Return
    [Documentation]    Execute JavaScript and return result
    [Arguments]    ${script}
    ${result}=    Execute JavaScript    ${script}
    RETURN    ${result}

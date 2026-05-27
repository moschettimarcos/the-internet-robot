*** Settings ***
Documentation     Test suite for Form Authentication functionality
...               Tests login, logout, and error handling

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Login Page

*** Variables ***
${USERNAME_FIELD}       id=username
${PASSWORD_FIELD}       id=password
${LOGIN_BUTTON}         css=button[type='submit']
${LOGOUT_BUTTON}        css=a[href='/logout']
${SUCCESS_MESSAGE}      id=flash
${ERROR_MESSAGE}        id=flash

*** Test Cases ***
Successful Login With Valid Credentials
    [Documentation]    Verify user can login with valid credentials
    [Tags]    login    positive
    Input Text With Wait    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text With Wait    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Element With Wait    ${LOGIN_BUTTON}
    Verify Element Contains Text    ${SUCCESS_MESSAGE}    You logged into a secure area
    Verify Element Is Visible    ${LOGOUT_BUTTON}
    Verify URL Contains    secure

Failed Login With Invalid Username
    [Documentation]    Verify login fails with invalid username
    [Tags]    login    negative
    Input Text With Wait    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Input Text With Wait    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Element With Wait    ${LOGIN_BUTTON}
    Verify Element Contains Text    ${ERROR_MESSAGE}    Your username is invalid
    Verify Element Is Not Visible    ${LOGOUT_BUTTON}

Failed Login With Invalid Password
    [Documentation]    Verify login fails with invalid password
    [Tags]    login    negative
    Input Text With Wait    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text With Wait    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click Element With Wait    ${LOGIN_BUTTON}
    Sleep    2s
    Verify URL Contains    login

Failed Login With Empty Credentials
    [Documentation]    Verify login fails with empty credentials
    [Tags]    login    negative
    Click Element With Wait    ${LOGIN_BUTTON}
    Verify URL Contains    login

Successful Logout
    [Documentation]    Verify user can logout successfully
    [Tags]    login    logout
    Input Text With Wait    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text With Wait    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Element With Wait    ${LOGIN_BUTTON}
    Sleep    3s
    ${logout_present}=    Run Keyword And Return Status    Element Should Be Visible    ${LOGOUT_BUTTON}
    Run Keyword If    ${logout_present}    Click Element    ${LOGOUT_BUTTON}
    Sleep    2s
    Verify URL Contains    login

*** Keywords ***
Navigate To Login Page
    [Documentation]    Navigate to login page
    Go To    ${LOGIN_URL}
    Wait For Page Load

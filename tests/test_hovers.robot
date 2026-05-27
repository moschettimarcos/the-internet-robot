*** Settings ***
Documentation     Test suite for Hovers functionality
...               Tests hover interactions and caption display

Library           SeleniumLibrary
Resource          ../resources/config.robot
Resource          ../resources/common_keywords.robot

Suite Setup       Open Browser To Base URL
Suite Teardown    Close Browser Session
Test Setup        Navigate To Hovers Page

*** Variables ***
${AVATAR_1}           xpath=(//div[@class='figure'])[1]
${AVATAR_2}           xpath=(//div[@class='figure'])[2]
${AVATAR_3}           xpath=(//div[@class='figure'])[3]
${CAPTION_1}          xpath=(//div[@class='figure'])[1]//div[@class='figcaption']
${CAPTION_2}          xpath=(//div[@class='figure'])[2]//div[@class='figcaption']
${CAPTION_3}          xpath=(//div[@class='figure'])[3]//div[@class='figcaption']
${USER_NAME_1}        xpath=(//div[@class='figure'])[1]//h5
${USER_NAME_2}        xpath=(//div[@class='figure'])[2]//h5
${USER_NAME_3}        xpath=(//div[@class='figure'])[3]//h5
${PROFILE_LINK_1}     xpath=(//div[@class='figure'])[1]//a

*** Test Cases ***
Hover Over First Avatar
    [Documentation]    Verify caption appears when hovering over first avatar
    [Tags]    hovers    caption
    ${avatar}=    Get WebElement    ${AVATAR_1}
    Mouse Over    ${avatar}
    Sleep    1s
    Element Should Be Visible    ${CAPTION_1}

Hover Over Second Avatar
    [Documentation]    Verify caption appears when hovering over second avatar
    [Tags]    hovers    caption
    ${avatar}=    Get WebElement    ${AVATAR_2}
    Mouse Over    ${avatar}
    Sleep    1s
    Element Should Be Visible    ${CAPTION_2}

Hover Over Third Avatar
    [Documentation]    Verify caption appears when hovering over third avatar
    [Tags]    hovers    caption
    ${avatar}=    Get WebElement    ${AVATAR_3}
    Mouse Over    ${avatar}
    Sleep    1s
    Element Should Be Visible    ${CAPTION_3}

Verify User Name For First Avatar
    [Documentation]    Verify correct user name for first avatar
    [Tags]    hovers    user_name
    ${avatar}=    Get WebElement    ${AVATAR_1}
    Mouse Over    ${avatar}
    Sleep    1s
    ${user_name}=    Get Text    ${USER_NAME_1}
    Should Be Equal    ${user_name}    name: user1

Verify User Name For Second Avatar
    [Documentation]    Verify correct user name for second avatar
    [Tags]    hovers    user_name
    ${avatar}=    Get WebElement    ${AVATAR_2}
    Mouse Over    ${avatar}
    Sleep    1s
    ${user_name}=    Get Text    ${USER_NAME_2}
    Should Be Equal    ${user_name}    name: user2

Verify User Name For Third Avatar
    [Documentation]    Verify correct user name for third avatar
    [Tags]    hovers    user_name
    ${avatar}=    Get WebElement    ${AVATAR_3}
    Mouse Over    ${avatar}
    Sleep    1s
    ${user_name}=    Get Text    ${USER_NAME_3}
    Should Be Equal    ${user_name}    name: user3

Verify Profile Link Exists
    [Documentation]    Verify profile link exists in caption
    [Tags]    hovers    profile_link
    ${avatar}=    Get WebElement    ${AVATAR_1}
    Mouse Over    ${avatar}
    Sleep    1s
    Element Should Be Visible    ${PROFILE_LINK_1}

Verify Three Avatars Exist
    [Documentation]    Verify page contains exactly three avatars
    [Tags]    hovers    validation
    ${avatar_count}=    Get Element Count    css=.figure
    Should Be Equal As Numbers    ${avatar_count}    3

*** Keywords ***
Navigate To Hovers Page
    [Documentation]    Navigate to hovers page
    Go To    ${HOVERS_URL}
    Wait For Page Load

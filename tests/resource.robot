*** Settings ***
Library     SeleniumLibrary


*** Variables ***
# server
${SERVER}           www.saucedemo.com
${BROWSER}          Firefox
${DELAY}            0

# users
${STD USER}         standard_user
${LO USER}          locked_out_user
${PB USER}          problem_user
${PG USER}          performance_glitch_user
${PASSWORD}         secret_sauce

# pages
${LOGIN}            https://${SERVER}/
${INVENTORY}        https://${SERVER}/inventory.html
${CART}             https://${SERVER}/cart.html
${CHECK-OUT1}       https://${SERVER}/checkout-step-one.html
${CHECK-OUT2}       https://${SERVER}/checkout-step-two.html
${COMPLETE}       https://${SERVER}/checkout-complete.html


*** Keywords ***
Open Browser To "${page}" Page
    Open Browser    ${page}    ${BROWSER}
    Set Selenium Speed    ${DELAY}
    "${LOGIN}" Page Should Be Open

Go To "${page}" Page
    Go To    ${page}
    "${page}" Page Should Be Open

"${page}" Page Should Be Open
    Location Should Be    ${page}

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login-button

User "${username}" logs in
    Input Username    ${username}
    Input password    ${PASSWORD}
    Submit Credentials

"${user}" Is Logged In
    User "${user}" logs in
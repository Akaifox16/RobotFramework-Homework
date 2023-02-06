*** Settings ***
Resource            resource.robot

Test Teardown       Close Browser


*** Test Cases ***
Standard User Login
    Given browser is opened to login page
    When user "${STD USER}" logs in
    Then "${INVENTORY}" page should be open

Locked Out User Login
    Given browser is opened to login page
    When user "${LO USER}" logs in
    Then page should contain error user already logged out

Problem User Login
    Given browser is opened to login page
    When user "${PB USER}" logs in
    Then "${INVENTORY}" page should be open

Performance Glitch User Login
    Given browser is opened to login page
    When user "${PG USER}" logs in
    Then "${INVENTORY}" page should be open


*** Keywords ***
Browser Is Opened To Login Page
    Open Browser To "${LOGIN}" Page

Page should contain error user already logged out
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

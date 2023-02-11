*** Settings ***
Resource            checkout.resource.robot

Test Teardown       Close Browser


*** Test Cases ***
Should Be Able To Cancel Checkout 1 Step For Problem User
    Given browser is opened to checkout 1 page with ${PB USER}
    When click cancel button
    Then should back to cart page

Should Error If Not Provide First Name For Problem User
    Given browser is opened to checkout 1 page with ${PB USER}
    When click continue button
    Then page should show first name required

Should Error If Not Provide Last Name For Problem User
    Given browser is opened to checkout 1 page with ${PB USER}
    When input information to ${FIRST_NAME}
    And click continue button
    Then page should show last name required

Should Not Be Able To Fill Last Name For Problem User
    Given browser is opened to checkout 1 page with ${PB USER}
    When input information to ${FIRST_NAME}
    And input information to ${LAST_NAME}
    And click continue button
    Then page should show last name required

Should Be Able To Complete Information For Problem User
    Given browser is opened to checkout 2 page with ${PB USER}
    When click finish button
    Then should checkout order successfully

Should Be Able To Cancel Checkout 2 Step For Problem User
    Given browser is opened to checkout 2 page with ${PB USER}
    When click cancel button
    Then should back to inventory page

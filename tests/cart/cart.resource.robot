*** Settings ***
Resource    ../resource.robot
Library     SeleniumLibrary


*** Variables ***
&{BUTTON}
...    backpack=sauce-labs-backpack
...    bike=sauce-labs-bike-light
...    bolt=sauce-labs-bolt-t-shirt
...    jacket=sauce-labs-fleece-jacket
...    onesie=sauce-labs-onesie
...    t-shirt=test.allthethings()-t-shirt-(red)


*** Keywords ***
Browser Is Opened To Inventory Page
    Open Browser To "${INVENTORY}" Page

Browser Is Opened To Cart Page
    Open Browser To "${CART}" Page

Click Cart Button
    Click Button    shopping_cart_link
    "${CART}" Page Should Be Open

Click Checkout Button
    Click Button    checkout
    "${CHECK-OUT1}" Page Should Be Open

Click Continue Button
    Click Button    continue

Click All Add To Cart Buttons
    FOR    ${key}    IN    @{BUTTON}
        Click Button    add-to-cart-${BUTTON}[${key}] 
    END

Click All Remove Buttons
    FOR    ${key}    IN    @{BUTTON}
       Click Button    remove-${BUTTON}[${key}] 
    END

Cart Should Be Empty
    Wait Until Element Is Visible    xpath=//*[@id="shopping_cart_container"]/a
    ${child_elements}=    Get WebElements    xpath=//*[@id="shopping_cart_container"]/a/*
    Should Be Empty    ${child_elements}

Cart Should Contain ${amount} items
    Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='${amount}']

Page Should Show Required Input Error Message
    Page Should Contain    is required
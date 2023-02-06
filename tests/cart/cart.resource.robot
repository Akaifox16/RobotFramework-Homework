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
    Click Link    //a[@class="shopping_cart_link"]
    "${CART}" Page Should Be Open

Click Checkout Button
    Click Button    checkout
    "${CHECK-OUT1}" Page Should Be Open

Click Continue Button
    Click Button    continue

Click Add To Cart ${item}
    Click Button    add-to-cart-${item}

Click Remove ${item}
    Click Button    remove-${item}

Click All Add To Cart Buttons
    FOR    ${key}    IN    @{BUTTON}
        Click Add To Cart ${BUTTON}[${key}]
    END

Click All Remove Buttons
    FOR    ${key}    IN    @{BUTTON}
        Click Remove ${BUTTON}[${key}]
    END

Cart Should Be Empty
    Wait Until Element Is Visible    xpath=//*[@id="shopping_cart_container"]/a
    ${child_elements}=    Get WebElements    xpath=//*[@id="shopping_cart_container"]/a/*
    Should Be Empty    ${child_elements}

Cart Should Contain ${amount} items
    Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='${amount}']

Cart Should Contain Backpack
    Wait Until Element Is Visible    xpath=//*[@id="item_4_title_link"]/div
    Element Text Should Be    xpath=//*[@id="item_4_title_link"]/div    Sauce Labs Backpack

Cart Should Contains All Inventories
    Element Text Should Be    xpath=//*[@id="item_4_title_link"]/div    Sauce Labs Backpack
    Element Text Should Be    xpath=//*[@id="item_0_title_link"]/div    Sauce Labs Bike Light
    Element Text Should Be    xpath=//*[@id="item_1_title_link"]/div    Sauce Labs Bolt T-Shirt
    Element Text Should Be    xpath=//*[@id="item_5_title_link"]/div    Sauce Labs Fleece Jacket
    Element Text Should Be    xpath=//*[@id="item_2_title_link"]/div    Sauce Labs Onesie
    Element Text Should Be    xpath=//*[@id="item_3_title_link"]/div    Test.allTheThings() T-Shirt (Red)

Page Should Show Required Input Error Message
    Page Should Contain    is required
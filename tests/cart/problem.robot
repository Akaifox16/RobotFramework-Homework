*** Settings ***
Resource  cart.resource.robot
Test Teardown  Close Browser

*** Test Cases ***
Problem User Login
   Given browser is opened to inventory page
    And "${STD USER}" is logged in
   When user "${PB USER}" logs in
   Then "${INVENTORY}" page should be open
   Click Button    add-to-cart-sauce-labs-backpack
   Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='1']
   Click Button    add-to-cart-sauce-labs-bike-light
   Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='2']
   Click Button    add-to-cart-sauce-labs-bolt-t-shirt
   Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='3']
   Click Button    add-to-cart-sauce-labs-fleece-jacket
   Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='4']
   Click Button    add-to-cart-sauce-labs-onesie
   Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='5']
   Click Button    add-to-cart-test.allthethings()-t-shirt-(red)
   Page Should Contain Element    xpath=//a[@class='shopping_cart_link']/span[text()='6']

Problem User Check if added item are in the checkout page correctly
    Given Browser Is Opened To Inventory Page
    And "${STD USER}" is logged in
   When user "${PB USER}" logs in
   Then "${INVENTORY}" page should be open
    Click Button    add-to-cart-sauce-labs-backpack
    Go To "${CART}" Page
    Wait Until Element Is Visible    xpath=//*[@id="item_4_title_link"]/div
    Element Text Should Be    xpath=//*[@id="item_4_title_link"]/div    Sauce Labs Backpack
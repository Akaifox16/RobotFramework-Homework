*** Settings ***
Resource            cart.resource.robot

Test Teardown       Close Browser


*** Test Cases ***
Check if Standard User add item and cart icon display correctly
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click all add to cart buttons
    Then cart should contain 6 items

Check cart item display of last item removed
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click all add to cart buttons
    And click all remove buttons
    Then cart should be empty

Checkout button check
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click cart button
    And click checkout button
    Then "${CHECK-OUT1}" page should be open

Checkout step one Input
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click cart button
    And click checkout button
    And click continue button
    Then page should show required input error message

Check if added item are in the checkout page correctly
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When user "${STD USER}" logs in
    Then "${INVENTORY}" page should be open
    Click Button    add-to-cart-sauce-labs-backpack
    Go To "${CART}" Page
    Wait Until Element Is Visible    xpath=//*[@id="item_4_title_link"]/div
    Element Text Should Be    xpath=//*[@id="item_4_title_link"]/div    Sauce Labs Backpack

#    s!!!!!!!!น่าจะต้องแก้ ไม่ค่อยเวิร์ค

Check an check out page when added all item
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When user "${STD USER}" logs in
    Then "${INVENTORY}" page should be open
    Click Button    add-to-cart-sauce-labs-backpack
    Click Button    add-to-cart-sauce-labs-bike-light
    Click Button    add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    add-to-cart-sauce-labs-fleece-jacket
    Click Button    add-to-cart-sauce-labs-onesie
    Click Button    add-to-cart-test.allthethings()-t-shirt-(red)
    Go To "${CART}" Page
    Element Text Should Be    xpath=//*[@id="item_4_title_link"]/div    Sauce Labs Backpack
    Element Text Should Be    xpath=//*[@id="item_0_title_link"]/div    Sauce Labs Bike Light
    Element Text Should Be    xpath=//*[@id="item_1_title_link"]/div    Sauce Labs Bolt T-Shirt
    Element Text Should Be    xpath=//*[@id="item_5_title_link"]/div    Sauce Labs Fleece Jacket
    Element Text Should Be    xpath=//*[@id="item_2_title_link"]/div    Sauce Labs Onesie
    Element Text Should Be    xpath=//*[@id="item_3_title_link"]/div    Test.allTheThings() T-Shirt (Red)

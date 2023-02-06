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

# Checkout button check
#     Given browser is opened to inventory page
#     And "${STD USER}" is logged in
#     When click cart button
#     And click checkout button
#     Then "${CHECK-OUT1}" page should be open

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
    When click add to cart ${BUTTON}[backpack]
    And click cart button
    Then cart should contain backpack
#    s!!!!!!!!น่าจะต้องแก้ ไม่ค่อยเวิร์ค

Check an check out page when added all item
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click all add to cart buttons
    And click cart button
    Then cart should contains all inventories

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

Check if added item are in the checkout page correctly
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click add to cart ${BUTTON}[backpack]
    And click cart button
    Then cart should contain backpack

Check an check out page when added all item
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When click all add to cart buttons
    And click cart button
    Then cart should contains all inventories

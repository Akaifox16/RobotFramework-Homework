*** Settings ***
Resource  cart.resource.robot
Test Teardown  Close Browser

*** Test Cases ***
Problem User Check if click all add to cart buttons functionality
   Given browser is opened to inventory page
   And "${PB USER}" is logged in
   When click all add to cart buttons
   Then cart should contain 3 items
   

Problem User Check if added item are in the checkout page correctly
    Given browser is opened to inventory page
    And "${PB USER}" is logged in
    When click add to cart ${BUTTON}[backpack]
    And click cart button
    Then cart should contain backpack
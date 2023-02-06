*** Settings ***
Resource            filter.resource.robot

Test Teardown       Close Browser


*** Test Cases ***
Standard User Filter A-Z
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When filter list by a-z
    Then "${BACKPACK}" should be first element of inventory container

Standard User Filter Z-A
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When filter list by z-a
    Then "${TSHIRT}" should be first element of inventory container

Standard User Filter Lo-Hi
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When filter list by lo-hi
    Then "${ONESIE}" should be first element of inventory container

Standard User Filter Hi-Lo
    Given browser is opened to inventory page
    And "${STD USER}" is logged in
    When filter list by hi-lo
    Then "${JACKET}" should be first element of inventory container

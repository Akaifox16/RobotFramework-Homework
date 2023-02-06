*** Settings ***
Resource        filter.resource.robot
Resource        ../resource.robot
Test Teardown   Close Browser

*** Test Cases ***
Problem User Filter A-Z
  Given browser is opened to inventory page
  And "${PB USER}" is logged in 
  When filter list by a-z
  Then "${BACKPACK}" should be first element of inventory container

Problem User Filter Z-A
  Given browser is opened to inventory page
  And "${PB USER}" is logged in 
  When filter list by z-a
  Then "${BACKPACK}" should be first element of inventory container

Problem User Filter Lo-Hi
  Given browser is opened to inventory page
  And "${PB USER}" is logged in 
  When filter list by lo-hi
  Then "${BACKPACK}" should be first element of inventory container

Problem User Filter Hi-Lo
  Given browser is opened to inventory page
  And "${PB USER}" is logged in 
  When filter list by hi-lo
  Then "${BACKPACK}" should be first element of inventory container


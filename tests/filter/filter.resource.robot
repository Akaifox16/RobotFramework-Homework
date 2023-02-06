*** Settings ***
Resource    ../resource.robot
Library     SeleniumLibrary


*** Variables ***
# filter options
@{OPTIONS}      az    za    lohi    hilo
${BACKPACK}     Sauce Labs Backpack
${TSHIRT}       Test.allTheThings() T-Shirt (Red)
${ONESIE}       Sauce Labs Onesie
${JACKET}       Sauce Labs Fleece Jacket


*** Keywords ***
Browser Is Opened To Inventory Page
    Open Browser To "${INVENTORY}" Page

Filter List By "${options}"
    Select From List By Value    //select[@class="product_sort_container"]    ${options}

Filter List By A-Z
    Filter List By "${OPTIONS[0]}"

Filter List By Z-A
    Filter List By "${OPTIONS[1]}"

Filter List By Lo-Hi
    Filter List By "${OPTIONS[2]}"

Filter List By Hi-Lo
    Filter List By "${OPTIONS[3]}"

"${element}" Should Be First Element Of Inventory Container
    Element Text Should Be    xpath=/html/body/div/div/div/div[2]/div/div/div/div[1]/div[2]/div[1]/a/div    ${element}

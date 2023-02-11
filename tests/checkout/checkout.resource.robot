*** Settings ***
Resource    ../resource.robot


*** Variables ***
${INFO}             infomation
${FIRST_NAME}       firstName
${LAST_NAME}        lastName
${POSTAL_CODE}      postalCode


*** Keywords ***
Browser Is Opened To Checkout 1 Page with ${user}
    Open Browser To "${INVENTORY}" Page
    "${user}" Is Logged In
    Go To "${CHECK-OUT1}" Page

Browser Is Opened To Checkout 2 Page with ${user}
    Open Browser To "${INVENTORY}" Page
    "${user}" Is Logged In
    Go To "${CHECK-OUT2}" Page

Click Continue Button
    Click Element   //input[@name="continue"]

Click Cancel Button
    Click Button    //button[@name="cancel"]

Click Finish Button
    Click Button    //button[@name="finish"]

Input Information To ${element}
    Input Text    //input[@name="${element}"]    ${INFO}

Fill In Information For Delivery
    Input Information To ${FIRST_NAME}
    Input Information To ${LAST_NAME}
    Input Information To ${POSTAL_CODE}

Page Should Show "${input}" Required
    Page Should Contain   ${input}  is required

Page Should Show First Name Required
    Page Should Show "First Name" Required
    
Page Should Show Last Name Required
    Page Should Show "Last Name" Required

Page Should Show Postal Code Required
    Page Should Show "Postal Code" Required

# Last Name Input Text Should Not Existed
#     Element Text Should Be    //input[@name="${LAST_NAME}"]    ""

Should Checkout Order Successfully
    "${COMPLETE}" Page Should Be Open

Should Go to Checkout 2 Page
    "${CHECK-OUT2}" Page Should Be Open
  
Should Back To Cart Page
    "${CART}" Page Should Be Open
Should Back To Inventory Page
    "${INVENTORY}" Page Should Be Open
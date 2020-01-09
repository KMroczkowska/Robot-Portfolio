*** Settings ***
Suite Setup       Open Browser to Bug Reporting Page
Suite Teardown    Close Browser
Test Template     Report With Invalid Data Should Fail
Resource    ../Login/Resource.txt
Library    SeleniumLibrary 

*** Test Cases ***
No Email    ${Empty}    ${Topic}    ${Text}
No Topic    ${Email}    ${Empty}    ${Text}
No Text    ${Empty}     ${Topic}    ${Empty}
No Email and Topic    ${Empty}    ${Empty}    ${Text}
No Email and Text    ${Empty}    ${Topic}    ${Empty}
No Topic and Text    ${Email}    ${Empty}    ${Empty}   
Invalid Email    ${InvalidEmail}   ${Topic}    ${Text}
    

*** Keywords ***
 
Open Browser to Bug Reporting Page
    Open Browser    ${LOGIN URL}        ${Default_Browser}    
    Click Element  //a[@class='freshwidget-theme']
    
Report With Invalid Data Should Fail
    [Arguments]    ${Email}    ${Topic}    ${Text}    
    Input Email    ${Email}
    Input Topic    ${Topic}
    Input Message    ${Text}
    Click Element    id=helpdesk_ticket_submit    
    Unselect Frame
    Element Should Be Visible    freshwidget-frame    
    
Input Email
    [Arguments]    ${Email}
    Select Frame    freshwidget-frame
    Sleep    2  
    Input Text    id=helpdesk_ticket_email    ${Email}
    
Input Topic
    [Arguments]   ${Topic}
    Input Text    id=helpdesk_ticket_subject    ${Topic}
    
Input Message
    [Arguments]    ${Text}
    Input Text    class=redactor_editor    ${Text} 
           
      
     
    
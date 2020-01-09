*** Settings ***
Suite Setup    Create and Edit a Sample Project
Suite Teardown    Close Browser
Test Template    Adding a Note Should Be Successful
Library    SeleniumLibrary    
Resource    ../Login/Resource.txt
    
*** Test Cases ***
Text   ${AnyValue} 
    

*** Keywords ***
Create and Edit a Sample Project
    Begin the Project and Create a New Client
    Input Text    //input[@name='datestart']    2019-09-28 22:30
    Press Keys    None    ESC
    Input Text    //input[@name='datefinish']    2019-09-28 22:35
    Press Keys    None    ESC
    Input Text    xpath=//textarea[2]    Tlumaczenie
    Input Text    name=returnmean    ${AnyValue}
    Wait Until Element Is Visible    //button[@id='saveorderbutton']    None    None           
    Click Element    //button[@id='saveorderbutton']
    
Adding a Note Should Be Successful
    [Arguments]   ${Comment}  
    Click Element    name=comment    
    Input Text    name=comment    ${Comment}
    Click Element    id=comment-add
    Page Should Contain    Napisa    None          
    

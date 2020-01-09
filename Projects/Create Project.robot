*** Settings ***
Suite Setup    Begin the Project and Create a New Client
Suite Teardown    Close Browser
Test Template    Creating Project With Empty Data should Fail
Library    SeleniumLibrary    
Resource    ../Login/Resource.txt

*** Test Cases ***
Empty StartDate    ${Empty}    ${Service}
Epmty Service    ${StartDate}    ${Empty}
    # Open Browser to Login Page
    # LoginKW
    # Press Keys    None    ENTER
    # Click Element    //a[contains(text(),'Projekty')]
    # Click Element    //button[contains(.,'Nowy projekt')]
    # Click Element    //button[contains(.,'Nowy klient')]
    # Wait Until Page Contains Element    //input[@name='businessname']    
    # Input Text    //input[@name='businessname']    Grazyna
    # Input Text    //input[@id='contactperson']    Grazyna
    # Click Element    id=quick-client-add-save 
    # Wait Until Page Contains Element    //input[@id='client']       
    # Input Text    //input[@id='client']   Grazyna  
    # Input Text    //input[@name='datestart']    2019-09-28 22:30
    # Press Keys    None    ESC
    # Input Text    //input[@name='datefinish']    2019-09-28 22:35
    # Press Keys    None    ESC
    # Input Text    xpath=//textarea[2]    Tlumaczenie
    # Input Text    name=returnmean    BlaBla
    # Wait Until Element Is Visible    //button[@id='saveorderbutton']    None    None           
    # Click Element    //button[@id='saveorderbutton']      
    
                  
            
   
*** Keywords ***
Creating Project With Empty Data should Fail
    [Arguments]    ${StartDate}    ${Service}
    Input StartDate    ${StartDate}
    Sleep    2
    Input Service    ${Service}
    Sleep    2
    Wait Until Element Is Visible    //button[@id='saveorderbutton']    None    None           
    Sleep    2
    Click Element    //button[@id='saveorderbutton']
    Press Keys    None    ESC
    Title Should Be    Mantreo | Nowy projekt    None    

Input StartDate
    [Arguments]    ${StartDate}
    Input Text    //input[@name='datestart']    ${StartDate}
    Press Keys    None    ESC

Input Service
    [Arguments]    ${Service}
    Input Text    xpath=//textarea[2]    ${Service}

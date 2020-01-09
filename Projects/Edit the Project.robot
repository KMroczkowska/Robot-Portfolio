*** Settings ***
Suite Teardown    Close Browser
Library    SeleniumLibrary    
Resource    ../Login/Resource.txt

*** Test Cases ***
Editting the project
    Begin the Project and Create a New Client
    Input Text    //input[@name='datestart']    2019-09-28 22:30
    Press Keys    None    ESC
    Input Text    //input[@name='datefinish']    2019-09-28 22:35
    Press Keys    None    ESC
    Input Text    xpath=//textarea[2]    Tlumaczenie
    Input Text    name=returnmean    ${AnyValue}
    Wait Until Element Is Visible    //button[@id='saveorderbutton']    None    None           
    Click Element    //button[@id='saveorderbutton'] 
    Click Element    //td[@id='external_number']    
    Input Text    name=value    SIULA 
    Press Keys    None    ENTER
    Wait Until Element Is Visible    id=subject        
    Double Click Element    id=subject
    Press Keys    None    CONTROL+a
    Press Keys    None    BACKSPACE      
    Press Keys    None    A+B+C+D+E+F
    Click Element    //button[contains(text(),'Zapisz')]       
    Wait Until Element Is Visible    id=returnmean    
    Double Click Element    id=returnmean    
    Input Text    name=value    ${AnyValue}
    Click Element    //button[contains(text(),'Zapisz')]    
    Wait Until Element Is Visible    id=scope    
    Double Click Element    id=scope          
    Input Text    name=value    ${AnyValue}    
    Wait Until Element Is Visible    //button[contains(text(),'Zapisz')]        
    Click Element    //button[contains(text(),'Zapisz')]
    Wait Until Element Is Visible    id=description    
    Double Click Element    id=description    
    Input Text    name=value    ${AnyValue}
    Click Element    //button[contains(text(),'Zapisz')]
    Wait Until Element Is Visible    id=datestart    
    Double Click Element    id=datestart
    Press Keys    None    CONTROL+a
    Press Keys    None    BACKSPACE
    Input Text    name=value    2019-09-28 22:30
    Press Keys    None    ENTER
    Wait Until Element Is Visible    id=datefinish
    Double Click Element    id=datefinish
    Press Keys    None    CONTROL+a
    Press Keys    None    BACKSPACE
    Input Text    name=value    2019-09-30 22:30
    Press Keys    None    ENTER 
    Wait Until Element Is Visible    id=workdays  
    Double Click Element    id=workdays
    Press Keys    None    2
    Press Keys    None    ENTER
    Wait Until Element Is Visible    id=qtoo
    Click Element    id=qtoo 
    Wait Until Element Is Visible    id=qtoo-save-button
    Click Element    id=qtoo-save-button
    Wait Until Element Is Not Visible    id=qtoo            
    Element Should Not Be Visible    id=qtoo          
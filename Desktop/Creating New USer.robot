*** Settings ***
Library    SeleniumLibrary
Resource    ../Login/Resource.txt
Suite Teardown    Close Browser

*** Test Cases ***
Flow
    ${quickmail} =    Get QuickMail
    Open Browser to Login Page
    LoginKW
    Press Keys    None    ENTER
    Click Element    //a[contains(text(),'ytkownicy')]
    Click Element    //button[contains(text(),'ytkownika')]
    Input Text    name=login    Ja
    Input Text    Name=name    Ja
    Input Text    name=password    Ja   
    Input Text    name=mail    ${quickmail}    
    
    Click Element    //button[@class='button save']
    Sleep    5
    Click Element    //button[@id='delete-user']
    Input Text    //input[@id='user-deletion-confirmation-box']    usuwam
    Press Keys    None    Enter

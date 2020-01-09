*** Settings ***
Suite Teardown    Close Browser
Resource    ../Login/Resource.txt
Library    SeleniumLibrary


*** Test Cases ***
Creating Price list
    Open Browser to Login Page
    LoginKW
    Submit Credentials
    Modify Price List
    Price List Should Be Saved    
    
*** Keywords ***
Price List Should Be Saved    
    Wait Until Element Is Not Visible    id=button-save    
    Element Should Not Be Visible    id=button-save    
       
   
    
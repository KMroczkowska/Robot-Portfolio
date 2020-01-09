*** Settings ***
Suite Setup       Open Browser And Modify Price List
Suite Teardown    Close Browser
Test Template     Saving price list with invalid data should fail
Resource    ../Login/Resource.txt
Library    SeleniumLibrary

*** Test Cases ***
Empty Values    False    False     False    ${Empty}    ${Empty}    
Empty Service    False   True    True    ${Characters}    ${Price} 
# Empty Service/From    False    False    True   ${Characters}    ${Price} 
# Empty Service/From/To     False    False    False    ${Characters}    ${Price}
# Empty Service/From/To/Char  False     False    False    ${Empty}    ${Price}      
# Empty Service/To    False    True    False    ${Characters}     ${Price}
# Empty Service/To/Char    False    True    False    ${Empty}    ${Price}
# Empty Service/To/Char/Price    False    True    False    ${Empty}    ${Empty} 
# Empty Service/Char    False    True    True    ${Empty}    ${Price}
# Empty Service/Char/Price     False    True    True    ${Empty}    ${Empty}    
# Emoty Service/Char/Price/From    False    False     True    ${Empty}    ${Empty}
# Empty From Language    True    False    True    True    ${Characters}    ${Price}
# Empty From/To    True    False    False   ${Characters}    ${Price}  
# Empty From/To/Char   True    False    False    ${Empty}    ${Price} 
# Empty From/To/Char/Price   True    False     False    ${Empty}    ${Empty}   
# Empty From/Service/To   False    False    False     ${Characters}    ${Price}   
# Empty From/Service/To/Char    False    False     False    ${Empty}    ${Price}
# Empty From/Char    True    False    True    ${Empty}    ${Price}
# Empty From/Char/Price    True    False    True    ${Empty}    ${Empty}     
# Empty To/Service    False    True    False    ${Characters}    ${Price} 
# Empty To/Service/Char    False    True    False    ${Empty}    ${Price}
# Empty To/Service/Char/Price    False    True     False    ${Empty}    ${Empty}
# Empty To/Char    True    True    False    ${Empty}    ${Price}
# Empty To/Char/Price    True    True    False    ${Empty}    ${Empty}
# Empty To/Char/Price/Service    False    True    False    ${Empty}    ${Empty}
# Empty To/Price    True    True    False    ${Characters}    ${Empty}
# Empty To/Price/Service    False    True    False    ${Characters}    ${Empty}
# Empty Characters    True    True    True    ${Empty}    ${Price}
# Empty Char/Service    False    True    True    ${Empty}    ${Price}    
# Empty Char/Service/To    False    True    False    ${Empty}   ${Price}
# Empty Char/Service/To/From    False    False    False    False    ${Price}
# Empty Char/To    True    True    False    ${Empty}    ${Price}
# Empty Char/To/From    True    False    False    ${Empty}    ${Price}    
# Empty Price    False    False     False    ${Empty}    ${Price}
# Empty Price/Service    False    True    True    ${Characters}    ${Empty}
# Empty Price/Service/From    False    False    True    ${Charaters}    ${Empty}
# Empty Price/Service/From/To    False    False    False    ${Characters}    ${Empty}
# Empty Price/From    True    False   True    ${Characters}    ${Empty}
# Empty Price/From/To    True    False    False    ${Characters}    ${Empty}
# Empty Price/From/To/Service    False    False     False    ${Characters}    ${Empty}
# Empty Price/To    True    True    False    ${Characters}    ${Empty}
# Empty Price/To/Service    False    True    False    ${Characters}    ${Empty}
    
        


*** Keywords ***
Open Browser And Modify Price List
    Open Browser to Login Page
    LoginKW
    Press Keys    id=password   ENTER
    Click Element    //button[@onclick="location.href='/company/prices/'"]    
    
    
  
    
Saving price list with invalid data should fail
    [Arguments]    ${SelectServiceType}    ${FromLanguage}    ${ToLanguage}    ${Characters}    ${Price}              
    Press Keys    None    ESC
    Wait Until Element Is Visible    //button[contains(.,'Dodaj')]    
    Click Element    //button[contains(.,'Dodaj')]    
    Run Keyword If  ${SelectServiceType}    Input Service Type    
    Run Keyword if  ${FromLanguage}    Input From Language
    Run Keyword If    ${ToLanguage}    Input To Language    
    Input Characters    ${Characters}   
    Input Price    ${Price}
    Wait Until Element Is Visible    id=button-save    
    Click Element    id=button-save    
    Wait Until Element Is Not Visible    id=button-save       
    Wait Until Element Is Visible    class=button save      
    Press Keys    None    ESC
    
       
    
    
Input Service Type
    Wait Until Element Is Visible    id=rate_service_id_chzn   
    Click Element    id=rate_service_id_chzn     
    Press Keys    None     ARROW_DOWN
    Repeat Keyword    3    Press Keys    None     ARROW_DOWN
    Press Keys    None    ENTER
    
Input From Language
    Wait Until Element Is Visible    id=language_chzn    
    Click Element    id=language_chzn 
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER
    
Input To Language
    Wait Until Element Is Visible    id=tolanguage_chzn    
    Click Element    id=tolanguage_chzn  
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER
    
Input Characters
    [Arguments]    ${Characters}
    Wait Until Element Is Visible    id=perpage    
    Click Element    id=perpage 
    Input Text    id=perpage    ${Characters}
    Press Keys    None    ENTER
    
Input Price
    [Arguments]    ${Price}
    Click Element    id=price1
    Input Text    id=price1    ${Price} 
    
    
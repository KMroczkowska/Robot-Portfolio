***Settings***
Suite Setup       Open Browser to Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          Resource.txt
Library    SeleniumLibrary 

*** Test Cases ***
Invalid Company Name    invalid    ${Username}    ${Password}
Invalid Username    ${Company Name}    invalid    ${Password}
Invalid Password    ${Company Name}    ${Username}    invalid    
Invalid Company Name and Username    invalid    whatever   ${Password} 
Invalid Company Name and Password     invalid    ${Username}   whatever
Invalid Username and Password    ${Company Name}    invalid    whatever
Empty Company Name    ${Empty}    ${Username}    ${Password}
Empty Username    ${Company Name}    ${Empty}    ${Password}
Empty Password    ${Company Name}    ${Username}    ${Empty}
Empty Username and Password    ${Company Name}    ${Empty}    ${Empty}    
Empty Username and Company Name    ${Empty}    ${Empty}    ${Password}
Empty Company Name and Password    ${Empty}    ${Username}    ${Empty}
Empty Company Name and Username and Password    ${Empty}    ${Empty}    ${Empty}  
           
***Keywords***
Login with invalid credentials should fail
    [Arguments]    ${Company Name}    ${Username}    ${Password}
    Input Company Name    ${Company Name}
    Input Username     ${Username}
    Input Password Field     ${Password}  
    Submit Credentials
    Login Should Have Failed  
    
Login Should Have Failed
    Location Should Be    ${ERROR URL} 
    



        
***Settings***
Suite Setup       Log In and Modify Personal Data
Suite Teardown    Close Browser         
Test Setup        Login Page Should be Open
Test Template     Phone number with invalid data should not be approved
Resource    ../Login/Resource.txt
Library    SeleniumLibrary 

***Test Cases***
Number with letters    123asd
Number with special marks    50@076511
Number with spaces    601 977 533
Number too short    786
Number too long    7000867333543

***Keywords***
Log in and Modify Personal Data
    Open Browser    ${LOGIN URL}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Input Company Name    ${Company Name}
    Input Username     ${Username}
    Input Password Field     ${Password}
    Press Keys    None    ENTER
    Click Image    //img[@class='avatar']    
    Click Link    //a[text() = ' Moje dane'] 
    
    
    
Data should not be approved
    Location Should Be    ${ERROR URL}
    

Phone number with invalid data should not be approved  
    [Arguments]    ${Phone number}
    Input Phone Number    ${Phone number}
    Press Keys    None       ENTER
    Sleep    3       
             
    
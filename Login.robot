*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Resource          Resource.robot
Resource          Library.robot

*** Variables ***
${DELAY}          0
${SERVER}         http://10.32.86.132:8080/    # Backend
${User_Name}      FC750
${User_Password}    0406
${ID_User_Name}    textfield-1011-inputEl
${ID_User_Password}    textfield-1012-inputEl
${Submit_Button}    button-1014-btnIconEl

*** Keywords ***
Open Browser to Login Page
    Open Browser    ${SERVER}    ${G_BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Username
    Input Text    username    ${User_Name}
    #Input Text    ${ID_User_Name}    ${User_Name}

Input Password
    Input Text    password    ${User_Password}
    #Input Text    ${ID_User_Password}    ${User_Name}

Submit Credentials
    Click Element    ${Submit_Button}

Open Browser and Login Automatically
    Open Browser to Login Page
    Wait Until Element Is Visible    ${ID_User_Name}    ${G_Wait_For_Element_Timeout}
    Input Username
    Input Password
    Submit Credentials

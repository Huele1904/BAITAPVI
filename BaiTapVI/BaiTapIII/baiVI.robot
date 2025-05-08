*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}     Chrome

${VALID_USER}      Admin
${VALID_PASS}      admin123

${INVALID_USER}    wronguser
${INVALID_PASS}    wrongpass

*** Test Cases ***
Hue - Login With Valid Credentials
    Login To OrangeHRM    ${VALID_USER}    ${VALID_PASS}
    Wait Until Location Contains    /dashboard    timeout=10s
    Wait Until Page Contains    Dashboard
    Close Browser

Hue - Login With Invalid Credentials
    Login To OrangeHRM    ${INVALID_USER}    ${INVALID_PASS}
    Wait Until Page Contains    Invalid credentials
    Close Browser

*** Keywords ***
Login To OrangeHRM
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    //input[@name='username']    timeout=10s
    Input Text    //input[@name='username']    ${username}
    Input Text    //input[@name='password']    ${password}
    Click Element    //button[@type='submit']

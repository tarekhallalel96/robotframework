*** Settings ***

Library    ../.venv/Lib/site-packages/SeleniumLibrary/__init__.py
Resource    ../Pages/login.resource

Test Template    Login Avec Cridentials Corrects

*** Test Cases ***

Login Avec Cridentials Corrects    standard_user       secret_sauce
Login Avec Cridentials Corrects    problem_user       secret_sauce
Login Avec Cridentials Corrects    visual_user       secret_sauce


*** Keywords ***

Login Avec Cridentials Corrects
    [Documentation]    Login avec credentials Corrects
    [Tags]    @regresssion @smoke
    [Arguments]    ${username}    ${password}
    Open Browser    https://www.saucedemo.com/    Chrome
    Saisir Username     ${username}
    Saisir Password     ${password}    
    Click Login
    #Wait Until Element Is Visible    css:.title    timeout=5s
    ${txt}    Get Text    css:.title
    Should Be Equal As Strings    ${txt}    Products
    [Teardown]    Close Browser

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}      headlesschrome

*** Test Cases ***
Open chrome
    Open web browser
Sign up
    Fill name    Tester    Robot
    Fill address    Texas
    Fill zipcode    12345
    Press sign up
    [Teardown]    Close Browser

*** Keywords ***
Open web browser
    Open Browser    https://www.kimschiller.com/page-object-pattern-tutorial/   browser=${BROWSER}
    Set Window Size    1600    900
    Maximize Browser Window
Fill name
    [Arguments]   ${firstname}    ${lastname}
    Input Text    id:firstname    ${firstname}
    Input Text    id:lastname     ${lastname}
Fill address
    [Arguments]   ${address}
    Input Text    id:address    ${address}
Fill zipcode
    [Arguments]   ${zipcode}
    Input Text    id:zipcode    ${zipcode}
Press sign up
    Click Element    id:signup
    Wait Until Element Contains    xpath:/html/body/h1    Thank you!    5000
    Element Should Contain    xpath:/html/body/h1    Thank you!

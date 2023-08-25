*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Disabled Registration
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    options=${options}
    Go To    http://127.0.0.1:7000/
    Set Window Size    974    1040
    Click Element    css=.hero__button
    Input Text    id=sign-up__first-name    Nikita
    Input Text    id=sign-up__last-name    Avram
    Input Text    id=sign-up__password    gdfhderfh
    Click Element    css=.form__button
    ${feedback}    Get Text    css=.form__row:nth-child(4) > .form__feedback
    Should Be Equal As Strings    ${feedback}    Enter a valid email
    [Teardown]    Close All Browsers

Login
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    options=${options}
    Go To    http://127.0.0.1:7000/
    Set Window Size    974    1040
    Wait Until Element Is Visible    link=Sign in
    Click Element    link=Sign in

    Wait Until Element Is Visible    id=sign-in__email
    Input Text    id=sign-in__email    ano4824avr@gmail.com

    Wait Until Element Is Visible    id=sign-in__password
    Input Password    id=sign-in__password    password1234

    Wait Until Element Is Visible    css=.form__button
    Click Element    css=.form__button

    Wait Until Page Contains    Home | Universe    timeout=10s

Successful Add Blog Post
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    options=${options}
    Go To    http://127.0.0.1:7000/
    Set Window Size    974    1040
    Wait Until Element Is Visible    link=Sign in
    Click Element    link=Sign in

    Wait Until Element Is Visible    id=sign-in__email
    Input Text    id=sign-in__email    ano4824avr@gmail.com

    Wait Until Element Is Visible    id=sign-in__password
    Input Password    id=sign-in__password    password1234

    Wait Until Element Is Visible    css=.form__button
    Click Element    css=.form__button

    Wait Until Element Is Visible    link=Read more
    Click Element    link=Read more

    Wait Until Element Is Visible    css=.comment-form__textarea
    Input Text    css=.comment-form__textarea    new comment

    Wait Until Element Is Visible    css=.comment-form__button:nth-child(1)
    Click Element    css=.comment-form__button:nth-child(1)

Successful Add Comment
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    options=${options}
    Go To    http://127.0.0.1:7000/
    Set Window Size    974    1040
    Wait Until Page Contains Element    link=Sign in
    Click Element    link=Sign in

    Wait Until Page Contains Element    id=sign-in__email
    Input Text    id=sign-in__email    ano4824avr@gmail.com

    Wait Until Page Contains Element    id=sign-in__password
    Input Password    id=sign-in__password    password1234

    Wait Until Page Contains Element    css=.form__button
    Click Element    css=.form__button

    Wait Until Page Contains Element    link=New post    timeout=10s
    Click Element    link=New post

Successful Registration
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    options=${options}
    Go To    http://127.0.0.1:7000/
    Set Window Size    974    1040

    Click Element    css=.hero__button

    Input Text    id=sign-up__first-name    Nikita
    Input Text    id=sign-up__last-name    Avram
    Input Text    id=sign-up__email    ano4824avr@gmail@gmail.com

    Input Password    id=sign-up__password    password1234
    Input Password    id=sign-up__confirm-password    password1234

    Click Element    css=.form__button

    Click Element    css=.alert__button

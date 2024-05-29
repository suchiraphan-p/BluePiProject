*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://abhigyank.github.io/To-Do-List/
${BROWSER}        Chrome

*** Keywords ***
Open To-Do List Application
    [Documentation]    Open the To-Do List application in the specified browser.
    Open Browser    ${URL}    ${BROWSER}

Add Task To To-Do List
    [Documentation]    Add a task to the to-do list.
    [Arguments]    ${task}
    Input Text    id=new-task    ${task}
    Click Element    css=.mdl-button
    Click Link    xpath=//a[@href='#todo']
    Element Should Contain    xpath=//*[@id="text-1"]    ${task}

Complete Task
    [Documentation]    Click the checkbox for the task to complete it.
    [Arguments]    ${task}
    Click Element    xpath=//*[@id="text-1"]
    Click Link    xpath=//a[@href='#completed']
    Element Should Contain    xpath=//*[@id="completed-tasks"]/li/span/i    done
    Element Should Contain    xpath=//*[@id="completed-tasks"]/li[1]/span    ${task}

Delete Task From To-Do List
    [Documentation]    Delete a task from the To-Do List.
    [Arguments]    ${task}
    Click Element    css=.delete
    Element Should Not Be Visible    xpath=//*[@id="completed-tasks"]/li/span/i[contains(text(), '${task}')]

Delete Task From Completed List
    [Documentation]    Delete a task from the Completed List.
    [Arguments]    ${task}
    Click Element    xpath=//button[contains(text(),'Delete')]
    Element Should Not Be Visible    xpath=//*[@id="completed-tasks"]/li[1]/span[contains(text(), '${task}')]

Close Application
    [Documentation]    Close the browser.
    Close Browser
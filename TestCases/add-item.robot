*** Settings ***
Resource          ../Resources/shared.resource
Test Setup        Open To-Do List Application
Test Teardown    Close Application

*** Variables ***
${task_1}      Complete Task A
${task_2}      Complete Task B

*** Test Cases ***
Add, Complete, and Delete Task From Completed List
    [Documentation]    Add a task to the to-do list, mark it as completed, and then delete it from the Completed List.
    Add Task To To-Do List    ${task_1}
    Complete Task   ${task_1}
    Delete Task From Completed List    ${task_1}

Add and Delete Task From To-Do List
    [Documentation]    Add a task to the to-do list and then delete it.
    Add Task To To-Do List    ${task_2}
    Delete Task From To-Do List    ${task_2}


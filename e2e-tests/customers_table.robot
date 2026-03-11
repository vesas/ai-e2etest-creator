*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${BASE_URL}    ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${BASE_URL}       http://localhost:3000
${BROWSER}        chrome

*** Test Cases ***

Table Is Displayed On Main Page
    [Documentation]    The customers table is visible when the app loads
    Table Should Be Visible

Table Has All Required Columns
    [Documentation]    The table contains all columns defined in the specification
    Table Header Should Contain    ID
    Table Header Should Contain    Name
    Table Header Should Contain    Email
    Table Header Should Contain    Phone
    Table Header Should Contain    Status
    Table Header Should Contain    Created At

Table Contains Customers
    [Documentation]    The table lists customers (at least one row)
    ${rows}=    Get Element Count    css:.customers-table tbody tr
    Should Be True    ${rows} > 0

Customers Are Sorted By ID In Ascending Order
    [Documentation]    Customers are sorted by ID ascending by default
    ${ids}=    Create List
    ${rows}=    Get Element Count    css:.customers-table tbody tr
    FOR    ${i}    IN RANGE    1    ${rows + 1}
        ${id}=    Get Text    css:.customers-table tbody tr:nth-child(${i}) td:nth-child(1)
        Append To List    ${ids}    ${id}
    END
    ${sorted}=    Copy List    ${ids}
    Sort List    ${sorted}
    Lists Should Be Equal    ${ids}    ${sorted}

Each Customer Row Has All Column Values
    [Documentation]    Every customer row has non-empty values for all columns
    ${rows}=    Get Element Count    css:.customers-table tbody tr
    FOR    ${i}    IN RANGE    1    ${rows + 1}
        FOR    ${col}    IN RANGE    1    7
            ${value}=    Get Text    css:.customers-table tbody tr:nth-child(${i}) td:nth-child(${col})
            Should Not Be Empty    ${value}
        END
    END

Customer Status Values Are Valid
    [Documentation]    Each customer status is either Active or Inactive
    ${rows}=    Get Element Count    css:.customers-table tbody tr
    FOR    ${i}    IN RANGE    1    ${rows + 1}
        ${status}=    Get Text    css:.customers-table tbody tr:nth-child(${i}) td:nth-child(5)
        Should Match Regexp    ${status}    ^(Active|Inactive)$
    END

*** Keywords ***

Table Should Be Visible
    Element Should Be Visible    css:.customers-table

Table Header Should Contain
    [Arguments]    ${column_name}
    Element Should Contain    css:.customers-table thead    ${column_name}

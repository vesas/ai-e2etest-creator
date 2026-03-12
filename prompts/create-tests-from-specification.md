# Prompt: Create E2E Tests From Specification

Use this prompt with Claude Code (or any AI assistant) when you have a new feature
specification and want to generate a Robot Framework E2E test file from scratch.

## How to Use

1. Add a new specification file under `specifications/` describing the feature.
2. (Optional) Read the relevant React component under `src/` to discover CSS class
   names and DOM structure that the tests will target.
3. Paste the prompt below — filling in the placeholders — and send it to the AI.

---

## Prompt Template

```
I have a new specification file at `specifications/<filename>.md`.

Please read it and generate a Robot Framework E2E test file at
`e2e-tests/<feature_name>.robot` that:

- Uses SeleniumLibrary throughout (no Browser library).
- Opens the app with Suite Setup / closes with Suite Teardown, following the same
  pattern as `e2e-tests/customers_table.robot`:
    Suite Setup     Open Browser    ${BASE_URL}    ${BROWSER}
    Suite Teardown  Close Browser
- Declares these default variables:
    ${BASE_URL}    http://localhost:3000
    ${BROWSER}     chrome
- Covers every behaviour and constraint stated in the specification — one focused
  test case per behaviour.
- Uses descriptive test case names written as plain English sentences.
- Adds a [Documentation] tag to each test case summarising what it verifies.
- Targets elements via CSS selectors (css:.<class-name>) derived from the React
  component. Read `src/<ComponentName>.js` to find the correct class names and
  DOM structure before writing any selectors.
- Extracts any repeated interaction or assertion into a reusable Keyword in the
  *** Keywords *** section.
- Does NOT import any extra libraries beyond SeleniumLibrary.
- Does NOT add test cases for behaviours not mentioned in the specification.

After writing the file, list any assumptions you made (e.g. inferred CSS class
names or element structure) so I can verify them against the actual component.
```

---

## Tips

- **CSS class names**: always read the React component source first so the selectors
  match what is actually rendered. A mismatched class name is the most common cause
  of failures.
- **Column indices**: Robot `nth-child` selectors are 1-based. Double-check the
  column order in the `<thead>` against the specification.
- **Sorting / ordering tests**: collect all values from the column, then compare the
  list with its sorted copy (`Sort List` + `Lists Should Be Equal`).
- **Valid-value tests**: use `Should Match Regexp` with an anchored pattern
  (e.g. `^(Active|Inactive)$`) rather than hard-coding a single expected value.
- **Running the new tests**:
  ```bash
  npm start                          # keep running in a separate terminal
  robot e2e-tests/<feature_name>.robot
  ```

---

## Example Session

Suppose you have added `specifications/orders-table.md` describing an Orders table
with columns Order ID, Customer, Amount, Status (Pending/Shipped/Delivered), and
that the table is sorted by Order ID ascending.

Send this to the AI:

```
I have a new specification file at `specifications/orders-table.md`.

Please read it and generate a Robot Framework E2E test file at
`e2e-tests/orders_table.robot` that: [... rest of template above ...]
```

The AI will read the spec, read the React component for CSS class names, then
produce a `.robot` file with test cases such as:

- Table Is Displayed On Main Page
- Table Has All Required Columns
- Table Contains Orders
- Orders Are Sorted By Order ID In Ascending Order
- Each Order Row Has All Column Values
- Order Status Values Are Valid

# E2E-testcreator

This project shows how AI can help with test automation.

It creates E2E tests for a React app from plain-language specifications written by people. The tests are saved as normal Robot Framework files, so they can be reviewed and run like any other test code.

The CI/CD pipeline can be Jenkins or any other tool.

The React app looks like this. The tests check what is shown in the UI based on the specification.

![Customers table](docs/customers-table.png)

## React App

```bash
npm start   # dev server at http://localhost:3000
npm test    # run tests
```

## E2E Tests

```bash
pip install -r e2e-tests/requirements.txt  # one-time setup
npm start                                   # run app in separate terminal
python -m robot e2e-tests/customers_table.robot
```

## Creating a New Test Suite from a Specification

When you add a new feature specification, AI can generate a full Robot Framework
test file for you.

1. **Add a specification file** under `specifications/` describing the feature —
   columns, behavior, limits, valid values, and so on.

2. **Use the prompt** in `prompts/create-tests-from-specification.md` — fill in the
   file names and send it to Claude Code (or any AI assistant). It will read the
   specification, look at the React component source for CSS class names, and
   generate a complete `.robot` file in `e2e-tests/`.

3. **Verify the output** — the AI will list any assumptions it made (e.g. inferred
   CSS selectors) so you can check them against the actual component before
   running the tests.

4. **Run the new tests**:
   ```bash
   npm start                              # keep running in a separate terminal
   python -m robot e2e-tests/<name>.robot
   ```

## Handling Specification Changes

When a feature branch changes the specification, the E2E tests need to be updated
to match. This workflow uses AI to speed it up:

1. **Create a feature branch** with your specification change (see branch `featurex` as an
   example — it adds a `Country` column to `specifications/items-table.md`).

2. **Generate the diff** from `main` to see what the feature branch changed:
   ```bash
   git diff main..featurex -- specifications/
   ```

3. **Use the prompt** in `prompts/update-tests-from-diff.md` — paste the diff into
   the prompt template and send it to Claude Code (or any AI assistant). It will
   update `e2e-tests/customers_table.robot` to cover the new columns, remove
   old checks, and fix column index selectors automatically.

This keeps tests in sync with the specification with less manual editing.

## AI Tools

Claude Code CLI is a good fit for this kind of work.

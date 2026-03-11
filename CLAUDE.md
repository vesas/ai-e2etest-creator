# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
npm start         # Dev server at http://localhost:3000
npm test          # Run tests in watch mode
npm test -- --watchAll=false  # Run tests once (CI mode)
npm test -- --testPathPattern=App  # Run a single test file
npm run build     # Production build
```

## E2E Tests

Tests are in `e2e-tests/` and use Robot Framework with SeleniumLibrary.

```bash
pip install -r e2e-tests/requirements.txt  # one-time setup
npm start                                   # run app in separate terminal
robot e2e-tests/customers_table.robot      # run all E2E tests
```

Tests run against `http://localhost:3000` with Chrome by default. Override with variables:
```bash
robot --variable BASE_URL:http://localhost:3000 --variable BROWSER:firefox e2e-tests/customers_table.robot
```

## Architecture

This is a React 19 app bootstrapped with Create React App. The project name is `ai-testcases`, an AI-powered E2E test case generator from human-written specifications in `specifications/`.

- `src/index.js` — entry point, renders `<App>` into the DOM
- `src/App.js` — root component, renders `<CustomersTable>`
- `src/CustomersTable.js` — displays the customers table with static sample data
- Tests use `@testing-library/react` with Jest (via `react-scripts test`)
- ESLint config extends `react-app` and `react-app/jest`

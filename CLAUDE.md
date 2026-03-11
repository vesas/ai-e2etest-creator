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

## Architecture

This is a React 19 app bootstrapped with Create React App. The project name is `ai-testcases`, suggesting it will be an AI-powered test case generator/manager.

- `src/index.js` — entry point, renders `<App>` into the DOM
- `src/App.js` — root component (currently default CRA template)
- Tests use `@testing-library/react` with Jest (via `react-scripts test`)
- ESLint config extends `react-app` and `react-app/jest`

# agent-testcreator

Creating E2E test cases for React app with AI from human written specifications.

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

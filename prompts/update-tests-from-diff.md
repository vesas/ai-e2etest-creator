# Prompt: Update E2E Tests Based on Specification Changes

Use this prompt with Claude Code (or any AI assistant) when a feature branch
introduces specification changes that the E2E tests need to reflect.

## How to Use

1. Stay on the `main` branch.
2. Run the following command to see what the feature branch changed in the specification:

   ```bash
   git diff main..featurex -- specifications/
   ```

3. Paste the diff output into the prompt below and send it to the AI.

---

## Prompt Template

```
The following diff shows changes made to the feature specification compared to main:

<paste git diff output here>

The current E2E tests are in `e2e-tests/customers_table.robot`.

Please update the Robot Framework test file so that:
- Any new columns or fields added in the specification are covered by the existing
  column-header and row-value tests.
- Any removed columns are no longer tested.
- The column index used in CSS nth-child selectors is updated to match the new
  column order if columns were added or moved.
- All other tests remain unchanged.

Only modify what is necessary to reflect the specification diff.
```

---

## Example Session

```bash
# On the main branch:
git diff main..featurex -- specifications/

# Sample output (featurex branch adds Country column):
# -  - **Created At** - Date the customer was created
# +  - **Created At** - Date the customer was created
# +  - **Country** - Country where the customer is located

# Paste that diff into the prompt above and let the AI update the robot file.
```

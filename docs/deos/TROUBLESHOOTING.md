# Troubleshooting

## Purpose

This document defines the canonical troubleshooting flow for DEOS ruleset/check enforcement problems.

---

## Problem: Check stuck on “Expected — Waiting for status to be reported”

### Root cause
Usually one of:

1. required check name does not exactly match the emitted check
2. required check source does not exactly match the emitted source
3. PR has not been freshly re-evaluated after a ruleset change

### Verification steps

1. Open the PR Checks tab
2. Record the exact emitted check names
3. Record the exact source for each check
4. Open the ruleset
5. Compare the ruleset entries against:
   - exact name
   - exact source

### Corrective action

Remove any invalid required checks such as:

- `ci`
- `codeql`
- `trivy`

Retain only the canonical required checks:

- `ci / validate-files` → GitHub Actions
- `Code scanning results / CodeQL` → GitHub Advanced Security
- `Code scanning results / Trivy` → GitHub Advanced Security
- `semgrep` → GitHub Actions
- `readiness-check` → GitHub Actions

Then trigger fresh evaluation by:

1. updating the branch
2. rebasing the branch
3. or closing/reopening the PR

---

## Problem: A required check never appears

### Root cause
Possible causes:

1. workflow did not run
2. workflow trigger conditions were not met
3. emitted check name differs from assumption
4. scan results are surfaced through a different source than expected

### Verification steps

1. Confirm workflow run exists in Actions
2. Confirm workflow completed
3. Confirm check appears in PR Checks tab
4. Confirm exact check name and source
5. Confirm ruleset uses those exact values

### Failure checkpoint

If the workflow ran but the check never appears on the PR, the system is still broken.

---

## Problem: Duplicate checks appear

### Root cause
Usually old invalid required checks remain in the ruleset while canonical checks were added later.

### Corrective action

Remove stale entries and leave only the canonical required checks.

### Failure checkpoint

If both old and new names appear in enforcement expectations, ruleset cleanup is incomplete.

---

## Problem: Wrong source configured

### Root cause
GitHub requires not just the correct check name, but also the correct source.

### Corrective action

Use these exact mappings:

- `ci / validate-files` → GitHub Actions
- `Code scanning results / CodeQL` → GitHub Advanced Security
- `Code scanning results / Trivy` → GitHub Advanced Security
- `semgrep` → GitHub Actions
- `readiness-check` → GitHub Actions

### Failure checkpoint

If the name matches but the source does not, the check will remain blocked or expected.

---

## Problem: PR still blocked after ruleset fix

### Root cause
The PR may still be using stale evaluation state.

### Corrective action

Trigger a fresh evaluation:

1. Update branch
2. Rebase branch
3. Close and reopen PR

### Verification

Expected passing checks:

- `ci / validate-files`
- `Code scanning results / CodeQL`
- `Code scanning results / Trivy`
- `semgrep`
- `readiness-check`

Expected merge state:

- merge button enabled

---

## Escalation Rule

Only consider workflow renaming if all of the following are true:

1. ruleset names exactly match emitted checks
2. ruleset sources exactly match emitted sources
3. PR has been freshly re-evaluated
4. mismatch still persists

Until then, treat this as a ruleset/check synchronization issue, not a workflow naming redesign issue.
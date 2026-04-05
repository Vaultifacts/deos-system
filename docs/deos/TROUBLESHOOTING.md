# DEOS Troubleshooting

## 1. PR shows `Expected — Waiting for status to be reported`

### Most likely causes
- required check name mismatch
- wrong source selected for required check
- ruleset changed after PR creation and PR has not rerun
- stale required checks remain in ruleset

### Investigation steps
1. Open PR checks list
2. Record actual check names exactly
3. Record source/integration if visible
4. Compare to ruleset required checks
5. Update ruleset if mismatch exists
6. Trigger fresh PR evaluation if needed

### Do not do first
- do not immediately rename workflows
- do not assume YAML is wrong
- do not add duplicate required checks

## 2. VSCode says workflow YAML is broken but GitHub runs it
This can be caused by stale editor diagnostics or extension behavior.

### Rule
If:
- file on disk is valid
- GitHub Actions runs successfully

then GitHub is the execution truth.

## 3. CodeQL/Trivy names do not match workflow filenames
This is expected when results are surfaced through code scanning / GitHub Advanced Security.

### Rule
Use the actual PR-emitted check names in the ruleset.

## 4. Dependabot label warning appears
Cause:
- `dependabot.yml` references a label that does not exist

### Fix
Either:
- create the missing label
- or remove/replace the label in `dependabot.yml`

## 5. Workflow exists but does not block merge
Possible causes:
- not listed as required in ruleset
- wrong source selected
- check name mismatch
- check did not run on PR head commit

## 6. Project state drifts from issue state
Cause:
- manual updates inconsistent
- no project automation configured for that field
- assumptions based on labels instead of verified project fields

### Rule
When issue and project disagree, reconcile immediately.

## 7. Branch protection blocks everything
Likely causes:
- non-existent required checks
- review requirements enabled accidentally
- stale checks left in ruleset

## 8. Future assistant drift
If a future assistant proposes changing DEOS:
1. read all files in `docs/deos/`
2. inspect actual GitHub runtime state
3. distinguish architecture from configuration bugs
4. avoid redesign unless the current system is proven structurally wrong
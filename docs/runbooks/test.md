# Testing Runbook

## Objective
Use machine-verifiable evidence to validate progress.

## Minimum local validation
Run, as applicable:
- markdown and file integrity checks
- CI workflow validation by pushing a branch
- manual review of workflow logs

## GitHub validation layers
- CI
- CodeQL
- Semgrep
- Trivy
- Dependabot
- Readiness checks

## Validation policy
- No issue may be treated as done without evidence.
- Evidence must be visible in either:
  - worklog
  - PR checks
  - issue comments
  - workflow results

## Failure triage
When a check fails:
1. Identify the failing layer.
2. Reproduce if possible.
3. Open or update the GitHub issue.
4. Record the failure in docs/worklog.md.
5. Fix, rerun, and verify.

## Failure checkpoints
- Check failed but no issue exists.
- Evidence exists only in chat.
- Scanner findings are ignored without disposition.
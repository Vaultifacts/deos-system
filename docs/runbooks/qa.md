# QA Runbook

## Objective
Ensure every defect follows a deterministic lifecycle.

## QA lifecycle
1. Discovered
2. Reproduced
3. Diagnosed
4. Fix In Progress
5. Verified
6. Closed

## Required issue data
- Observed behavior
- Expected behavior
- Exact reproduction steps
- Severity
- Evidence
- Verification plan

## Launch-blocker criteria
Use a launch blocker for:
- security-critical issues
- broken core workflow
- broken release flow
- broken verification flow
- data loss or integrity risk

## Verification rule
A QA issue is not complete until:
- the fix exists
- relevant checks pass
- evidence is recorded

## Failure checkpoints
- QA failures are logged informally
- launch blockers are not labeled clearly
- issues close without reproduction or verification
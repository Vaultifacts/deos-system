# DEOS Rollout and Review

## Purpose
DEOS must be reviewed after implementation to ensure the live system matches the intended design.

## Review windows

### Review 1 — immediate post-implementation
Confirm:
- workflows run
- code scanning is active
- labels exist
- milestones exist
- project exists
- branch ruleset exists
- PR gating functions

### Review 2 — after next real PR
Confirm:
- required checks appear correctly
- no stale `Expected` checks remain
- merge is correctly gated
- project and issue states stay aligned

### Review 3 — after 7 days
Confirm:
- no drift between GitHub and repo docs
- no repeated manual fixes needed
- Dependabot behavior is acceptable
- issue lifecycle is consistently followed

## Success criteria
DEOS is considered healthy if:
- GitHub checks are deterministic
- merges are gated correctly
- issue lifecycle is stable
- launch readiness is represented explicitly
- repo docs remain current

## Failure indicators
DEOS is unhealthy if:
- check names constantly require manual debugging
- labels drift or are misused
- project state is ignored
- required checks are bypassed
- conversation becomes the de facto source of truth again

## Change management rule
Any structural change to DEOS must:
1. be documented in repo docs
2. be justified by evidence
3. be merged through the same protected flow as any other change
# DEOS Operating Model

## Daily flow
A normal work cycle follows this order:

1. Identify or create a GitHub issue
2. Confirm labels, milestone, and project placement
3. Read repo truth files
4. Implement on a non-main branch
5. Open a PR
6. Let checks run
7. Resolve findings
8. Merge only if all required checks pass
9. Update worklog and readiness state if relevant

## Start-of-session procedure
Before meaningful work:
1. Read `docs/worklog.md`
2. Read `docs/launch-readiness.md`
3. Read `docs/state.md`
4. Identify active issue or PR
5. Confirm branch and current repo status

## End-of-session procedure
Before stopping:
1. Update `docs/worklog.md`
2. Confirm GitHub state matches reality
3. Confirm blockers are reflected in issues
4. Confirm next steps are explicit

## Definition of done
A unit of work is done only when:
- implementation exists
- relevant checks pass
- issue or PR state reflects completion
- evidence exists in GitHub and/or repo docs

## Definition of verified
A unit of work is verified when:
- machine checks passed where applicable
- required review/gates passed
- no conflicting state remains in issue/project labels or fields

## Launch readiness model
Launch readiness is computed from:
- issue labels and milestones
- required checks
- launch readiness document
- open launch blockers
- open P0 items

It is not inferred from sentiment or memory.

## Solo workflow assumptions
DEOS is configured for a solo operator:
- required approvals = 0
- PR required before merge
- no team review requirements
- no Code Owners requirement
- conversation resolution still enforced

## Allowed exceptions
Exceptions must be explicit and temporary.
If a check or rule is waived, the waiver must be recorded in GitHub or repo docs.

## Anti-patterns
The following are not allowed:
- tracking work only in chat
- using generic labels instead of DEOS labels
- merging to `main` outside the ruleset path
- claiming verification without evidence
- using repo docs as a substitute for GitHub issues
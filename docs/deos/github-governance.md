# DEOS GitHub Governance

## Labels

### Type labels
- `deos:type:feature`
- `deos:type:bug`
- `deos:type:qa`
- `deos:type:launch-blocker`

### Priority labels
- `deos:priority:p0`
- `deos:priority:p1`
- `deos:priority:p2`

### State labels
- `deos:state:triage`
- `deos:state:in-progress`
- `deos:state:awaiting-verification`
- `deos:state:verified`

### Source labels
- `deos:source:manual`
- `deos:source:ci`
- `deos:source:e2e`
- `deos:source:scanner`

## Milestones
- `DEOS: Launch Readiness`
- `DEOS: v1.0`
- `DEOS: Post Launch`

## Project
Primary project:
- `DEOS — Shadow`

## Project intent
This project is the GitHub-side operational board for DEOS.

## Issue templates
Supported templates:
- Feature
- Bug
- Launch Blocker
- QA Failure

## PR template
The PR template enforces:
- linked issue
- classification
- evidence
- rollback note
- failure checkpoints

## Dependabot
Dependabot is enabled.

### Important note
If `dependabot.yml` references labels that do not exist, Dependabot comments will warn and label application will fail.
Keep `dependabot.yml` aligned with real labels.

## Branch governance
`main` is protected by ruleset, not informal convention.

### Ruleset intent
- PR required
- required checks must pass
- branch up-to-date required
- conversation resolution required
- force pushes blocked
- deletions restricted

### Solo-specific settings
- approvals required = 0
- no team review requirement
- no Code Owners requirement
- no approval-of-most-recent-push requirement

## Governance principle
GitHub configuration must reflect actual reported checks, not assumed check names.
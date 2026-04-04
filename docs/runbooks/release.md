# Release Runbook

## Objective
Release only when launch readiness is computed and verifiable.

## Pre-release gate
Confirm all are true:
- No open `deos:type:launch-blocker`
- No open `deos:priority:p0` in `DEOS: Launch Readiness`
- Required checks are green
- docs/launch-readiness.md is current
- Rollback path exists

## Release procedure
1. Review the launch readiness document.
2. Review open issues for the launch milestone.
3. Review workflow results.
4. Confirm rollback path.
5. Tag or release only if all gates are green.

## Rollback procedure
1. Stop forward changes.
2. Identify the failing release state.
3. Revert or patch the release.
4. Reopen related issues.
5. Record the event in worklog and GitHub.

## Failure checkpoints
- Release proceeds with unresolved blockers.
- Rollback steps are undefined.
- Release evidence is missing.
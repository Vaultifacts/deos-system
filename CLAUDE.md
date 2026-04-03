# DEOS Project Operating Rules

## System model
- GitHub is the live execution source of truth.
- Repo-local files are the technical and operational source of truth for Claude.
- No live project state belongs outside GitHub and this repository.
- If work exists, it must map to a GitHub issue.
- If something is not verified, it is not done.

## Required startup behavior
At the beginning of meaningful work, read:
- docs/worklog.md
- docs/launch-readiness.md
- docs/state.md

## Required response structure
When reporting meaningful technical progress, use:
- Classification
- Root cause
- Evidence
- Copy/paste steps
- Expected result
- Failure checkpoints

## Workflow rules
- Do not claim completion without evidence.
- Keep docs/worklog.md current after meaningful edits and test runs.
- Do not overwrite protected files casually:
  - CLAUDE.md
  - docs/launch-readiness.md
  - .github/workflows/*
- Prefer deterministic, reversible changes.
- Use VSCode file paths in instructions.
- Provide full file contents when creating or replacing files.

## GitHub rules
- Every meaningful feature, bug, QA failure, launch blocker, refactor, or release task belongs in GitHub.
- Use labels consistently.
- Use milestones for launch readiness and release groupings.
- Use PRs for implementation history and review evidence.

## Release rule
Launch readiness is determined by:
- GitHub issue state
- required checks
- docs/launch-readiness.md
- explicit evidence
Not by intuition.

## Legacy isolation
- Legacy v0 is preserved in docs/migration/ and docs/legacy/.
- Do not mutate legacy notes to fit DEOS.
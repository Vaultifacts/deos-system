# Development Runbook

## Objective
Operate DEOS safely during implementation and normal use.

## Start-of-session procedure
1. Open the repository root in VSCode.
2. Confirm branch with `git status`.
3. Read:
   - docs/worklog.md
   - docs/launch-readiness.md
   - docs/state.md
4. Identify the active GitHub issue.
5. Update `## Current Objective` and `## Active Issue` in docs/worklog.md.

## During work
- Keep all meaningful work tied to a GitHub issue.
- Do not claim completion without evidence.
- Preserve protected files unless the task explicitly requires changes there.
- Prefer reversible changes.

## End-of-session procedure
1. Update docs/worklog.md:
   - Current Status
   - Evidence
   - Next Steps
   - Blockers
2. Commit meaningful changes.
3. Push branch if appropriate.
4. Ensure GitHub reflects the actual state of work.

## Failure checkpoints
- Work is happening without an issue.
- Worklog is stale.
- Protected files changed unintentionally.
- Launch readiness is being judged by intuition.
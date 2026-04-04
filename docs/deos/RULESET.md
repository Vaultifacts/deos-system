# Ruleset

## Purpose

This document defines the exact ruleset expectations for branch protection and required checks in the DEOS repository.

## Protection Mode

This repository uses:

- **GitHub rulesets**

This repository does **not** use:

- legacy branch protection rules as the primary enforcement mechanism

## Required Repository Enforcement

The active ruleset should enforce at minimum:

- Require status checks to pass
- Require branches to be up to date before merging
- Block force pushes

## Canonical Required Checks

The following required checks are the canonical set for this repository.

### Required checks and sources

- `ci / validate-files` → `GitHub Actions`
- `Code scanning results / CodeQL` → `GitHub Advanced Security`
- `Code scanning results / Trivy` → `GitHub Advanced Security`
- `semgrep` → `GitHub Actions`
- `readiness-check` → `GitHub Actions`

## Invalid Required Checks

The following check names are invalid for the current system and must be removed if present:

- `ci`
- `codeql`
- `trivy`

## Source Matching Rule

A required check is only valid if both of the following match:

1. exact check name
2. exact source

A name-only match is insufficient.

## Current Known Synchronization Behavior

GitHub may continue to show a PR as blocked with:

`Expected — Waiting for status to be reported`

after a ruleset change, even if the underlying checks already completed successfully.

This can happen when the PR has not yet been freshly re-evaluated against the updated ruleset configuration.

## Required Re-Evaluation Actions

If ruleset corrections were made, trigger a fresh evaluation using one of the following:

1. Update branch
2. Rebase branch
3. Close and reopen PR

## Enforcement Decision

Current operational decision:

- align ruleset to actual emitted checks
- avoid workflow renaming unless mismatch still exists after fresh PR evaluation

## Change Control Rule

Any future change to required checks must update all of the following together:

- ruleset configuration
- `docs/deos/CI.md`
- `docs/deos/RULESET.md`
- `docs/deos/CHECKS.md`
- `docs/deos/TROUBLESHOOTING.md`

No check naming change should be considered complete until all documentation and PR behavior agree.
# DEOS Checks and Ruleset

## Purpose
This document defines the required check model and the branch ruleset alignment rules.

## Important distinction
GitHub required checks must match:
1. exact check name
2. exact source/integration

A mismatch causes:
- `Expected — Waiting for status to be reported`
- blocked merges
- false enforcement failures

## Implemented verification workflows
- `ci.yml`
- `codeql.yml`
- `trivy.yml`
- `semgrep.yml`
- `readiness-check.yml`
- `issue-from-failure.yml`
- `e2e.yml` (placeholder / non-blocking unless deliberately added)

## Runtime reality
Actual check names may differ from workflow filenames.

## Known emitted check names observed during setup
Observed on PRs:
- `ci / validate-files`
- `Code scanning results / CodeQL`
- `Code scanning results / Trivy`
- `semgrep`
- `readiness-check`

## Recommended required checks
Use the actual emitted names from PRs.

### Recommended mapping
- `ci / validate-files` → source: GitHub Actions
- `Code scanning results / CodeQL` → source: GitHub Advanced Security
- `Code scanning results / Trivy` → source: GitHub Advanced Security
- `semgrep` → source: GitHub Actions
- `readiness-check` → source: GitHub Actions

## Checks that should not be required
Do not require:
- `issue-from-failure`
- placeholder `e2e` unless intentionally promoted to blocking
- stale or legacy check aliases no longer emitted by PRs

## Ruleset name
Recommended:
- `DEOS Main Protection`

## Ruleset target
- `main`

## Required rules
- Require a pull request before merging
- Required approvals = 0
- Require conversation resolution before merging
- Require status checks to pass
- Require branches to be up to date before merging
- Block force pushes
- Restrict deletions

## Rules that should remain off for solo operation
- Require review from specific teams
- Require review from Code Owners
- Require approval of the most recent reviewable push
- Require deployments to succeed
- Require signed commits
- Require code quality results
- Automatically request Copilot code review

## Operational rule
If a PR shows `Expected — Waiting for status to be reported`, first verify:
1. required check names
2. check sources
3. whether the PR has rerun after ruleset changes

Do not assume the workflow YAML is wrong until those are confirmed.
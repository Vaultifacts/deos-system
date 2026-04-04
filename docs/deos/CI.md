# CI

## Purpose

This document defines the intended workflow set for the DEOS repository and records the distinction between workflow/job intent and GitHub-emitted check reality.

## Workflow Location

All workflows are stored in:

`.github/workflows/`

## Active Workflow Inventory

### 1. CI workflow

- File: `ci.yml`
- Intended job name: `ci`
- Practical emitted check observed:
  - `ci / validate-files`

### 2. CodeQL workflow

- File: `codeql.yml`
- Intended job name: `codeql`
- Practical emitted check observed:
  - `Code scanning results / CodeQL`

### 3. Trivy workflow

- File: `trivy.yml`
- Intended job name: `trivy`
- Practical emitted check observed:
  - `Code scanning results / Trivy`

### 4. Semgrep workflow

- File: `semgrep.yml`
- Intended job name: `semgrep`
- Practical emitted check observed:
  - `semgrep`

### 5. Readiness check workflow

- File: `readiness-check.yml`
- Intended job name: `readiness-check`
- Practical emitted check observed:
  - `readiness-check`

## Important Distinction

Workflow file names and internal job names are not the same thing as GitHub required checks.

Some tools emit checks through GitHub Advanced Security rather than standard GitHub Actions check naming.

This is especially important for:

- CodeQL
- Trivy SARIF uploads

## Operational Rule

Required check configuration must follow **actual emitted checks**, not assumed workflow job names.

## Current Intended Enforcement Set

The repository should enforce the following checks:

- `ci / validate-files`
- `Code scanning results / CodeQL`
- `Code scanning results / Trivy`
- `semgrep`
- `readiness-check`

## Non-Canonical Names

These names should not be used as required checks unless GitHub explicitly emits them:

- `ci`
- `codeql`
- `trivy`

## CI Philosophy

The CI system exists to enforce:

- deterministic validation
- security scanning visibility
- reproducible readiness logic
- branch merge safety

The CI system is not considered correctly configured unless GitHub rulesets and actual emitted checks are aligned exactly.
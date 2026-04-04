# Checks

## Purpose

This document maps workflow intent to actual GitHub-emitted checks and their true enforcement sources.

## Canonical Mapping Table

| Workflow File | Intended Job Name | Actual Emitted Check Name | Source |
|---|---|---|---|
| `ci.yml` | `ci` | `ci / validate-files` | GitHub Actions |
| `codeql.yml` | `codeql` | `Code scanning results / CodeQL` | GitHub Advanced Security |
| `trivy.yml` | `trivy` | `Code scanning results / Trivy` | GitHub Advanced Security |
| `semgrep.yml` | `semgrep` | `semgrep` | GitHub Actions |
| `readiness-check.yml` | `readiness-check` | `readiness-check` | GitHub Actions |

## Critical Reality

GitHub does not always use workflow job names as required-check names.

This is especially true when results are surfaced through GitHub Advanced Security.

## Tool-to-Source Mapping

| Tool | Actual Check Name | Source |
|---|---|---|
| CI | `ci / validate-files` | GitHub Actions |
| CodeQL | `Code scanning results / CodeQL` | GitHub Advanced Security |
| Trivy (SARIF) | `Code scanning results / Trivy` | GitHub Advanced Security |
| Semgrep | `semgrep` | GitHub Actions |
| Readiness | `readiness-check` | GitHub Actions |

## Invalid Name Set

These names are currently non-canonical and should not be configured as required checks:

- `ci`
- `codeql`
- `trivy`

## Diagnostic Rule

If a PR is blocked, compare all four of these:

1. workflow file
2. intended job name
3. actual emitted check name
4. emitted source

Do not assume any two of them are identical.

## Success State

The system is aligned only when the PR shows all of the following as passing:

- `ci / validate-files`
- `Code scanning results / CodeQL`
- `Code scanning results / Trivy`
- `semgrep`
- `readiness-check`

and the merge button is enabled.
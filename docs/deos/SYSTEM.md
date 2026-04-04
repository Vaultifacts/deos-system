# DEOS System

> THIS REPOSITORY IS THE SINGLE SOURCE OF TRUTH.  
> DO NOT TRUST CHAT MEMORY.  
> ALWAYS REFER TO THESE FILES.

## Purpose

DEOS (Deterministic Engineering Operating System) defines the operational rules for this repository so that CI/CD, security scanning, and launch-readiness enforcement are deterministic, reproducible, and GitHub-native.

## Core Objectives

- Deterministic CI/CD enforcement
- Security scanning with GitHub-visible results
- Readiness gating for launch and release control
- Strict branch protection with minimal drift and minimal bypass paths
- Minimal manual intervention
- Clear, auditable enforcement behavior

## Constraints

- No ambiguity
- Fully reproducible
- GitHub-native enforcement
- Minimal manual intervention
- Prefer exact naming and exact source matching over convention or guesswork

## Repository

- Owner/Repo: `Vaultifacts/deos-system`

## Enforcement Model

This repository uses **GitHub rulesets**, not legacy branch protection rules.

The ruleset is intended to enforce:

- required status checks
- up-to-date branches before merge
- blocked force pushes

## Design Principles

### 1. Determinism over convenience
A check is only valid if GitHub emits the exact expected check with the exact expected source.

### 2. Source-aware enforcement
Check names alone are insufficient. GitHub ruleset enforcement depends on both:
- exact check name
- exact check source

### 3. GitHub-native truth
The PR Checks tab and ruleset configuration are the operational truth for enforcement behavior.

### 4. No hidden memory
Operational state must live in versioned repository docs, not chat memory.

### 5. Minimal renaming risk
Prefer aligning rulesets to actual emitted check names unless there is a strong operational reason to redesign workflow/check naming.

## Current System Status

The current system is considered architecturally close to correct.

The active problem is not overall design. The active problem is:

- required-check alignment
- ruleset synchronization
- PR re-evaluation after ruleset changes

## Canonical Reading Order

When diagnosing merge-blocking issues, use this order:

1. `docs/deos/SYSTEM.md`
2. `docs/deos/CI.md`
3. `docs/deos/RULESET.md`
4. `docs/deos/CHECKS.md`
5. `docs/deos/TROUBLESHOOTING.md`

## Operator Rule

When diagnosing GitHub merge enforcement:

- do not assume workflow job names equal emitted required check names
- do not assume SARIF-based tools emit Actions-native check names
- do not rename workflows unless mismatch remains after exact ruleset alignment and fresh PR evaluation

## Current Known Issue

GitHub required checks may remain stuck as:

`Expected — Waiting for status to be reported`

even when workflows already ran successfully, if ruleset changes occurred after PR creation or before GitHub performed a fresh evaluation.

## Decision Record

Current strategy:

- use ruleset-based alignment to actual emitted checks
- do not rename workflows unless proven necessary

This is currently the preferred low-risk operational path.
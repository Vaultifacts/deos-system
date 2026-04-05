# DEOS

Deterministic Engineering Operating System.

## Purpose
DEOS is a GitHub-centered engineering operating model designed to make work:
- deterministic
- auditable
- verifiable
- resistant to conversation drift

## Core principle
There are only two sources of truth:

1. GitHub for live execution state
2. The repository for technical and operational context

If work is not in GitHub, it is not active work.
If technical context is not in the repo, it is not durable context.

## Scope
DEOS governs:
- issue lifecycle
- pull request gating
- launch readiness
- security scanning
- CI enforcement
- repo-resident operating context for AI-assisted engineering

## Repository truth files
Primary files:
- `CLAUDE.md`
- `docs/worklog.md`
- `docs/launch-readiness.md`
- `docs/state.md`
- `docs/runbooks/`
- `docs/adr/`

Supporting DEOS docs:
- `docs/deos/architecture.md`
- `docs/deos/operating-model.md`
- `docs/deos/github-governance.md`
- `docs/deos/checks-and-ruleset.md`
- `docs/deos/lifecycle.md`
- `docs/deos/troubleshooting.md`
- `docs/deos/rollout-and-review.md`

## Non-goals
DEOS is not:
- a chat-memory-based workflow
- a Notion-first tracking system
- a loosely enforced productivity framework
- a multi-source state system

## Hard rules
- No meaningful work without a GitHub issue or PR.
- No completion claim without evidence.
- No release readiness judgment based on intuition.
- No live task tracking outside GitHub.
- No technical state that exists only in conversation.

## Current implementation baseline
Implemented components:
- GitHub labels
- GitHub milestones
- GitHub project
- GitHub Actions workflows
- GitHub branch ruleset on `main`
- repo-local Claude context and hooks

## Drift prevention instruction
Future assistants must read this directory before proposing structural changes.
If the repo state differs from memory or conversation, the repo wins.
# ADR-001: DEOS System Boundary

## Status
Accepted

## Context
The legacy system was fragmented across chat, loose files, and manual tracking. It was not deterministic, auditable, or easily restorable.

## Decision
Adopt DEOS with these boundaries:
- GitHub is the live execution source of truth
- Repo-local files are the technical/context source of truth for Claude
- Claude hooks provide deterministic local enforcement
- GitHub Actions provide event-driven automation
- Security and verification rely on CodeQL, Dependabot, Semgrep, and Trivy
- Legacy systems are preserved only as reference and rollback material

## Consequences
- No parallel live tracking systems
- No work without a GitHub issue
- No completion without evidence
- No release without explicit readiness gates
- System quality depends on disciplined tuning, not tool sprawl
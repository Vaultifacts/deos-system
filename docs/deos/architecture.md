# DEOS Architecture

## System definition
DEOS is a deterministic engineering operating system with five layers:

1. Execution layer
2. Context layer
3. Enforcement layer
4. Verification layer
5. Governance layer

## 1. Execution layer
Execution truth lives in GitHub.

### GitHub objects used
- Issues
- Pull requests
- Milestones
- Project
- Actions
- Ruleset on `main`

### Why
GitHub is the operational substrate where work, review, checks, and merges already occur.
Using GitHub as the execution source of truth eliminates split-brain tracking.

## 2. Context layer
Technical and operational context lives in the repository.

### Repository context files
- `CLAUDE.md`
- `docs/worklog.md`
- `docs/launch-readiness.md`
- `docs/state.md`
- `docs/runbooks/`
- `docs/adr/`

### Why
Conversation memory is volatile.
Repo files are durable, versioned, reviewable, and branchable.

## 3. Enforcement layer
Enforcement happens through:
- Claude repo rules
- Claude hooks
- GitHub ruleset
- required checks

### Why
A system that depends on remembering rules is not deterministic.
DEOS requires machine-enforced behavior.

## 4. Verification layer
Verification is provided by:
- CI
- CodeQL
- Trivy
- Semgrep
- readiness-check

### Why
Completion must be grounded in evidence, not claims.

## 5. Governance layer
Governance is provided by:
- label taxonomy
- milestone structure
- project fields/views
- ruleset configuration
- launch readiness rules

### Why
Without stable governance, execution becomes inconsistent and non-comparable over time.

## Authority boundaries

### GitHub owns
- live work items
- merge state
- CI state
- code scanning state
- milestone progress
- project state

### Repo owns
- stable operating instructions
- launch criteria
- runbooks
- architectural decisions
- Claude operating context

### Conversation does not own
- live work state
- release state
- system structure
- long-term operating truth

## Design constraints
- Solo-friendly
- Deterministic
- Minimal manual bookkeeping
- Verifiable outputs
- Reversible changes
- No dependency on external dashboards

## Deliberate exclusions
The following are excluded from the live loop:
- Notion
- Jira
- Linear
- ad hoc task lists
- conversation-only state
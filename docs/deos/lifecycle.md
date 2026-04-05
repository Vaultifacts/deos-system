# DEOS Lifecycle

## Purpose
This document defines how work moves through DEOS.

## Issue lifecycle states
- `deos:state:triage`
- `deos:state:in-progress`
- `deos:state:awaiting-verification`
- `deos:state:verified`

## Lifecycle meaning

### triage
The item exists and has been classified but work has not started.

### in-progress
Implementation or investigation is actively happening.

### awaiting-verification
The change exists, but verification is not complete.

### verified
Required checks and review conditions are satisfied.

## Typical label combinations

### Feature
- `deos:type:feature`
- `deos:priority:p1` or `deos:priority:p2`
- one state label
- one source label

### Bug
- `deos:type:bug`
- one priority label
- one state label
- one source label

### QA
- `deos:type:qa`
- one priority label
- one state label
- one source label

### Launch blocker
- `deos:type:launch-blocker`
- usually `deos:priority:p0`
- one state label
- one source label

## Source labels meaning
- `deos:source:manual` = created manually by operator
- `deos:source:ci` = originated from CI or bot-driven workflow context
- `deos:source:e2e` = originated from E2E flow
- `deos:source:scanner` = originated from scanner results

## Milestone usage
Use milestones to group readiness and release scope:
- `DEOS: Launch Readiness`
- `DEOS: v1.0`
- `DEOS: Post Launch`

## Project usage
Issues should appear in `DEOS — Shadow` during current operating phase.

## Validation issue pattern
A controlled QA issue may be used to verify:
- issue creation
- label application
- project placement
- lifecycle transitions
- workflow triggers

## Lifecycle integrity rule
Only one DEOS state label should be active at a time.
If multiple state labels exist simultaneously, the item is in an invalid state.
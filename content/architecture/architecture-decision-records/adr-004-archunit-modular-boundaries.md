---
title: ADR-004 Enforce modular boundaries with ArchUnit
type: docs
weight: 4
---
## Status

Accepted

## Context

The codebase is a **modular monolith**: many bounded contexts in one repository.
Without enforcement, package dependencies creep across boundaries ("just one import"), cycles appear, and refactors become risky.

## Decision

Use **ArchUnit** in `ArchitectureTest` to enforce:

1. **No cycles** between top-level slices matching `com.jongsoft.finance.(*)..`
2. **Layering** against the PlantUML diagram `src/test/resources/architecture/layer-design.puml` (generated API, REST adapters, domain layers, JPA)
3. **Explicit module layers** for major domains (`core`, `banking`, `budget`, `classification`, `contract`, `spending`, `exporter`, `suggestion`) with documented allowed dependencies

- `spending` may access `core`, `banking`, and `budget` (reads transactions and budgets via ports and shared domain types; no dependency on `exporter` or `suggestion`).
- Other modules must not depend on `spending`.

CI and local `./gradlew test` must keep these rules green.

## Consequences

- **Positive:** Architectural intent is executable; violations fail the build instead of silently accumulating.
- **Positive:** The PlantUML diagram stays tied to reality via automated checks.
- **Negative:** New cross-module dependencies require updating tests (and often an ADR) rather than quick fixes.
- **Negative:** Packages outside the listed modules (for example `configuration`, root `EventBus`) still rely on manual discipline unless rules are extended.

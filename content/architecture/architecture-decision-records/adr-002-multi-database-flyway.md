---
title: ADR-002 Multi-database strategy with dialect-specific Flyway migrations
type: docs
weight: 2
---
## Status

Accepted

## Context

Users self-host Pledger.io on different environments.
The application supports **PostgreSQL**, **MySQL**, and **H2** (development/tests).
SQL dialects differ (types, indexes, functions), so a single generic migration script set is fragile.

## Decision

Use **Flyway** with **separate migration trees** under `src/main/resources/db/migration/` (for example `psql/` and `mysql/`).
Select the appropriate datasource and Flyway locations via Micronaut configuration profiles.
Rely on dialect-appropriate drivers at runtime.

## Consequences

- **Positive:** Each database gets idiomatic DDL and fewer portability hacks.
- **Negative:** Schema changes must often be authored (or at least validated) **twice** — once per supported production dialect.
- **Negative:** Drift between dialect scripts is a real risk; reviews and tests should cover both trees where applicable.

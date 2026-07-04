---
title: ADR-005 Legacy Camunda Flyway migrations without Camunda runtime
type: docs
weight: 5
---
## Status

Accepted

## Context

Older versions of Pledger.io used **Camunda BPM** for batch import workflows.
The database still contains Camunda-style tables created by historical migrations.
The application no longer embeds Camunda; imports are driven by an in-process **`ImportProcessEngineImpl`** and related domain code under `exporter`.

Flyway configuration for production-style profiles still includes Camunda migration locations, for example:

- `classpath:db/camunda/mysql` and `classpath:db/migration/mysql` (`application-mysql.properties`)
- `classpath:db/camunda/psql` and `classpath:db/migration/psql` (`application-psql.properties`)
- `classpath:db/camunda/h2` for demo/H2 (`application-demo.properties`)

## Decision

1. **Keep** the `src/main/resources/db/camunda/{h2,mysql,psql}` Flyway scripts so existing databases and fresh installs receive a consistent schema history.
2. **Do not** reintroduce a Camunda Java dependency; workflow state for imports is handled in application code (`ImportProcess`, `UserTask`, `ProcessVariable`).
3. Treat Camunda migrations as **legacy schema only**.

New schema changes belong under `db/migration/{dialect}/` unless a Camunda-table change is unavoidable for compatibility.

## Consequences

- **Positive:** Upgrades from older deployments remain possible; Flyway ordering stays stable.
- **Positive:** Runtime stays simpler (no Camunda engine to operate or secure).
- **Negative:** Repository carries migration SQL that does not match the current process engine name.
- **Negative:** Removing Camunda tables later requires a deliberate migration project and ADR superseding this one.

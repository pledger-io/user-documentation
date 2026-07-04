---
title: ADR-001 Contract-first OpenAPI with Micronaut code generation
type: docs
weight: 1
---
## Status

Accepted

## Context

The REST API must stay consistent for the separate web UI and any API clients.
Handwritten controllers and DTOs tend to drift from documentation unless the **contract is the single source of truth**.

The project already ships an OpenAPI 3.1 description split across `src/contract/` and uses the Micronaut OpenAPI Gradle plugin.

## Decision

Treat the **OpenAPI contract** as authoritative.
At build time, generate:

- Java controller **interfaces** in `com.jongsoft.finance.rest`
- Request/response **models** in `com.jongsoft.finance.rest.model`

Implement those interfaces in feature `adapter.rest` controllers (for example `AccountFetcherApi`).
Use `importMapping` / `typeMapping` where generated names must align with existing domain or framework types.

## Consequences

- **Positive:** Wire format, validation annotations, and controller signatures stay aligned with the published spec; Swagger UI can be served from generated metadata.
- **Positive:** Breaking API changes show up as compile errors in controllers.
- **Negative:** Build depends on code generation; contributors must run Gradle (or IDE sync) after contract edits.
- **Negative:** Advanced OpenAPI patterns sometimes need custom mappings or wrapper types.

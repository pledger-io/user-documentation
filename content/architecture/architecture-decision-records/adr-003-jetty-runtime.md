---
title: ADR-003 Use Jetty as the HTTP server runtime
type: docs
weight: 3
---
## Status

Accepted

## Context

Micronaut supports multiple HTTP runtimes (notably Netty and Jetty).
The choice affects threading model, integration with servlet-style features, dependency footprint, and operational familiarity.

## Decision

Configure the Micronaut application to use **`runtime("jetty")`** and depend on **`micronaut-http-server-jetty`** as the embedded server for this service.

## Consequences

- **Positive:** Aligns the stack with Jetty-based deployment expectations where relevant; uses a mature embedded server.
- **Negative:** Defaults and community examples for Micronaut often assume Netty; some tuning or documentation may need translation.
- **Note:** If the project ever requires Netty-specific reactive pipelines end-to-end, this decision should be revisited explicitly.

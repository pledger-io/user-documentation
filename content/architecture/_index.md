---
title: Technical documentation
description: Technical documentation of Pledger.io
type: docs
weight: 3
content_blocks:
  - _bookshop_name: hero
    heading:
      title: Architecture & Technical Documentation
      content: Explore how Pledger.io is designed, how core processes work, and how the API is structured.
    background:
      color: primary
      subtle: true
---
This section is intended for contributors, integrators, and operators who want to understand how the platform is built and why specific design decisions were made.

Pledger.io is implemented as a modular monolith with clear module boundaries, explicit domain modeling, and a contract-first REST API.

{{< card-group gutter="3" cols="2" >}}

    {{< card path="architecture/design" header-style="none" />}}
    {{< card path="architecture/process" header-style="none" />}}
    {{< card path="architecture/architecture-decision-records" header-style="none" />}}
    {{< card path="architecture/api-docs" header-style="none" />}}

{{</ card-group>}}

Browse [release notes](/releases/) for version history and downloads.

## Recommended reading path

If you are new to the codebase, start with [Design](/architecture/design/domain/) and [Backend Design](/architecture/design/backend-design/).
Then continue with [Process](/architecture/process/transaction-import/) to understand runtime flows, and finish with the [Architecture Decision Records](/architecture/architecture-decision-records) for historical context.

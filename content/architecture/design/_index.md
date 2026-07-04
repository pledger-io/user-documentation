---
title: Architectural design of the project
type: docs
weight: 2
description: Structural design of Pledger.io across domain, backend, UI, and deployment.
---
This section explains the core design of Pledger.io at both conceptual and implementation level.
It covers how responsibilities are separated, how modules interact, and how the system is packaged for deployment.

{{< card-group gutter="3" cols="2" >}}

    {{< card path="architecture/design/domain" header-style="none" />}}
    {{< card path="architecture/design/repositories" header-style="none" />}}
    {{< card path="architecture/design/backend-design" header-style="none" />}}
    {{< card path="architecture/design/ui-design" header-style="none" />}}
    {{< card path="architecture/design/deployment" header-style="none" />}}

{{</ card-group>}}

## Recommended reading path

Start with [Domain](/architecture/design/domain/) and [Backend Design](/architecture/design/backend-design/) to understand the core model and service architecture.
Then read [UI Design](/architecture/design/ui-design/) to see how frontend concerns map to backend capabilities.
Use [Repositories](/architecture/design/repositories/) and [Deployment](/architecture/design/deployment/) for implementation and operations details.

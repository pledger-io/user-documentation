---
title: Installation
type: docs
weight: 1
description: Install Pledger.io with Docker, Compose, Kubernetes, or Windows.
---
Pledger.io is a self-hosted web application.
No matter which installation method you choose, the runtime model is the same:

- A Pledger.io application process (or container) serves the web UI and API.
- Persistent storage is used for logs and uploaded files.
- A database stores your financial data (MySQL/MariaDB for most production setups, H2 for local/single-user scenarios).

{{< card-group gutter="3" cols="2" >}}

    {{< card path="getting-started/installation/docker" header-style="none" />}}
    {{< card path="getting-started/installation/compose" header-style="none" />}}
    {{< card path="getting-started/installation/kubernetes" header-style="none" />}}
    {{< card path="getting-started/installation/windows" header-style="none" />}}
    {{< card path="getting-started/installation/configuration" header-style="none" />}}

{{</ card-group>}}

## How Pledger.io runs

At startup, Pledger.io connects to the configured database and applies schema migrations.
After that, the application serves:

- The web interface in your browser.
- The REST API used by the UI and integrations.
- Background processes such as scheduled and import-related tasks.

In container-based setups, make sure volumes are configured so logs and uploads survive restarts.
For production usage, prefer a dedicated MySQL/MariaDB database and regular backups.

## Next steps

1. Open one of the installation guides above and complete the setup.
2. Review [Configuration](/getting-started/installation/configuration/) to tune database, mail, and optional AI settings.
3. Continue with [First steps](/getting-started/first-steps/) to create your first user, accounts, and transactions.

---
title: Pledger.io
description: Self-hosted personal finance software to track accounts, categorize spending, and plan budgets.
content_blocks:
  - _bookshop_name: hero
    heading:
      preheading: Personal finance, your way
      title: Know where your money goes
      content: |-
        Pledger.io helps you track accounts and transactions, categorize spending,
        set budgets, and understand your finances — self-hosted, open source, and fully under your control.
      width: 6
    illustration:
      image: img/getting-started/first-account-overview.svg
      ratio: 4x3
    background:
      color: primary
      subtle: true
    links:
      - title: Get started
        url: /getting-started/
        icon: fas chevron-right
      - title: Install with Docker
        url: /getting-started/installation/docker/
        color: outline-light
    orientation: horizontal
    justify: center
    cover: true

  - _bookshop_name: cards
    heading:
      preheading: What you can do
      heading: Your finances in one place
      content: From day-to-day transactions to long-term planning — Pledger.io gives you the tools to stay on top of your money without handing your data to a cloud service.
      align: center
      width: 8
    cols: 3
    icon-rounded: true
    icon-style: fa-2x
    background:
      color: body-tertiary
      subtle: true
    elements:
      - title: Track transactions
        icon: fas list-check
        content: Record income and expenses, import bank data, and keep a complete history of every account.
      - title: Categorize spending
        icon: fas tags
        content: Group transactions by category so you can see where your money actually goes each month.
      - title: Plan with budgets
        icon: fas chart-pie
        content: Set monthly budgets, track expected versus actual spending, and adjust as your habits change.
      - title: Manage accounts
        icon: fas building-columns
        content: Connect checking, savings, and liability accounts in a single overview of your net worth.
      - title: Automate recurring work
        icon: fas calendar-days
        content: Schedule bills, apply categorization rules, and reduce manual bookkeeping over time.
      - title: Self-hosted & private
        icon: fas lock
        content: Run Pledger.io on your own server. Your financial data never leaves infrastructure you control.

  - _bookshop_name: panels
    heading:
      preheading: How it works
      heading: Up and running in three steps
      content: Install Pledger.io, set up your accounts, then use budgets and reports to guide everyday decisions.
      align: center
      width: 8
    cols: 1
    tab-type: pills
    background:
      color: body
    elements:
      - title: Install
        icon: fas download
        content: |-
          Deploy Pledger.io with **Docker**, Docker Compose, Kubernetes, or Windows.
          Connect a MySQL/MariaDB database (or H2 for local use), open the web UI, and create your first user.

          [Choose an installation guide →](/getting-started/installation/)
      - title: Add accounts & transactions
        icon: fas wallet
        content: |-
          Create bank and liability accounts, then add or import transactions.
          Categorize them so spending patterns become visible at a glance.

          [Follow the first-steps tutorial →](/getting-started/first-steps/)
      - title: Budget & improve
        icon: fas chart-line
        content: |-
          Define monthly budgets, assign expenses, and compare planned amounts with real spending.
          Use how-to guides to refine rules, schedules, and automation as you go.

          [Browse how-to guides →](/how-to/)

  - _bookshop_name: about
    heading:
      preheading: Open source
      title: Built for people who want control
      content: |-
        Pledger.io is open-source personal finance software.
        Host it yourself, extend it through the REST API, and read the architecture docs if you want to contribute or integrate.
      width: 6
    illustration:
      image: img/getting-started/categorizing-overview.svg
      ratio: 4x3
    background:
      color: primary
      subtle: true
    links:
      - title: REST API reference
        url: /architecture/api-docs/
        color: outline-light
      - title: Source on GitHub
        url: https://github.com/pledger-io
        color: outline-light

  - _bookshop_name: cta
    heading:
      title: Ready to take control of your finances?
      content: Start with installation and the first-steps tutorial, or jump straight into the task you need help with.
      align: center
      width: 8
    background:
      color: success
      subtle: true
    links:
      - title: Get started
        url: /getting-started/
        icon: fas chevron-right
      - title: Install with Docker
        url: /getting-started/installation/docker/
        color: outline-success
---

## Explore the documentation

Whether you are setting up for the first time or looking up a specific task, pick the section that fits.

{{< card-group gutter="3" cols="2" >}}

    {{< card path="getting-started" header-style="none" icon="fas rocket" icon-style="fa-2x" icon-rounded="true" />}}
    {{< card path="how-to" header-style="none" icon="fas book" icon-style="fa-2x" icon-rounded="true" />}}
    {{< card path="concepts" header-style="none" icon="fas lightbulb" icon-style="fa-2x" icon-rounded="true" />}}
    {{< card path="architecture" header-style="none" icon="fas diagram-project" icon-style="fa-2x" icon-rounded="true" />}}

{{</ card-group>}}

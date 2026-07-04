---
title: The UI design for Pledger.io
type: docs
weight: 3
---
The user interface is a React-based application.
It is built up using the following frameworks and tools:

- [React](https://reactjs.org/),
used as the UI framework.
- [Typescript](https://www.typescriptlang.org/),
used as the programming language.
- [Chart.js](https://www.chartjs.org/),
used for the rendering of the various charts inside the application.
- [Primereact](https://primereact.org/),
used as the primary UI component library for the application.
- [axios](https://axios-http.com/docs/intro),
used for the communication with the REST-api.

## Overview

The Pledger.io application follows a layered architecture pattern,
separating concerns into distinct layers that interact with each other in a controlled manner.
This document describes the high-level architecture of the application, including its main layers and components.

## Architecture Diagram

The following diagram illustrates the high-level architecture of the Pledger.io application:

{{< plantuml >}}
@startuml "Pledger.io Application Architecture"
!theme materia-outline

actor User

rectangle "Pledger.io" #Application
rectangle "Routes" #lightgreen
rectangle "Pages" #lightgreen
rectangle "Components" #lightblue
rectangle "Repository" #lightblue

rectangle "Backend API" #Business

User -down-> "Pledger.io": interacts
"Pledger.io" -down-> "Routes": consists out of
"Routes" -right-> "Pages": points to
"Pages" -down-> "Components": consists out of

Pages -down-> "Repository": uses
"Components" -right-> "Repository": uses

"Repository" -down-> "Backend API": communicates with

@enduml
{{< /plantuml >}}

As can be seen, there is one main entry point the user interacts with, the `Pledger.io` component.

Each `page` is represented in a `route`, but multiple routes can lead to the same `page`.
Every `page` can consist out of multiple `components`.

The `components` and `pages` can use the `repository` layer to access the backend application.

## Architectural Layers

### Entry Points

* *index.jsx*: The main entry point of the application that bootstraps the React application.
* *pledger-io.tsx*: The main application component that sets up the application context and routing.

### Pages

Pages are React components that represent full screens in the application.
They include:

* *Dashboard Page*: The main landing page showing an overview of the user's financial status.
* *Login/Register Pages*: Authentication pages for user login and registration.
* *Account Pages*: Pages for managing financial accounts.
* *Budget Pages*: Pages for creating and managing budgets.
* *Transaction Pages*: Pages for viewing, creating, and managing transactions.
* *Contract Pages*: Pages for managing recurring financial contracts.
* *Report Pages*: Pages for generating and viewing financial reports.
* *Automation Pages*: Pages for setting up and managing automation rules.
* *Settings Pages*: Pages for configuring application settings.

### Components

Components are reusable UI elements that are used across multiple pages.
They include:

* *Layout Components*: Components for page layout, such as headers, footers, and navigation.
* *Form Components*: Reusable form elements and validation.
* *Account Components*: Components specific to account management.
* *Budget Components*: Components for budget visualization and management.
* *Transaction Components*: Components for transaction listing, filtering, and editing.
* *Contract Components*: Components for contract management.
* *Report Components*: Components for report generation and visualization.
* *Upload Components*: Components for file uploading.
* *Dashboard Components*: Components for the dashboard, such as summary cards and charts.

### Repositories

Repositories provide a clean abstraction for data access, following the Repository pattern.
They include:

* *Account Repository*: Handles operations related to financial accounts.
* *Budget Repository*: Handles operations related to budgets.
* *Category Repository*: Handles operations related to transaction categories.
* *Contract Repository*: Handles operations related to financial contracts.
* *Rule Repository*: Handles operations related to automation rules.
* *Security Repository*: Handles operations related to authentication and authorization.
* *Profile Repository*: Handles operations related to user profiles.
* *Statistical Repository*: Handles operations related to financial statistics and reports.
* *Savings Repository*: Handles operations related to savings goals.
* *Process Repository*: Handles operations related to background processes.
* *Import Job Repository*: Handles operations related to importing financial data.

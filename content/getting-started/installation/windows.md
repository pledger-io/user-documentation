---
title: Windows Application
description: Install the experimental standalone Pledger.io app for Windows 10.
icon: fab windows
thumbnail: img/getting-started/installation/windows.svg
show_thumbnail: false
type: docs
weight: 3
---
Since release 2.0.0 it is possible to install Pledger.io as a standalone application for Windows 10.
Once installed it will automatically start the server and connect you to it.

>[!WARNING]
> The standalone version of Pledger.io is still experimental.
> Make sure you back up the database regularly to prevent data-loss.

## Installation

### Install Java runtime

At this time Java is not included in the Pledger.io installer.
Follow the steps below to install Java 21:

1. Download the Java 21 installer from [Adoptium JDK](https://adoptium.net/en-GB/temurin/releases/?os=windows&version=21)
2. Run the installer and follow the instructions

### Install Pledger.io

To install the native Windows 10 application please follow the steps below:

1. Download the installer from the list below
2. Run the installer and follow the instructions
3. Follow the instructions in the next section to start the application

>[!TIP]
> The standalone application will only run in H2 mode, so the database is stored on
> your PC in the %appdata%\pledger-electron-app directory.

After the installer has finished a new application named 'Pledger.io' should have been added to the Windows menu.

## History

| Version | Release date | Release note | Download |
| --- | --- | --- | --- |
| 5.0.0 | 2025-12-02 | Prepare the application for multi set-up. | [Pledger.io Setup 5.0.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%205.0.0.exe) |
| 4.4.0 | 2025-01-03 | Added spending and pattern detection | [Pledger.io Setup 4.4.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%204.4.0.exe) |
| 4.3.2 | 2025-04-25 | Resolve issues with rule groups and removing classifications from transactions. | [Pledger.io Setup 4.3.2.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%204.3.2.exe) |
| 4.3.1 | 2025-01-03 | Added various LLM options | [Pledger.io Setup 4.3.1.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%204.3.1.exe) |
| 3.8.0 | 2025-01-03 | Various UI optimizations. | [Pledger.io Setup 3.8.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.8.0.exe) |
| 3.7.1 | 2024-11-10 | Add auto-suggestion for budget, contract and category when creating transactions. | [Pledger.io Setup 3.7.1.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.7.1.exe) |
| 3.6.0 | 2024-09-13 | Add light theme to the application. | [Pledger.io Setup 3.6.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.6.0.exe) |
| 3.5.2 | 2024-08-09 | Various styling and minor structure updates to the UX | [Pledger.io Setup 3.5.2.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.5.2.exe) |
| 3.5.1 | 2024-06-20 | Fix localization issues | [Pledger.io Setup 3.5.1.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.5.1.exe) |
| 3.5.0 | 2024-06-17 | Minor updates to layout in the UI | [Pledger.io Setup 3.5.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.5.0.exe) |
| 3.4.1 | 2024-05-23 | Add 2-factor authentication | [Pledger.io Setup 3.4.1.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.4.1.exe) |
| 3.3.0 | 2024-03-29 | Add support for modifying budgets properly | [Pledger.io Setup 3.3.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.3.0.exe) |
| 3.2.0 | 2024-03-01 | Add the importer pages | [Pledger.io Setup 3.2.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.2.0.exe) |
| 3.1.0 | 2024-02-06 | Addition of account reconciliation | [Pledger.io Setup 3.1.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.1.0.exe) |
| 3.0.2 | 2024-01-23 | Bugfix release for reporting | [Pledger.io Setup 3.0.2.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.0.2.exe) |
| 3.0.1 | 2024-01-18 | Bugfix release | [Pledger.io Setup 3.0.1.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.0.1.exe) |
| 3.0.0 | 2024-01-18 | Major front-end update | [Pledger.io Setup 3.0.0.exe](https://pledgerinstallers.z6.web.core.windows.net/Pledger.io%20Setup%203.0.0.exe) |
| 2.2.0 | 2021-02-26 | Phase out chart / time libraries in front-end | [FinTrack Setup 2.2.0.exe](https://pledgerinstallers.z6.web.core.windows.net/FinTrack%20Setup%202.2.0.exe) |
| 2.1.0 | 2020-12-07 | Added icons to accounts, add overview of active sessions for the current account | [FinTrack Setup 2.1.0.exe](https://pledgerinstallers.z6.web.core.windows.net/FinTrack%20Setup%202.1.0.exe) |
| 2.0.0 | 2020-11-12 | Initial release of the standalone application | [FinTrack Setup 2.0.0.exe](https://pledgerinstallers.z6.web.core.windows.net/FinTrack%20Setup%202.0.0.exe) |

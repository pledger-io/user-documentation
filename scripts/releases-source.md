# Pledger.io release history (source)

Edit this file, then run: `scripts/generate-releases.ps1`

Use `## 5.1.0` for version headings (or `== 5.1.0` — both work).
Use `###` / `####` for sections (or `===` / `====`).

== 5.1.11

*Release date: 2026-07-03*

=== Bug fixes

- Prevent failure when exporting a profile if a file token cannot be located on disk
- Fix CSV importer issues when importing larger files
- Fix an issue in the registration email template

=== Dependency management

==== Backend application

- Update io.micronaut.platform:micronaut-platform to v5.0.2
- Update plugin com.diffplug.spotless to v8.7.0
- Update pl.allegro.tech.build.axion-release to v1.21.2
- Update actions/checkout to v7
- Update gradle to v9.6.0

==== Build tooling

- Update electron to v42.5.0
- Update electron-builder to v26.15.3
- Update micronaut to v5
- Update plugin io.micronaut.application to v5.0.2
- Update ollama/ollama Docker image to v0.31.1
- Update actions/checkout to v7
- Update gradle to v9.6.0

== 5.1.10

*Release date: 2026-05-20*

=== Changes

- Change date range unit from YEARS to MONTHS for the budget overview

=== Dependency management

==== Backend application

- Bump io.micronaut.platform:micronaut-platform from 4.10.13 to 4.10.14
- Bump gradle-wrapper from 9.5.0 to 9.5.1
- Update plugin com.diffplug.spotless to v8.5.1

==== Build tooling

- Update dependency electron to v42.1.0
- Update ollama/ollama Docker tag to v0.24.0

== 5.1.9

*Release date: 2026-05-11*

=== Bug fixes

- Bean resolution issue in the classification controller
- Issue when OpenId is disabled with the page rendering

== 5.1.8

*Release date: 2026-05-11*

=== Changes

- Feature/allow user to choose engine by @gjong in pledger-io/rest-application#223
- Update the settings page to include translations for the type of setting
- Update the Oauth configuration to support token refresh better

=== Dependency management

==== Frontend

- Update dependency vite-plugin-static-copy to v4.1.0
- Update dependency typescript-eslint to v8.59.0
- Update dependency react-hook-form to v7.75.0
- Update dependency @eslint-react/eslint-plugin to v5
- Update dependency eslint to v10.3.0
- Update dependency axios to v1.16.0
- Update dependency react-router to v7.15.0
- Update dependency lint-staged to v17
- Update tailwindcss monorepo to v4.3.0

==== Build tooling

- Update ollama/ollama Docker tag to v0.23.1
- Update dependency electron to v42

## 5.1.7

*Release date: 2026-04-30*

### Bug fixes

- Account icons are missing in the UI

### Dependency management

#### Backend application

- Update gradle/actions action to v6
- Update dependency org.bouncycastle:bcpkix-jdk18on to v1.84
- Update dependency org.bouncycastle:bcprov-jdk18on to v1.84
- Update dependency com.tngtech.archunit:archunit-junit5 to v1.4.2
- Update dependency io.micronaut.platform:micronaut-platform to v4.10.13
- Update Gradle to v9.5.0
- Update plugin org.sonarqube to v7.3.0.8198

#### Installer

- Update ollama/ollama Docker tag to v0.23.0
- Update dependency electron to v41.5.0

## 5.1.5

*Release date: 2026-04-25*

## Bug fixes

- Resolved a critical issue in the UI where the icon pack caused the entire UI not to load

## 5.1.3

*Release date: 2026-03-21*

### Bug fixes

- Fix to store the icon code for the account update action
- Fix issue with the paginators not properly displaying the page the user is on

### Dependency management

#### Backend application

- Update dependency io.micronaut.platform:micronaut-platform to v4.10.10
- Update Gradle to v9.4.1

#### Frontend application

- Update dependency vite to v8
- Update dependency sass-embedded to v1.98.0
- Update dependency jsdom to v29.0.1
- Update dependency @eslint-react/eslint-plugin to v3
- Update dependency typescript-eslint to v8.57.1
- Update vitest monorepo to v4.1.0
- Update dependency eslint to v10.1.0

## 5.1.2

*Release date: 2026-03-14*

### Bug fixes

- Incorrect summary count for daily / monthly income, expense transaction overview
- Budget split not working properly

## 5.1.1

*Release date: 2026-03-06*

### Bug fixes

- Fix in the volume bindings, expose the vector_stores directory

## 5.1.0

*Release date: 2026-03-06*

### Changes

- Updated the internals for better performance and build speeds
- Fix the UI application to match the updated back-end
- Remove the Camunda dependency

### Dependency management

#### Backend application

- Update dependency org.awaitility:awaitility to v4
- Update plugin com.diffplug.spotless to v8.2.1
- Update Gradle to v9.3.1

#### Frontend application

- Update dependency lint-staged to v16.3.1
- Update dependency typescript-eslint to v8.56.1
- Update tailwindcss monorepo to v4.2.0
- Update dependency @stylistic/eslint-plugin to v5.9.0
- Update dependency @eslint-react/eslint-plugin to v2.13.0
- Update dependency jsdom to v28.1.0
- Update dependency axios to v1.13.5
- Update dependency vite-tsconfig-paths to v6.1.0
- Update dependency eslint to v10
- Update dependency vite-plugin-static-copy to v3.2.0
- Update dependency react-router to v7.13.0

## 5.0.4

*Release date: 2025-12-27*

### Dependency updates

#### Backend

- Update dependency org.mockito:mockito-core to v5.21.0
- Update plugin org.sonarqube to v7.2.0.6526
- Update actions/upload-artifact action to v6
- Update dependency io.micronaut.platform:micronaut-platform to v4.10.6
- Update plugin org.openapi.generator to v7.18.0
- Update langchain4j monorepo to v1.10.0

#### Front-end

- Update dependency @vitejs/plugin-react-swc to v4
- Update dependency jsdom to v27
- Update dependency @stylistic/eslint-plugin to v2.4.0
- Update dependency eslint to v9.39.1
- Update dependency react-hook-form to v7.69.0
- Update dependency react-router to v7.10.1
- Update dependency sass to v1.97.0
- Update dependency sass-embedded to v1.97.0
- Update dependency vite to v7.1.11
- Update vitest monorepo to v4
- Update dependency axios to v1.13.2
- Update dependency lint-staged to v16.2.7
- Update dependency spacetime to v7.12.0
- Update dependency oidc-client-ts to v3.4.1

## 5.0.3

*Release date: 2025-12-12*

### Bug-fixes

- Prevent basic authentication from being displayed when loading the application.

## 5.0.2

*Release date: 2025-12-05*

### Bug-fixes

- Resolve issue in case-sensitive searching categories
- Resolve issue with suggestions not persisting in transaction form

## 5.0.1

*Release date: 2025-12-03*

### Bug-fixes

- Repair the functionality to extract transactions from text
- Repair the functionality for suggestions in the transaction form

## 5.0.0

*Release date: 2025-12-02*

### Dependency updates

- Feature/refresh api in pieces
- Bugfix/remove jest dependency

#### Back-end

- Update plugin org.openapi.generator to v7.17.0
- Update dependency org.mockito:mockito-core to v5.19.0
- Update langchain4j monorepo to v1.5.0
- Update dependency org.assertj:assertj-core to v3.27.6
- Update Gradle to v9.2.1
- Update dependency org.bouncycastle:bcprov-jdk18on to v1.83
- Update dependency org.bouncycastle:bcpkix-jdk18on to v1.83
- Update actions/checkout action to v6
- Update gradle/actions action to v5
- Update plugin io.micronaut.library to v4.6.1
- Update plugin io.micronaut.application to v4.6.1

#### Front-end

- Update dependency typescript-eslint to v8.43.0
- Update dependency react-hook-form to v7.62.0
- Update dependency vite to v7.0.7
- Update dependency @stylistic/eslint-plugin to v5
- Update dependency ts-jest to v29.4.1
- Update dependency @vitejs/plugin-react-swc to v3.11.0
- Update dependency eslint to v9.35.0
- Update actions/download-artifact action to v5
- Update actions/setup-node action to v5
- Update actions/setup-java action to v5

## 4.4.2

*Release date: 2025-07-15*

### Bug-fixes

- Hotfix/resolve analyze job per user, preventing analysis jobs to get stuck on users with missing transaction for a given month.

## 4.4.1

*Release date: 2025-07-13*

### Bug-fixes

- Rename year_month to year_month_found in all affected files, issue with reserved keyword in MySQL

## 4.4.0

*Release date: 2025-07-12*

### Changes

- Add OpenID support to the application
- Add spending insight and pattern detection

### Dependency updates

### Back-end

- Update dependency io.micronaut.platform:micronaut-platform to v4.9.0
- Update plugin com.diffplug.spotless to v7.1.0
- Update plugin org.openapi.generator to v7.14.0
- Update dependency com.opencsv:opencsv to v5.11.2
- Update plugin io.freefair.lombok to v8.14
- Update dependency org.junit.jupiter:junit-jupiter-api to v5.13.0
- Update dependency org.bouncycastle:bcpkix-jdk18on to v1.81
- Update dependency org.bouncycastle:bcprov-jdk18on to v1.81
- Update dependency gradle to v8.14.2

#### Front-end

- Update dependency react-hook-form to v7.60.0
- Update dependency vite-plugin-static-copy to v3.1.0
- Update dependency eslint to v9.31.0
- Update dependency @eslint-react/eslint-plugin to v1.51.2
- Update dependency chart.js to v4.5.0
- Update dependency axios to v1.10.0
- Update dependency vite to v7
- Update vitest monorepo to v3.2.1
- Update dependency typescript-eslint to v8.33.1
- Update dependency lint-staged to v16.1.0

## 4.3.2

*Release date: 2025-04-25*

### Bug-fixes

- Update data type handling and field mappings in JPA queries
- Fix for handling the clearing of the budget, category and contract of a transaction.

### Changes

- Add theme support back into the application.
- Change autocompletes

### Dependency upgrades

- Update dependency react-hook-form to v7.56.1
- Update dependency sass to v1.87.0
- Update dependency sass-embedded to v1.87.0
- Update dependency axios to v1.9.0
- Update dependency react-router to v7.5.2

## 4.3.1

*Release date: 2025-04-20*

### Bug-fixes

- Changed the base container to allow the LLM to work in the non LLM container, using OpenAI for example.

## 4.3.0

*Release date: 2025-04-19*

### Changes

- Update budget page
- Add feature to extract transaction information from text on all transaction overview.
- Update transaction detail component to make it a bit more condense.

### Dependency updates

#### Front-end

- Update dependency @testing-library/react to v16.3.0
- Update dependency jsdom to v26.1.0
- Update dependency vite to v6.3.2
- Update dependency @vitejs/plugin-react-swc to v3.9.0
- Update dependency @eslint-react/eslint-plugin to v1.48.3
- Update dependency eslint to v9.25.0
- Update dependency spacetime to v7.10.0

## 4.2.0

*Release date: 2025-04-09*

### Changes

- Update to UI library to PrimeReact.
- Extract the router needed components into dedicated files.
- Update localization messages

### Dependency updates

#### Front-end

- Update dependency typescript-eslint to v8.26.0
- Update dependency vite to v6.2.5
- Update dependency axios to v1.8.2
- Update dependency typescript to v5.8.2
- Update dependency react-router to v7.5.0
- Update dependency spacetime to v7.8.0
- Update dependency sass to v1.86.0
- Update react monorepo to v19.1.0
- Update tailwindcss monorepo to v4.1.3

#### Back-end

- Update dependency org.camunda.bpm:camunda-engine to v7.23.0

## 4.1.2

*Release date: 2025-03-16*

### Bug fixes

- Fix an issue with displaying archived accounts.
- Add missing translations.

### Dependency updates

- Update dependency gradle to v8.13
- Update plugin org.openapi.generator to v7.12.0
- Update dependency org.mockito:mockito-core to v5.16.0
- Update plugin io.micronaut.library to v4.5.0
- Update plugin io.micronaut.application to v4.5.0
- Update plugin io.freefair.lombok to v8.13
- Update dorny/test-reporter action to v2

## 4.1.1

*Release date: 2025-02-23*

### Changes

- Update the layout to work better on smaller devices like phones.
- Add the code coverage measurements for the UI.

### Bug fixes

- Hotfix transfer listing not working.
- Fix an issue in the query for the daily balance.

### Dependency updates

#### Front-end

- Update dependency eslint to v9.21.0
- Update dependency tailwindcss to v4.0.8

#### Back-end

- Update dependency org.junit.jupiter:junit-jupiter-api to v5.12.0

## 4.0.2

*Release date: 2025-02-21*

### Bug fixes

- Resolve an issue during initial startup on a clean MySQL or MariaDB system.

## 4.0.0

*Release date: 2025-02-20*

### Added

- Feature/initial AI integration

### Changed

- Feature/move to vite for the UX build engine
- Refactor form input handling and enhance transaction suggestions
- Move the eventbus to only the command system

## 3.8.0

*Release date: 2025-01-03*

### Bug-fixes

* Change the logging to include the date of an event, making troubleshooting easier.
* Styling updates in the UX with regards to the transaction overviews
* Reduced button sizes in the card headers
* Made the create transactions buttons more accessible in the global transaction overview

## 3.7.1

*Release date: 2024-11-29*

### Bug-fixes

* Resolved an issue where the transaction pages were not loading due to an issue with transaction isolation levels of Camunda and the application.

## 3.7.0

*Release date: 2024-11-10*

### Added

* Add transaction suggestion feature
* Add create account import

### Changes

* Simplify some request entities
* Remove Database Migration Factory and related classes
* Update the build speed

## 3.6.0

*Release date: 2024-09-13*

### Changes fixes

* Include api generation for website
* Add a light theme to the website

## 3.5.3

*Release date: 2024-08-14*

### Bug fixes

- Fix an issue with the transaction form not redirecting to the previous page after saving.

## 3.5.2

*Release date: 2024-08-09*

### Changes

- Restructure types in the UX
- Style fixes in the UX
- Update router configuration in the UX
- Various dependency upgrades in UX and REST layer

### Bug fixes

- Fix the to field issue in the liability payment form.
- Fix the route and loading of the schedule transaction edit form.
- Fix issue in the category label not visible in transaction rules.

## 3.5.1

*Release date: 2024-06-20*

### Bug fixes

- Fix localization issues in the application.

## 3.5.0

*Release date: 2024-06-17*

### Changes

- Adjust some styling and lay outing issues in the front-end by

### Bug fixes

- Adding funds fails silently
- Bump various libraries used by the application

## 3.4.1

*Release date: 2024-05-23*

### Added

- 2-factor authentication added to the user login process

### Changed

- Increased performance for the CSV import process
- Added support for SMTP configuration for email notifications

## 3.3.0

*Release date: 2024-03-29*

### Added

- [FIN-353](https://jongsoftdev.atlassian.net/browse/FIN-353) Re-add the functionality to start new budget periods and adjust expenses

### Changed

- [FIN-352](https://jongsoftdev.atlassian.net/browse/FIN-352) Update the architectural documentation to include the business processes
- [FIN-354](https://jongsoftdev.atlassian.net/browse/FIN-354) Modernize the build scripting for the backend system

## 3.2.0

*Release date: 2024-03-01*

### Added

- [FIN-275](https://jongsoftdev.atlassian.net/browse/FIN-275) Update the import transactions view
- [FIN-348](https://jongsoftdev.atlassian.net/browse/FIN-348) Update the testing framework for BPMN flows

### Bug fixes

- [FIN-349](https://jongsoftdev.atlassian.net/browse/FIN-349) Importing of budgets in a profile fails
- [FIN-350](https://jongsoftdev.atlassian.net/browse/FIN-350) When exporting and importing liability accounts the initial transaction should be included

## 3.1.0

*Release date: 2024-02-06*

### Added

- [FIN-271](https://jongsoftdev.atlassian.net/browse/FIN-271) Update the automated rules view
- [FIN-326](https://jongsoftdev.atlassian.net/browse/FIN-326) Add the reconciling to the own account view
- [FIN-338](https://jongsoftdev.atlassian.net/browse/FIN-338) Create support to create an account from the account autocomplete
- [FIN-347](https://jongsoftdev.atlassian.net/browse/FIN-347) Add creation of category from the autocomplete

### Bug fixes

- [FIN-339](https://jongsoftdev.atlassian.net/browse/FIN-339) Updating a saving goal with date in the past fails

## 3.0.2

*Release date: 2024-01-23*

### Bug fixes

- [FIN-342](https://jongsoftdev.atlassian.net/browse/FIN-342) Spacing autocomplete accounts incorrect
- [FIN-343](https://jongsoftdev.atlassian.net/browse/FIN-343) Tabbing out of account autocomplete invalidates field
- [FIN-344](https://jongsoftdev.atlassian.net/browse/FIN-344) The balance graph for account detail overview is wrong on initial load
- [FIN-345](https://jongsoftdev.atlassian.net/browse/FIN-345) Logos on the yearly income / expense to large
- [FIN-346](https://jongsoftdev.atlassian.net/browse/FIN-346) Category report monthly spending table not updating correctly

## 3.0.1

*Release date: 2024-01-19*

### Bug fixes

- [FIN-340](https://jongsoftdev.atlassian.net/browse/FIN-340) Creating of transaction fails
- [FIN-341](https://jongsoftdev.atlassian.net/browse/FIN-341) Incorrect double / in breadcrumb with links

## 3.0.0

*Release date: 2024-01-18*

### Added

- [FIN-263](https://jongsoftdev.atlassian.net/browse/FIN-263) Update the dashboard page
- [FIN-264](https://jongsoftdev.atlassian.net/browse/FIN-264) Update the `Income & Expense` report
- [FIN-265](https://jongsoftdev.atlassian.net/browse/FIN-265) Update the `Budget vs Spent` report
- [FIN-266](https://jongsoftdev.atlassian.net/browse/FIN-266) Update the `Category` report
- [FIN-267](https://jongsoftdev.atlassian.net/browse/FIN-267) Update the Budget section
- [FIN-268](https://jongsoftdev.atlassian.net/browse/FIN-268) Update the contract management
- [FIN-269](https://jongsoftdev.atlassian.net/browse/FIN-269) Update the global transaction view
- [FIN-270](https://jongsoftdev.atlassian.net/browse/FIN-270) Update the Recurring transaction view
- [FIN-271](https://jongsoftdev.atlassian.net/browse/FIN-271) Update the automated rules view
- [FIN-272](https://jongsoftdev.atlassian.net/browse/FIN-272) Update the account view
- [FIN-273](https://jongsoftdev.atlassian.net/browse/FIN-273) Update the options view
- [FIN-274](https://jongsoftdev.atlassian.net/browse/FIN-274) Update the categories view
- [FIN-319](https://jongsoftdev.atlassian.net/browse/FIN-319) Update the localization files using the localization project
- [FIN-320](https://jongsoftdev.atlassian.net/browse/FIN-320) Update the release pipeline to the new front-end
- [FIN-333](https://jongsoftdev.atlassian.net/browse/FIN-333) Add architectural documentation
- [FIN-334](https://jongsoftdev.atlassian.net/browse/FIN-334) Update the profile pages

### Bug fixes

- [FIN-329](https://jongsoftdev.atlassian.net/browse/FIN-329) Dropdown of currency in reports is incorrectly formatted
- [FIN-330](https://jongsoftdev.atlassian.net/browse/FIN-330) Autocomplete cannot be changed after a value is selected
- [FIN-331](https://jongsoftdev.atlassian.net/browse/FIN-331) Initial value of own account selector undefined
- [FIN-335](https://jongsoftdev.atlassian.net/browse/FIN-335) The transaction detail in the listing shows incorrect amount
- [FIN-336](https://jongsoftdev.atlassian.net/browse/FIN-336) Category page does not load without categories
- [FIN-337](https://jongsoftdev.atlassian.net/browse/FIN-337) Default account type incorrect when creating account

## 2.4.2

*Release date: 2022-11-28*

### Changes

- Upgrade to various libraries underneath the backend of Pledger.io.

## 2.4.1

*Release date: 2021-11-05*

### Bug fixes

- [FIN-255](https://jongsoftdev.atlassian.net/browse/FIN-255) Contract warning never gets triggered
- [FIN-254](https://jongsoftdev.atlassian.net/browse/FIN-254) Scheduled transaction does not add new transactions
- [FIN-256](https://jongsoftdev.atlassian.net/browse/FIN-256) Correct styling profile page with new layout
- [FIN-253](https://jongsoftdev.atlassian.net/browse/FIN-253) Fix styling in the income / expense report table for difference
- [FIN-252](https://jongsoftdev.atlassian.net/browse/FIN-252) Fix styling of overview buttons in the dashboard
- [FIN-251](https://jongsoftdev.atlassian.net/browse/FIN-251) Fix table styling in account overview
- [FIN-250](https://jongsoftdev.atlassian.net/browse/FIN-250) Fix styling in month / year selector in the breadcrumb bar
- [FIN-249](https://jongsoftdev.atlassian.net/browse/FIN-249) Fix account logo position in the transaction overview
- [FIN-248](https://jongsoftdev.atlassian.net/browse/FIN-248) Fix styling in phone resolution
- [FIN-247](https://jongsoftdev.atlassian.net/browse/FIN-247) Fix styling in the logon / register dialogs

## 2.4.0

*Release date: 2021-09-09*

### Added

- [FIN-242](https://jongsoftdev.atlassian.net/browse/FIN-242) Add support for saving goals

### Changes

- [FIN-246](https://jongsoftdev.atlassian.net/browse/FIN-246) Update API documentation for next release
- [FIN-244](https://jongsoftdev.atlassian.net/browse/FIN-244) Redesign sidebar menu
- [FIN-245](https://jongsoftdev.atlassian.net/browse/FIN-245) Add help text to various edit screens

### Bug fixes

- [FIN-239](https://jongsoftdev.atlassian.net/browse/FIN-239) Split of transaction fails on database exception
- [FIN-237](https://jongsoftdev.atlassian.net/browse/FIN-237) Y-axis displays undefined in the income/expense report
- [FIN-236](https://jongsoftdev.atlassian.net/browse/FIN-236) Y-axis displays undefined in the dashboard graphs

## 2.3.0

*Release date: 2021-05-17*

### Added

- [FIN-235](https://jongsoftdev.atlassian.net/browse/FIN-235) Setup a relation between contracts and scheduled transactions
- [FIN-190](https://jongsoftdev.atlassian.net/browse/FIN-190) Redesign the account transaction page
- [FIN-231](https://jongsoftdev.atlassian.net/browse/FIN-231) Create scheduled transaction from a transaction

### Changes

- [FIN-232](https://jongsoftdev.atlassian.net/browse/FIN-232) Tags are not correctly saved during the creation of a transaction

### Bug fixes

- [FIN-234](https://jongsoftdev.atlassian.net/browse/FIN-234) Upgrade the front-end frameworks
- [FIN-233](https://jongsoftdev.atlassian.net/browse/FIN-233) Select all transaction on the page

## 2.2.0

*Release date: 2021-02-25*

### Added

- [FIN-218](https://jongsoftdev.atlassian.net/browse/FIN-218) Update upload locations to include new drag and drop system

### Changes

- [FIN-215](https://jongsoftdev.atlassian.net/browse/FIN-215) Move to front-end created graphs
- [FIN-224](https://jongsoftdev.atlassian.net/browse/FIN-224) Phase out Moment.js in front-end

### Bug fixes

- [FIN-226](https://jongsoftdev.atlassian.net/browse/FIN-226) Cannot change company of a contract even though interface allows it
- [FIN-228](https://jongsoftdev.atlassian.net/browse/FIN-228) Images for the upload account logo are not displaying correctly
- [FIN-219](https://jongsoftdev.atlassian.net/browse/FIN-219) Update dashboard for correct budget display in graph

## 2.1.0

*Release date: 2020-12-07*

### Added

- [FIN-187](https://jongsoftdev.atlassian.net/browse/FIN-187) Add an overview of the active tokens on profile page
- [FIN-188](https://jongsoftdev.atlassian.net/browse/FIN-188) Add support for long-lived refresh tokens for API B2B
- [FIN-189](https://jongsoftdev.atlassian.net/browse/FIN-189) Add support for account icons
- [FIN-197](https://jongsoftdev.atlassian.net/browse/FIN-197) Add archive option for failed importer jobs

### Bug fixes

- [FIN-198](https://jongsoftdev.atlassian.net/browse/FIN-198) Last transaction on own-overview shows undefined
- [FIN-223](https://jongsoftdev.atlassian.net/browse/FIN-223) Contract creation results in exception

## 2.0.2

*Release date: 2020-11-16*

### Bug fixes

- [FIN-192](https://jongsoftdev.atlassian.net/browse/FIN-192) Autocomplete of tags does not work
- [FIN-193](https://jongsoftdev.atlassian.net/browse/FIN-193) Income / Expense report the revenue list shows negative numbers
- [FIN-194](https://jongsoftdev.atlassian.net/browse/FIN-194) Interest not shown in liabilities / edit
- [FIN-195](https://jongsoftdev.atlassian.net/browse/FIN-195) Export of profile fails with transaction issue
- [FIN-196](https://jongsoftdev.atlassian.net/browse/FIN-196) 2-Factor authentication code fails

## 2.0.0

*Release date: 2020-11-12*

WARNING: This is a major release, before migrating please back up your database and storage locations.
The entire application core has been reworked.

### Added

- [FIN-160](https://jongsoftdev.atlassian.net/browse/FIN-160) Add API documentation viewer
- [FIN-185](https://jongsoftdev.atlassian.net/browse/FIN-185) Create standalone deployment option
- [FIN-168](https://jongsoftdev.atlassian.net/browse/FIN-168) Add support for long living tokens

### Changed

- [FIN-137](https://jongsoftdev.atlassian.net/browse/FIN-137) Rewrite the core layer to Micronaut framework for better performance
- [FIN-138](https://jongsoftdev.atlassian.net/browse/FIN-138) Add the REST-api layer for security
- [FIN-139](https://jongsoftdev.atlassian.net/browse/FIN-139) Setup angular project into new gradle setup
- [FIN-140](https://jongsoftdev.atlassian.net/browse/FIN-140) Setup new gradle structure
- [FIN-141](https://jongsoftdev.atlassian.net/browse/FIN-141) Rework the JPA layer for micronaut
- [FIN-142](https://jongsoftdev.atlassian.net/browse/FIN-142) Add the rule engine module
- [FIN-143](https://jongsoftdev.atlassian.net/browse/FIN-143) Add the domain module
- [FIN-144](https://jongsoftdev.atlassian.net/browse/FIN-144) Add the bpmn module
- [FIN-145](https://jongsoftdev.atlassian.net/browse/FIN-145) Move UI to separate repository for improved build speeds
- [FIN-146](https://jongsoftdev.atlassian.net/browse/FIN-146) Create automated build script for Angular application
- [FIN-148](https://jongsoftdev.atlassian.net/browse/FIN-148) Create a repository to bundle the Java Application and the Angular application
- [FIN-149](https://jongsoftdev.atlassian.net/browse/FIN-149) Add the account REST end-points
- [FIN-150](https://jongsoftdev.atlassian.net/browse/FIN-150) Add the CSV Import REST end-points
- [FIN-151](https://jongsoftdev.atlassian.net/browse/FIN-151) Add the budget REST end-points
- [FIN-152](https://jongsoftdev.atlassian.net/browse/FIN-152) Add the contract REST end-points
- [FIN-153](https://jongsoftdev.atlassian.net/browse/FIN-153) Add the attachment REST end-poitns
- [FIN-154](https://jongsoftdev.atlassian.net/browse/FIN-154) Add the BPMN process end-points
- [FIN-155](https://jongsoftdev.atlassian.net/browse/FIN-155) Add the application setting end-points
- [FIN-156](https://jongsoftdev.atlassian.net/browse/FIN-156) Add the global transaction end-points
- [FIN-157](https://jongsoftdev.atlassian.net/browse/FIN-157) Add the category REST end-points
- [FIN-158](https://jongsoftdev.atlassian.net/browse/FIN-158) Add the transaction rule REST end-points
- [FIN-159](https://jongsoftdev.atlassian.net/browse/FIN-159) Create the account transaction REST end-points
- [FIN-164](https://jongsoftdev.atlassian.net/browse/FIN-164) Add profile export to JSON
- [FIN-165](https://jongsoftdev.atlassian.net/browse/FIN-165) Add transaction export to CSV
- [FIN-166](https://jongsoftdev.atlassian.net/browse/FIN-166) Hook in artifact release to osshr
- [FIN-171](https://jongsoftdev.atlassian.net/browse/FIN-171) Rework JPA repositories to new ReactiveEntityManager
- [FIN-184](https://jongsoftdev.atlassian.net/browse/FIN-184) Improve performance of the BPMN tests

### Bug fixes

- [FIN-147](https://jongsoftdev.atlassian.net/browse/FIN-147) Font files not loading correctly in angular
- [FIN-161](https://jongsoftdev.atlassian.net/browse/FIN-161) Creation of new user fails on missing userService.create operation
- [FIN-162](https://jongsoftdev.atlassian.net/browse/FIN-162) Account creation fails on introspect exception
- [FIN-172](https://jongsoftdev.atlassian.net/browse/FIN-172) Graph end points are not working correctly
- [FIN-173](https://jongsoftdev.atlassian.net/browse/FIN-173) Front-End does not redirect to login after session expires
- [FIN-174](https://jongsoftdev.atlassian.net/browse/FIN-174) Top creditor / debtor end point not working
- [FIN-175](https://jongsoftdev.atlassian.net/browse/FIN-175) Flowable with empty stream returns only ]
- [FIN-176](https://jongsoftdev.atlassian.net/browse/FIN-176) Graphs do not render properly on front-end
- [FIN-177](https://jongsoftdev.atlassian.net/browse/FIN-177) Global transaction overview crashes without transactions
- [FIN-178](https://jongsoftdev.atlassian.net/browse/FIN-178) Local-date is returned as array should be a string
- [FIN-179](https://jongsoftdev.atlassian.net/browse/FIN-179) Role based authorization is not working correctly
- [FIN-180](https://jongsoftdev.atlassian.net/browse/FIN-180) Unable to bulk modify transactions
- [FIN-181](https://jongsoftdev.atlassian.net/browse/FIN-181) Account extraction result not correctly served
- [FIN-182](https://jongsoftdev.atlassian.net/browse/FIN-182) Reconcile account not successfully created after registration
- [FIN-183](https://jongsoftdev.atlassian.net/browse/FIN-183) Reconcile a year with deviating start balance incorrect reconcile
- [FIN-186](https://jongsoftdev.atlassian.net/browse/FIN-186) Page sizes front-end do not match backend when changed in settings

## 1.4.3

*Release date: 2020-08-19*

### Added

- [FIN-94](https://jongsoftdev.atlassian.net/browse/FIN-94) Add debt recording into the backend
- [FIN-130](https://jongsoftdev.atlassian.net/browse/FIN-130) Add correlation to logging to relate log lines to requests

### Changed

- [FIN-125](https://jongsoftdev.atlassian.net/browse/FIN-125) Allow for creating new rule groups in UI
- [FIN-129](https://jongsoftdev.atlassian.net/browse/FIN-129) Extract the transaction rule matcher / applier to separate system

### Bug fixes

- [FIN-126](https://jongsoftdev.atlassian.net/browse/FIN-126) Paging on contract detail page not working
- [FIN-127](https://jongsoftdev.atlassian.net/browse/FIN-127) The top account listing on the expense report is sorted incorrectly
- [FIN-128](https://jongsoftdev.atlassian.net/browse/FIN-128) Profile export budgets wrong serialized date
- [FIN-134](https://jongsoftdev.atlassian.net/browse/FIN-134) Issue with first transaction day counted double in the balance per account graph
- [FIN-135](https://jongsoftdev.atlassian.net/browse/FIN-135) Missing liability percentage on overview screen

## 1.3.1

*Release date: 2020-06-05*

### Added

- [FIN-84](https://jongsoftdev.atlassian.net/browse/FIN-84), [FIN-80](https://jongsoftdev.atlassian.net/browse/FIN-80), [FIN-83](https://jongsoftdev.atlassian.net/browse/FIN-83) - Add tagging support in backend

### Changed

- [FIN-108](https://jongsoftdev.atlassian.net/browse/FIN-108) Setup language selection to survive the users session

### Bug fixes

- [FIN-105](https://jongsoftdev.atlassian.net/browse/FIN-105) The total income per month is not visible on budget report
- [FIN-110](https://jongsoftdev.atlassian.net/browse/FIN-110) Paging not stored in history on account expense list

## 1.2.0

*Release date: 2020-05-18*

### Added

- [FIN-60](https://jongsoftdev.atlassian.net/browse/FIN-60) Add functionality to set category, budget and contract on multiple transactions at once
- [FIN-79](https://jongsoftdev.atlassian.net/browse/FIN-79) Allow for transaction exporting

### Changed

- [FIN-77](https://jongsoftdev.atlassian.net/browse/FIN-77) Enable the contract expiration warning BPMN flow
- [FIN-104](https://jongsoftdev.atlassian.net/browse/FIN-104) Add create transaction option from the global transaction overview

### Bug fixes

- [FIN-103](https://jongsoftdev.atlassian.net/browse/FIN-103) Scheduled transaction only records one transaction

## 1.1.0

*Release date: 2020-05-12*

### Added

- [FIN-58](https://jongsoftdev.atlassian.net/browse/FIN-58) Add text search and page ordering for the account detail page
- [FIN-59](https://jongsoftdev.atlassian.net/browse/FIN-59) Add search feature on the creditor / debtor overview page
- [FIN-64](https://jongsoftdev.atlassian.net/browse/FIN-64) Add page history when navigating between the transaction overview pages
- [FIN-101](https://jongsoftdev.atlassian.net/browse/FIN-101) Add a category and budget PIE charts to global transaction overview

### Bug fixes

- [FIN-102](https://jongsoftdev.atlassian.net/browse/FIN-102) Fix issue in editing flag setting type in the setting form

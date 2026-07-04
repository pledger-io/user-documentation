---
title: Transaction import
type: docs
weight: 2
---

## Api operations involved

In the frondend application the following API operations are involved:

- `POST /v2/api/batch-importer-config`, for creating a new import configuration.
- `POST /v2/api/batch-importer`, for creating a new import job.
- `GET /v2/api/batch-importer/{slug}/tasks`, for fetching the active pending task requiring user interaction.
- `POST /v2/api/batch-importer/{slug}/tasks`, for providing the user input required for the task.

### Creating configuration

When calling the `POST /v2/api/batch-importer-config` API operation, the user must provide the following information:

```json
{
  "name": "A logical name",
  "type": "csv",
  "fileCode": "unique-code-returned-by-upload-api-operation"
}
```

Make sure to store the returned `id` of the configuration, as it will be required when creating the import job.

More details on this can be found in the [Create batch import configuration](architecture/api-docs/#tag/batch-importer/operation/createConfiguration).

### Creating the import job

When calling the `POST /v2/api/batch-importer` API operation, the user must provide the following information:

```json
{
  "configuration": "the-id-of-the-configuration",
  "fileTokens": "unique-code-returned-by-upload-api-operation"
}
```

More details on this can be found in the [Create batch import job](architecture/api-docs/#tag/batch-importer/operation/createJob).

### Available user task

When calling the `GET /v2/api/batch-importer/{slug}/tasks` API operation, the user will be presented with the following information.

>[!WARNING]
> This will return a BAD REQUEST if the import job is not in a state that requires user interaction.

```json
{
  "id": "logical-id",
  "name": "name of the task",
  "variables": {}
}
```

There are essentially two types of tasks:

#### Import configuration

This allows the user to change the default configuration for this specific import job.
```json
{
  "importerConfiguration" : {},
  "accountId": 1,
  "applyRules": true,
  "generateAccounts": true
}
```

#### Account mapping

This allows the user to map account names to existing accounts in the system.
```json
{
  "name": "The account name"
}
```

## The business process

Below is a business process diagram of the transaction import process.
This diagram only contains those phases that do not require user interaction.

{{< plantuml >}}
@startuml
title Run an import job
start

:Load pending import jobs;
if (open tasks) then (no)
  :Start process step;
  switch (internal state)
    case (ACCOUNT_MAPPING)
       :Read account names;
       repeat :until all accounts are mapped;
         :Lookup account in system;
         :Store in internal state;
       repeat while (more account names)
       if (account mapping empty) then (yes)
         :Set state to
         CONFIGURATION;
       elseif (missing mapping) then (yes)
         :Create user task to
          add account mapping;
         :Store in internal state;
       else (no)
         :Set state to
         IMPORT;
       endif; 
    case (IMPORT)
       :Read transactions;
       repeat :until all transactions are imported;
         :Import transaction;
         :Link to import job;
         if (should apply rules) then (yes)
           :Apply rules;
         endif;
       repeat while (more transactions)
       :Set state to
       COMPLETED;
  endswitch

endif

stop
@enduml
{{< /plantuml >}}

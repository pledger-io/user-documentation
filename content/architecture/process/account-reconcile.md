---
title: Account reconciliation
type: docs
weight: 5
---
The account reconciliation process is a business process that is responsible for ensuring that the financial records are accurate and up to date.
To achieve this, the starting and ending balance for a given year is compared and any discrepancies are resolved.

## Api operations involved

In the frontend application the following API operations are involved:

- `GET /v2/api/accounts/{id}/reconcile`, for listing the active reconciling processes for the given account.
- `POST /v2/api/accounts/{id}/reconcile`, for creating a new reconciliation process for the given account.

When creating a new reconciliation, the following command must be used:

```json
{
    "period": 0,
    "balance": {
        "start": 30.5,
        "end": 35.7
    }
}
```

Where the `period` contains the year and the `start` / `end` contain the balance expected by the user.

## The business process

Below is a business process model for the account reconciliation process.

{{< plantuml >}}
@startuml
title Process diagram
start

:Load active reconciliations for an account; <<#lightgreen>>
:Compute actual start balance; <<#lightgreen>>
if (matches expected) then (yes)
    :Compute difference actual end balance; <<#lightgreen>>
    :Create reconcile transaction; <<#lightgreen>>
    while (next year open) <<#lightblue>>
        :Get next year reconciliation; <<#lightblue>>
        :Compute difference actual end balance; <<#lightblue>>
        :Create reconcile transaction; <<#lightblue>>
    endwhile
else (no)
    :Store reconcile on disk; <<#red>>
endif

stop
@enduml
{{< /plantuml >}}

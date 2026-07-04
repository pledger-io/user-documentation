---
title: Transactions in finance
description: How money moves between accounts in income, expense, and transfer flows.
icon: fas right-left
thumbnail: img/concepts/financial/transactions.svg
show_thumbnail: false
type: docs
weight: 2
---
## What is a transaction?

A transaction is a very simple thing.
Money moves from one account into another.
It does not matter if it is an expense, income or moving money around your own accounts.

A transaction in Pledger.io is stored as a single move of money with at least two accounts involved.
So a deposit of your salary would look something similar to this:

{{< plantuml >}}
@startuml

usecase account1#HoneyDew [
  Checking
Account
]

usecase account2#Bisque [
  Employer

]

rectangle deposit#LemonChiffon
rectangle withdraw#LemonChiffon
rectangle Transaction#LemonChiffon

deposit -up-> account1
withdraw -up-> account2

Transaction -up-> deposit : $200
Transaction -up-> withdraw : $-200

@enduml
{{< /plantuml >}}

Where the three blocks representing 'withdrawal', 'deposit' and 'transaction' are one single transaction moving money from the boss his account into your account.

## Splitting transactions into multiple parts

Sometimes a transaction is not as simple as a single move of money.
For example, you might buy groceries and a magazine at the same time.
In this case, you would want to split the transaction into two parts.

In Pledger.io, you can split a transaction into multiple parts.
The split is done on the receiving side of the transaction.
So in the example of buying groceries and a magazine, you would split the transaction into two parts.
One part for the groceries and one part for the magazine.

The transaction would look something like this:

{{< plantuml >}}
@startuml

usecase account1#HoneyDew [
  Checking
Account
]

usecase account2#Bisque [
  Grocery store
]

rectangle deposit#LemonChiffon
rectangle withdraw#LemonChiffon
rectangle Transaction#LemonChiffon

withdraw -up-> account1
deposit -up-> account2

Transaction -up-> withdraw : $-25 (total amount)
Transaction -up-> deposit : $20 (groceries)
Transaction -up-> deposit : $5 (magazine)

@enduml
{{< /plantuml >}}

### Constraints when splitting transactions

When splitting a transaction, there are a few constraints you need to keep in mind:

- The total amount of the split transactions will be equal to the total amount of the original transaction.
- The split transactions will have the same date as the original transaction.
- The receiving account of the split transactions will be the same as the receiving account of the original transaction.

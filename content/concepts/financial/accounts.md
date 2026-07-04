---
title: Accounts in finance
description: How accounts work in double-entry bookkeeping and in Pledger.io.
icon: fas landmark
thumbnail: img/concepts/financial/accounts.svg
show_thumbnail: false
type: docs
weight: 1
---
Pledger.io supports keeping track of multiple accounts for a full overview of your finances.
Accounts are one of the main concepts in Pledger.io to attach transactions to.
An account can be a bank account, a credit card, a loan, a savings account, or any other financial account.

In a double bookkeeping system, accounts are divided into different categories.
Each transaction is recorded in two accounts, one account is debited, and the other account is credited.

## Uniqueness of accounts in the system

Pledger.io enforces that each account has a unique name.
The IBAN of a bank account is not considered when checking for uniqueness.

One exception exists for expense accounts and revenue accounts.
As you have read, expense and revenue accounts are used as the opposing accounts for your transactions.
But you may run into the situation where you have an expense account with the same name as a revenue account.
For example, "Government Tax Department" which both pays you money and gives you money (but probably a lot less often).

All accounts support having an IBAN or number attached to it.

## Opening balances on accounts

A special case within the application are the liabilities and equity accounts.
These have an opening balance that is used to indicate the initial amount loaned.

Each transaction will slowly reduce the opening balance until it reaches zero or above (as interest may be added by your banking institute).

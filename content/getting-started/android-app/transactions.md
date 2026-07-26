---
title: Transactions
description: Record, find, classify, scan, and edit transactions in the Android app.
icon: fas receipt
thumbnail: img/concepts/financial/transactions.svg
show_thumbnail: false
type: docs
weight: 4
---

## Browse transactions

1. Open the **Transactions** tab.
2. Use the arrows beside the month to move between months.
3. Choose **All**, **Income**, or **Expense**.
4. Open the filters to narrow the list by category, expense group, or contract.
5. Tap a transaction to view its amount, account flow, classifications, splits, and tags.

Pull down to refresh. More transactions load as you scroll.

In **Power** mode, filters open automatically. In **Guided** mode, expand them when you need them.

## Record a transaction

1. Open **Transactions** and tap **+**, or use **Dashboard** → **+** → **New transaction**.
2. Choose a type:
   - **Expense** for money you spent.
   - **Income** for money you received.
   - **Transfer** for money moved between your own accounts.
3. Enter the amount, date, and description.
4. Select the accounts:
   - For an expense, choose the account you paid from and the creditor you paid.
   - For income, choose the debtor who paid you and the account that received it.
   - For a transfer, choose the source and destination accounts you own.
5. Open **More options** to add a category, expense group, contract, or tags.
6. Review the transaction and tap **Create transaction**.

Required information is marked with an asterisk. If a creditor, debtor, or tag is missing, use the add option in its field to create it without leaving the form.

## Use categories, expense groups, tags, and contracts

- A **category** describes what a transaction was for.
- An **expense group** connects spending to a monthly budget.
- **Tags** add flexible labels; one transaction can have several.
- A **contract** connects a payment to an agreement already created in the web app.

Manage categories and tags under **Settings** → **Categories** or **Tags**. Contract management is not currently available in the Android app.

If your server has [AI features configured](/getting-started/advanced/using-an-llm/), tap **Auto classify** to request suggestions. Always review suggested categories, expense groups, and tags before saving.

## Scan an invoice or bill

Scanning creates a draft; it never saves a transaction without your review.

1. On the Dashboard, tap **+** → **Scan invoice/bill**.
2. Take a photo or select an image from your device.
3. Allow camera or photo access if Android asks.
4. Wait while the app reads the image and asks your server to extract transaction details.
5. Review the extracted text.
6. Continue to the prefilled transaction form.
7. Correct the amount, date, description, accounts, and classification.
8. Tap **Create transaction**.

Invoice extraction requires a network connection and AI support on the server. PDF files are not supported. If extraction fails, choose **Enter manually**.

## Use templates and split transactions

In **Power** mode, the new transaction form shows saved templates and advanced fields by default.

- Use a template to prefill a repeated transaction.
- Use splits to divide the receiving side of a transaction into multiple parts.

Templates and auto-classification are available when creating a transaction, not while editing one.

## Edit a transaction

1. Open the transaction.
2. Tap the edit button.
3. Make your changes.
4. Tap **Save changes**.

Transaction deletion is not currently available in the Android app. Use the web app if you need to delete a transaction.

Creating or editing transactions requires a network connection. While offline, the app can show recently cached, unfiltered transactions. Filters by category, expense group, or contract need a connection.

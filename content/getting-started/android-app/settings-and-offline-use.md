---
title: Settings and offline use
description: Personalize the Android app, protect access, understand offline behavior, and get help.
icon: fas gear
thumbnail: img/getting-started/android-app.svg
show_thumbnail: false
type: docs
weight: 6
---

Open **Settings** with the gear icon in the top-right corner of a main tab.

## Change app preferences

| Setting | Options or behavior |
|---------|---------------------|
| **Language** | System default, English, Dutch, or German. |
| **Display currency** | Select the currency used for combined figures. Available currencies come from your server. |
| **Theme** | System default, Light, or Dark. |
| **Finance experience** | Guided keeps advanced controls collapsed; Power opens them by default. |
| **Notifications** | Not yet configurable; the setting is marked as coming in a future update. |

The app restarts its screen when you change the language.

## Enable biometric unlock

Biometric unlock protects the app when you open it or return after leaving it.

1. Set up fingerprint, face unlock, or another supported screen lock in Android settings.
2. In Pledger.io, open **Settings**.
3. Turn on **Biometric login**.
4. Confirm your identity in the Android prompt.

The next time the app locks, follow the prompt to unlock it. You can also sign out from the lock screen.

Biometric unlock protects access to an existing session; it does not replace your Pledger.io username and password when signing in.

## Manage categories and tags

Under the **Data** section:

- Open **Categories** to search, create, rename, or delete transaction categories.
- Open **Tags** to search, create, rename, or delete tags.

Changing or deleting a category or tag may affect existing transactions. The server decides whether a category in use can be deleted.

## Change servers

1. Open **Settings** → **Change server URL**.
2. Enter the new base address.
3. Tap **Save and sign in**.
4. Sign in to the new server.

Changing the server signs you out and clears cached financial data from the device. It does not delete anything from either server.

## Use the app offline

When your device loses its connection, a banner says **You're offline. Showing cached data.**

Previously loaded data may remain available:

- Owned accounts and balances
- Some counterparties
- Recent transactions
- Categories and tags
- Budgets you opened before going offline

Offline limitations:

- You cannot create, edit, or delete data.
- Transaction filters by category, expense group, or contract do not work.
- Reports generally need a connection.
- Data you have not opened or synchronized before may be missing.

Reconnect and pull down on a page to refresh it. The app also performs periodic background synchronization when Android allows it and a network is available.

## Sign out

1. Scroll to the bottom of **Settings**.
2. Tap **Sign out**.
3. Confirm **Sign out**.

Signing out removes your session and cached Pledger.io data from the device. Your server address is retained to make the next sign-in easier. Signing out does not delete server data.

## Update the app

The app displays its version under **Settings** → **About**. To update an APK installation:

1. Open the [latest Android app release](https://github.com/pledger-io/android-app/releases/latest).
2. Download the new `.apk`.
3. Open it and approve the update.

Install updates from the official repository only.

## Report a problem

1. Open **Settings** → **About** → **Report a problem**.
2. Describe what happened.
3. Review the information the app collected.
4. Continue to GitHub in your browser.
5. Review the issue form and submit it.

The app removes known sensitive values from its recent logs before preparing the report. Still review the form and remove any personal or financial information you do not want to share.

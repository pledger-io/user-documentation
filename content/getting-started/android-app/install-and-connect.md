---
title: Install and connect
description: Install the Android app, connect it to your Pledger.io server, and sign in.
icon: fab android
thumbnail: img/getting-started/android-app.svg
show_thumbnail: false
type: docs
weight: 1
---

## Before you begin

Make sure:

1. Your device runs Android 8.0 or newer.
2. Your Pledger.io server is running and accessible from your phone.
3. You know the server's public HTTPS address, for example `https://money.example.com`.
4. You have a username and password. The Android app cannot create users, so use the web app to [create a user](/getting-started/first-steps/create-user/) first.

>[!NOTE]
> The release app requires HTTPS. Plain `http://` addresses are supported only by developer builds.

## Install the app

The Android app is currently distributed as an APK:

1. On your Android device, open the [latest Android app release](https://github.com/pledger-io/android-app/releases/latest).
2. Under **Assets**, download the file ending in `.apk`.
3. Open the downloaded file.
4. If Android asks for permission, allow your browser or file manager to install apps from this source.
5. Tap **Install**, then open **Pledger.io**.

Android may warn you that the app came from outside the Play Store. Only install APKs downloaded from the official `pledger-io/android-app` repository.

## Connect to your server

The first time you open the app:

1. Enter the base address of your server in **Server URL**.
2. Tap **Connect**.
3. Wait for the green check mark. The app checks the server and then opens the sign-in screen.

Enter only the base address. Do not add `/v2/api`, `/health`, or another path.

| Correct | Incorrect |
|---------|-----------|
| `https://money.example.com` | `https://money.example.com/v2/api` |
| `https://pledger.example.org` | `pledger.example.org` |

## Sign in

1. Enter your **Username**.
2. Enter your **Password**.
3. Tap **Sign In**.

After a successful sign-in, the app opens the **Dashboard** and starts loading your Pledger.io data.

The Android app currently accepts username and password only. If your account requires two-factor authentication or your server uses OpenID Connect, sign-in from Android is not yet supported.

## Fix connection problems

### The app says the server was not found

- Check the spelling of the address, including `https://`.
- Open the same address in your phone's browser.
- Make sure the phone is connected to the correct Wi-Fi or VPN.
- If the server is on your home network, confirm that local network access is allowed.

### The app cannot connect to `localhost`

`localhost` means the Android device itself, not the computer that runs Pledger.io. Use an address your phone can reach, such as the computer's local network address or a public HTTPS hostname.

Android emulator users can use `10.0.2.2` to reach a server running on the development computer, but only a developer build allows plain HTTP.

### The app reports an HTTP error

- Confirm that the address points to a Pledger.io server.
- Remove paths such as `/login`, `/v2/api`, or `/health`.
- Check your reverse proxy and TLS certificate.

### Sign-in fails

- Try the same username and password in the web app.
- Check capitalization and remove accidental spaces.
- Confirm that your account does not require two-factor or OpenID Connect sign-in.

To use another server, tap **Change server** on the sign-in screen. After signing in, use **Settings** → **Change server URL**. Changing servers signs you out and clears cached financial data from the device.

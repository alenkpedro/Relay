<p align="center"><img src="relay-icon.png" width="128" alt=""></p>

<h1 align="center">Relay</h1>

<p align="center"><b>All your chats in one inbox, running entirely on your Mac.</b><br>
WhatsApp, Telegram, Signal, Discord, Instagram, Messenger, Slack, LinkedIn and more.</p>

<p align="center">
  <a href="https://github.com/alenkpedro/relay/releases/latest"><img src="https://img.shields.io/github/v/release/alenkpedro/relay?label=Download&style=for-the-badge&color=3b6cf6" alt="Download the latest version"></a>
</p>

<p align="center">macOS · Apple silicon and Intel · Updates itself</p>

<p align="center"><img src="screenshots/inbox-dark.png" alt="Relay inbox with chats from WhatsApp, Signal, Instagram, LinkedIn and more, and a WhatsApp conversation open"></p>

## Why Relay

- **One inbox for every network.** Each chat shows the logo of the network it comes from. Filter by network, keep groups in their own tab, and see what needs a reply first.
- **Nothing leaves your Mac.** Relay sets up its own small messaging server on your computer. There's no cloud, no Relay account, and your messages never pass through anyone else's servers. Each network sees Relay as a linked device, like WhatsApp Web.
- **Feels like the real apps.** Replies, reactions, edits, voice messages, read receipts, typing indicators, mentions, stickers, WhatsApp Status and Communities.
- **Make it yours.** Six styles, light and dark mode, accent colors and chat wallpapers.

## Make it yours

Pick a style, then mix it with light or dark mode, an accent color and a chat wallpaper.

<table>
  <tr>
    <td width="33%"><img src="screenshots/theme-aurora.png" alt="Aurora style, dark"></td>
    <td width="33%"><img src="screenshots/theme-amber.png" alt="Amber style with the Sunset wallpaper"></td>
    <td width="33%"><img src="screenshots/theme-ocean.png" alt="Ocean style with the Waves wallpaper"></td>
  </tr>
  <tr>
    <td align="center"><b>Aurora</b></td>
    <td align="center"><b>Amber</b> · Sunset wallpaper</td>
    <td align="center"><b>Ocean</b> · Waves wallpaper</td>
  </tr>
  <tr>
    <td><img src="screenshots/theme-aurora-light.png" alt="Aurora style in light mode with the Doodles wallpaper and a pink accent"></td>
    <td><img src="screenshots/theme-oled.png" alt="OLED style with the Night wallpaper and a green accent"></td>
    <td><img src="screenshots/theme-paper.png" alt="Paper style with a graphite accent"></td>
  </tr>
  <tr>
    <td align="center"><b>Aurora light</b> · Doodles, pink</td>
    <td align="center"><b>OLED</b> · Night, green</td>
    <td align="center"><b>Paper</b> · graphite</td>
  </tr>
</table>

<p align="center"><img src="screenshots/appearance.png" width="80%" alt="Appearance settings with the six styles: Classic, Aurora, Amber, Ocean, OLED and Paper"></p>

## Optional AI

Turn on AI and Relay can summarize, translate and plan your day. Run a model on your own Mac with [LM Studio](https://lmstudio.ai) and your messages still never leave it, or use the Claude, Codex, OpenCode or Gemini command-line apps if you already have them.

<table>
  <tr>
    <td width="50%"><img src="screenshots/ai-summary.png" alt="A summary of 10 unread messages in a group: main topics, decisions and questions for you"></td>
    <td width="50%"><img src="screenshots/ai-translate.png" alt="A Spanish message translated to English right under the original"></td>
  </tr>
  <tr>
    <td align="center"><b>What you missed:</b> a busy group in a few lines, with the decisions and the questions for you</td>
    <td align="center"><b>Translate</b> any message, or a whole chat automatically</td>
  </tr>
</table>

<p align="center"><img src="screenshots/ai-briefing.png" width="80%" alt="The daily briefing: priorities, plans, chats waiting for a reply and upcoming events"></p>
<p align="center"><b>Daily briefing:</b> what's waiting for your reply and what's coming up, in one place</p>

## Built for speed

<table>
  <tr>
    <td width="50%"><img src="screenshots/quick-switcher.png" alt="The quick switcher open over the inbox, searching chats, actions and settings"></td>
    <td width="50%"><img src="screenshots/group-light.png" alt="A WhatsApp family group in light mode, with an event detected in a message and a button to add it to the calendar"></td>
  </tr>
  <tr>
    <td align="center">Press <kbd>⌘</kbd> <kbd>K</kbd> to jump to any chat, action or setting</td>
    <td align="center">Dates in messages become one-click calendar events</td>
  </tr>
</table>

## Features

- Unified inbox with Main and Groups tabs, an Important section, and Reply / Waiting filters
- Several accounts per network, for example a personal and a Business WhatsApp
- Chats you archive or pin on your phone are archived or pinned in Relay too
- Replies, threads, reactions, edits, deletes, forwarding and multi-select
- Photos, videos and files up to 2 GB, with a preview and caption before sending
- Voice messages with waveform and playback speed
- Read receipts, typing indicators and @mentions; on WhatsApp, read without sending blue ticks
- Scheduled messages, reminders, quick replies and automations
- Native notifications, Dock badge and sounds
- End-to-end encryption, with your session stored in the macOS Keychain
- In 8 languages: English, Portuguese, Spanish, French, German, Italian, Japanese and Chinese

## Install

1. Download the `.dmg` for your Mac from the [latest release](https://github.com/alenkpedro/relay/releases/latest): `arm64` for Apple silicon (M1 or newer), `x64` for Intel.
2. Open it and drag Relay to **Applications**.
3. If macOS won't open it the first time, go to **System Settings → Privacy & Security → Open Anyway**.

Relay keeps itself up to date after that. Nothing else needs to be installed.

**Good to know**

- Messages arrive while your Mac is on and Relay is running (the window can be closed). Turn on **Settings → Open Relay when I log in**.
- Telegram needs a free API key from my.telegram.org. Relay walks you through it.
- Connecting a personal Discord, Instagram, Messenger, X or LinkedIn account through an unofficial client can go against those services' terms. Bans are rare, but possible.

## About this repository

This repository holds the Relay installers. The app's source code is not public.

`whatsapp-sync-login.patch` is a modification of [mautrix-whatsapp](https://github.com/mautrix/whatsapp) that Relay applies when it builds the WhatsApp bridge on your Mac. It is distributed under the **AGPL-3.0**, the same license as mautrix-whatsapp. Each release also includes the version of the patch it uses.

Versions up to 0.5.0 were published under the MIT license.

Relay is an independent project, not affiliated with Meta, Telegram, Signal, Discord, Slack, LinkedIn or any other network it connects to. Network names and logos belong to their owners. The people and conversations in the screenshots are fictional.

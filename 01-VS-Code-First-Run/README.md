# 01 - VS Code First Run

**Time:** 5 - 13 minutes (8 min)
**Owner:** Jeff
**Goal:** Orient attendees to the VS Code interface so every demo in the rest of the session makes sense.

## Why this section exists

Many attendees use VS Code daily but have never had a guided tour. Without a shared vocabulary (Activity Bar, Command Palette, integrated terminal) the rest of the demos lose half the audience. Eight minutes here saves thirty minutes of confusion later.

## Outcomes

By the end of this section attendees can:

- Name the five main UI regions and say what lives in each.
- Open any command by name using the Command Palette.
- Open a folder and understand what a `.code-workspace` file is.
- Reach the Settings UI and `settings.json` directly.
- Find and install an extension from the Extensions view.
- Open the integrated terminal and change its shell.

## Subtopics

- [ui-orientation.md](./ui-orientation.md) - Activity Bar, Side Bar, Editor, Panel, Status Bar
- [command-palette.md](./command-palette.md) - Ctrl+Shift+P and keyboard-first navigation
- [open-folder-workspace.md](./open-folder-workspace.md) - Opening a folder and .code-workspace files
- [settings-access.md](./settings-access.md) - Settings UI vs settings.json, scope orientation
- [extensions-view.md](./extensions-view.md) - Extensions view, browsing and installing
- [integrated-terminal.md](./integrated-terminal.md) - Integrated terminal, opening and switching shells

## Demo outline

1. Open VS Code to the Welcome tab. Point out the five UI regions (30 sec).
2. Hit `Ctrl+Shift+P`, type "Open Folder", press Enter. Open `Demos/MyDemoModule/`. (30 sec)
3. Show the Explorer view populate in the Side Bar.
4. Hit `Ctrl+Shift+P`, type "Preferences: Open Settings (UI)". Walk the search bar. (30 sec)
5. Hit `Ctrl+Shift+P`, type "Preferences: Open User Settings (JSON)". Show raw JSON. (20 sec)
6. Click the Extensions icon (or `Ctrl+Shift+X`). Search for "PowerShell". Do not install yet - that is section 02. (20 sec)
7. Open the integrated terminal (`Ctrl+backtick`). Show the shell picker. Switch to pwsh if not already there. (30 sec)

**Total:** ~4 minutes of live demo; 4 minutes of narration.

## Fallback (no projector / no keyboard)

Walk through the same steps verbally using the slide diagrams of each UI region. Attendees follow on their own laptops.

[Back to root](../README.md)

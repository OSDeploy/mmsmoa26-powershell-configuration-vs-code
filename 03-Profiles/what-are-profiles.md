# What are VS Code profiles

## Purpose

Explain the concept so attendees know what they are signing up for before we start clicking.

## Why it matters

A profile bundles the editor state that defines "your VS Code" into a switchable unit. Without profiles, settings, extensions, snippets, and keybindings are global - which is why so many setups become unmanageable over time.

## What a profile contains

- Settings (`settings.json`)
- Keybindings (`keybindings.json`)
- User snippets
- Tasks
- Installed extensions and per-extension state
- UI state (panel layout, view visibility)
- MCP servers and prompt files (recent versions)

## What a profile does NOT contain

- Workspace files
- Source control state
- The shell on your machine
- Account sign-ins (those are global)

## Demo steps

None for this subtopic; it is conceptual. Show one slide or just talk over the editor.

## Gotchas

- Extensions installed in one profile are not present in another. Plan for this; do not assume the PowerShell extension is loaded everywhere.
- Profiles are stored under `%APPDATA%\Code\User\profiles\<id>` on Windows.

## References

- Profiles overview: https://code.visualstudio.com/docs/configure/profiles

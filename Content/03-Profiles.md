# 03 - Profiles

**Time:** 18 - 30 minutes (12 min)
**Owner:** David
**Learning objective:** Create and manage customized VS Code profiles designed for effective PowerShell work.

---

## Section overview

### Why this section comes first

Profiles isolate everything else we are about to configure (settings, extensions, snippets, keybindings, UI state). Building a dedicated PowerShell profile means our recommended settings will not fight with someone else's TypeScript or .NET workflow on the same machine.

### Outcomes

By the end of this section attendees can:

1. Explain what a VS Code profile is and what it contains.
2. Create a new profile from a fresh install.
3. Switch between profiles per workspace or per window.
4. Export a profile to a `.code-profile` file and import one.
5. Sync a profile across machines with Settings Sync.

### Demo outline

1. Open VS Code with the **Default** profile selected (status bar, bottom-left gear icon).
2. Command Palette (`Ctrl+Shift+P`) -> `Profiles: Create Profile...` -> **From Template** -> name it `PowerShell-MMSMOA`.
3. Show the profile switcher (gear -> Profiles) and switch back and forth.
4. Show profile contents in `Profiles: Show Contents`.
5. Import the shipped profile from [Profile/](Profile/) via `Profiles: Import Profile...`.
6. Open a workspace and right-click the workspace name -> **Use Profile** to pin it.
7. Toggle `Settings Sync` and show the per-resource opt-out for profiles.

**Fallback if internet is down:** import the local `.code-profile` file instead of using a Settings Sync demo.

### Talking points

- Pre-profiles, every PowerShell author maintained a wall of settings that conflicted with other languages. Profiles end that.
- A profile is not a workspace; a profile is the editor configuration that a workspace uses.
- Profiles support Settings Sync, but each profile syncs independently.
- The shipped starter profile in `Profile/` is exactly what you would build live - we just give it to you.

### Gotchas

- The Default profile is special; deleting it is not allowed. Customize a copy.
- Profile changes apply immediately to the active window only; other windows must reload to pick up profile-scoped extension changes.
- `code --profile "Name"` launches a window with a specific profile from the CLI.

### References

- VS Code Profiles: https://code.visualstudio.com/docs/configure/profiles
- Settings Sync: https://code.visualstudio.com/docs/configure/settings-sync

---

## What are VS Code profiles

### Purpose

Explain the concept so attendees know what they are signing up for before we start clicking.

### Why it matters

A profile bundles the editor state that defines "your VS Code" into a switchable unit. Without profiles, settings, extensions, snippets, and keybindings are global - which is why so many setups become unmanageable over time.

### What a profile contains

- Settings (`settings.json`)
- Keybindings (`keybindings.json`)
- User snippets
- Tasks
- Installed extensions and per-extension state
- UI state (panel layout, view visibility)
- MCP servers and prompt files (recent versions)

### What a profile does NOT contain

- Workspace files
- Source control state
- The shell on your machine
- Account sign-ins (those are global)

### Demo steps

None for this subtopic; it is conceptual. Show one slide or just talk over the editor.

### Gotchas

- Extensions installed in one profile are not present in another. Plan for this; do not assume the PowerShell extension is loaded everywhere.
- Profiles are stored under `%APPDATA%\Code\User\profiles\<id>` on Windows.

### References

- Profiles overview: https://code.visualstudio.com/docs/configure/profiles

---

## Creating a profile

### Purpose

Walk through creating a dedicated PowerShell profile from scratch.

### Why it matters

You only get the isolation benefits of profiles if you actually create one and use it. The default profile is shared by every workspace until you say otherwise.

### Settings / commands

| Action                          | How                                             |
| ------------------------------- | ----------------------------------------------- |
| Create profile                  | `Ctrl+Shift+P` -> `Profiles: Create Profile...` |
| Switch profile (current window) | gear icon (bottom-left) -> Profiles -> pick     |
| Open new window with profile    | `Profiles: Open Profile in New Window`          |
| Launch from CLI                 | `code --profile "PowerShell-MMSMOA"`            |
| Pin a profile to a workspace    | right-click workspace name -> Use Profile       |
| Delete a profile                | `Profiles: Delete Profile...`                   |

### Demo steps

1. Start with VS Code on the Default profile.
2. `Ctrl+Shift+P` -> `Profiles: Create Profile...`
3. Choose **From Template** -> there is no PowerShell template, so pick **None** and name it `PowerShell-MMSMOA`.
4. Optional: choose an icon (terminal icon is a good fit).
5. Click **Create**. The window reloads into the new profile.
6. Confirm the profile name in the bottom-left gear menu.
7. Open a workspace folder and verify the profile follows: right-click the folder name in the Explorer title -> `Use Profile`.

### Gotchas

- Creating a profile **From Current Profile** copies extensions and settings - convenient but defeats the "fresh start" pitch. For the demo, start clean.
- The "Profiles" entry in the gear menu is hidden if your status bar is collapsed; expand it.

### References

- https://code.visualstudio.com/docs/configure/profiles#_create-a-profile

---

## Profile contents

### Purpose

Show attendees what is actually inside a profile so they can curate one intentionally.

### Why it matters

A profile is only as useful as what you put in it. A bloated profile defeats the isolation we are after; a sparse profile means switching to it gives you nothing.

### What goes in our PowerShell profile

| Resource    | What we ship                                                                                                                                                                                                                                                                                                                 |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Settings    | Formatter (OTBS), tabs=4, files.encoding=utf8bom, files.eol=`\r\n`, terminal default profile = PowerShell 7, telemetry off                                                                                                                                                                                                   |
| Keybindings | A few PowerShell-specific bindings (Run Selection, Format Document)                                                                                                                                                                                                                                                          |
| Snippets    | Function skeleton, Pester `Describe`, comment-based help block                                                                                                                                                                                                                                                               |
| Extensions  | `ms-vscode.powershell`, `github.copilot`, `github.copilot-chat`, `github.vscode-pull-request-github`, `github.vscode-github-actions`, `github.remotehub`, `editorconfig.editorconfig`, `streetsidesoftware.code-spell-checker`, `DavidAnson.vscode-markdownlint`, `tobysmith568.run-in-powershell`, `esbenp.prettier-vscode` |
| Tasks       | None at the profile level (tasks belong to workspaces)                                                                                                                                                                                                                                                                       |
| MCP servers | Optional - PSScriptAnalyzer or Pester MCP if used                                                                                                                                                                                                                                                                            |

### Demo steps

1. With the new profile active, run `Profiles: Show Contents`.
2. Walk through each tab: Settings, Keybindings, Snippets, Tasks, Extensions, UI State.
3. Show that the Extensions tab is empty initially - this is the "fresh install" baseline before section 04.

### Gotchas

- "UI State" includes things like panel layout and view visibility. A profile remembers the editor _shape_, not just the configuration.
- Workspace settings (`.vscode/settings.json` in a folder) override profile settings. Demonstrate this so attendees know it.

### References

- https://code.visualstudio.com/docs/configure/profiles#_profile-contents

---

## Import, export, and sync

### Purpose

Move a profile between machines or share one with a team.

### Why it matters

Building a profile once and re-using it everywhere is the whole point. Two paths: a portable file (`.code-profile`) or live sync via your GitHub / Microsoft account.

### Settings / commands

| Action               | How                                                    |
| -------------------- | ------------------------------------------------------ |
| Export to file       | `Profiles: Export Profile...` -> save `.code-profile`  |
| Export as Gist       | `Profiles: Export Profile...` -> sign in -> publish    |
| Import from file     | `Profiles: Import Profile...` -> pick file             |
| Import from URL      | `Profiles: Import Profile...` -> paste Gist URL        |
| Settings Sync on/off | `Settings Sync: Turn On/Off`                           |
| Per-resource opt-out | Settings Sync gear -> uncheck Profiles, Snippets, etc. |

### Demo steps

1. From the active `PowerShell-MMSMOA` profile, run `Profiles: Export Profile...`.
2. Save as `mmsmoa26.code-profile` to the Desktop.
3. Delete the profile (`Profiles: Delete Profile...`).
4. Run `Profiles: Import Profile...` and select the file. Confirm it returns identical.
5. Show `Settings Sync: Turn On` -> sign in with GitHub -> show the resource picker.
6. Note: profiles sync independently; switching profiles does not change which sync account is in use.

### Gotchas

- Exporting includes extension IDs but not extension secrets (e.g., GitHub auth tokens). Sign-ins do not transfer.
- A `.code-profile` file is JSON; you can read it. Do not commit one with sensitive workspace paths in the UI state.
- Settings Sync conflicts: if two machines edit settings.json at the same time, VS Code prompts to merge.

### References

- https://code.visualstudio.com/docs/configure/profiles#_import-export-profiles
- https://code.visualstudio.com/docs/configure/settings-sync

---

## Starter profile walkthrough

### Purpose

Show attendees the profile we built for them and how to load it.

### Why it matters

This is the "walk away with a customizable starter profile" deliverable from the session description.

### Where it lives

[Profile/](Profile/) in this repo:

- `settings.json` - source-of-truth settings
- `extensions.txt` - one extension ID per line
- `snippets/powershell.json` - PowerShell snippets
- `mmsmoa26.code-profile` - exported binary (generated at prep time)
- `README.md` - how to (re)build the export

### Three ways to get the starter profile

**Option 1 - Import the .code-profile file:**

1. Clone or download this repo.
2. In VS Code, `Profiles: Import Profile...`.
3. Pick `Profile/mmsmoa26.code-profile`.
4. Window reloads into the new profile. Done.

**Option 2 - Import via URL:**

1. `Profiles: Import Profile...` -> paste the Gist URL from the wrap-up slide.

**Option 3 - Build it yourself:**

1. Create a fresh profile (`Profiles: Create Profile...`).
2. Open `Profile/settings.json` and copy into your User Settings (JSON).
3. Bulk install extensions:

```powershell
Get-Content Profile\extensions.txt | ForEach-Object { code --install-extension $_ }
```

4. Copy `Profile/snippets/powershell.json` into your per-profile snippets folder.

### Demo steps

1. From a fresh VS Code window, `Profiles: Import Profile...`.
2. Select `mmsmoa26.code-profile` from the cloned repo (or paste the Gist URL we put on the slide).
3. The window reloads into a profile named `mmsmoa26`. Confirm the name in the gear menu.
4. Open [DemoRepo/](DemoRepo/) so the profile is in use against a real workspace.
5. Show the Extensions view: PowerShell, Copilot, GitHub PRs, GitHub Actions, GitHub Repositories, etc. all installed.
6. Open `MyDemoModule.psm1` to confirm syntax highlighting, formatting, and the Integrated Console all work without further setup.

### Verify the profile

```powershell
code --list-extensions
# Expect: ms-vscode.powershell, github.copilot, github.copilot-chat,
# github.vscode-pull-request-github, github.vscode-github-actions,
# github.remotehub, editorconfig.editorconfig, streetsidesoftware.code-spell-checker,
# DavidAnson.vscode-markdownlint, tobysmith568.run-in-powershell, esbenp.prettier-vscode
```

### Gotchas

- Importing creates a new profile; it does not overwrite an existing one. Rename or delete the old one if you want a clean slate.
- Extension installs may take 30 - 60 seconds on first import. Pre-import before the session if you can.
- The starter profile assumes PowerShell 7 is installed. The terminal default profile points at `pwsh.exe`.

### References

- [Profile/README.md](Profile/README.md)

---

## Pwsh + GitHub profile file

The file [03-Profiles/Pwsh + GitHub.code-profile](03-Profiles/Pwsh%20+%20GitHub.code-profile) is the exported VS Code profile used as the basis for this session. It is a JSON file with four top-level fields:

| Field         | Contents                                                                                                                                                                                                                                     |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `name`        | "Pwsh + GitHub"                                                                                                                                                                                                                              |
| `icon`        | "terminal"                                                                                                                                                                                                                                   |
| `settings`    | Serialized `settings.json` - Copilot Next Edit Suggestions enabled, Git auto-fetch, Prettier as JSON/Markdown formatter, Conventional Commits message instructions, files.autoSave, terminal scrollback, and UI preferences                  |
| `extensions`  | Array of extension objects with ID, display name, and pre-release flag - includes PowerShell, GitHub Copilot, GitHub Pull Requests, GitHub Actions, GitHub Repositories, markdownlint, EditorConfig, Prettier, Run in Powershell, and others |
| `globalState` | Serialized UI state - panel layout, view visibility, color theme (Dark Modern), activity bar pinning, and walkthrough history                                                                                                                |

The `globalState` section is large and machine-specific. It does not need to be customized; VS Code rebuilds UI state from the current environment on import.

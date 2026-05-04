# Accessing Settings

## Purpose

Show the two ways to open and edit VS Code settings and explain the three scopes so attendees know where a setting lives and which one wins.

## Why it matters

Settings are the foundation of everything in sections 03 and 04. Attendees who do not know the difference between User settings and Workspace settings will be confused when a setting they change in one place appears to have no effect because a narrower scope is overriding it.

## Two ways to open settings

### Settings UI

```text
Ctrl+,                                      (keyboard shortcut)
File > Preferences > Settings              (menu)
> Preferences: Open Settings (UI)          (Command Palette)
```

The Settings UI is a searchable form. Every setting shows its scope, description, and a link to the underlying JSON. Use it for discovery; use `settings.json` for bulk edits and version-controlled configuration.

### settings.json directly

```text
> Preferences: Open User Settings (JSON)    (Command Palette - User scope)
> Preferences: Open Workspace Settings (JSON) (Command Palette - Workspace scope)
```

Or click the **Open Settings (JSON)** icon in the top-right corner of the Settings UI.

## The three scopes

| Scope     | File location                                 | Wins over |
| --------- | --------------------------------------------- | --------- |
| User      | `%APPDATA%\Code\User\settings.json` (Windows) | Default   |
| Workspace | `.vscode/settings.json` in the open folder    | User      |
| Profile   | Stored inside the active profile              | Baseline  |

Narrower scope wins. A Workspace `settings.json` entry overrides the same User setting.

### Profile scope

When a profile is active, VS Code uses that profile's `settings.json` as the User-level baseline. Opening `Preferences: Open User Settings (JSON)` while a profile is active edits the profile's settings, not the global defaults. This is intentional and is why profiles are the first thing we configure in section 03.

### Workspace scope (.vscode/settings.json)

Settings committed to a repository travel with the code. Useful for:

- Enforcing consistent formatting rules across a team.
- Pointing the PowerShell extension at the correct PowerShell executable for a project.
- Setting `"files.encoding"` for a repo that requires a specific encoding.

Example `.vscode/settings.json`:

```json
{
  "editor.formatOnSave": true,
  "powershell.scriptAnalysis.settingsPath": "PSScriptAnalyzerSettings.psd1",
  "files.encoding": "utf8bom"
}
```

## Demo steps

1. Press `Ctrl+,`. In the search box, type "format on save". Show the checkbox.
2. Click the **Open Settings (JSON)** icon (top-right of the Settings UI). Show the raw JSON.
3. Press `Ctrl+Shift+P`. Type "Open Workspace Settings (JSON)". If a folder is open, show the `.vscode/settings.json` file (or a new empty one if none exists).
4. Point out the scope tabs at the top of the Settings UI: User, Workspace (visible only when a folder is open).

## Gotchas

- "User settings" when a profile is active means "this profile's settings," not the global defaults. Confirm the active profile in the Status Bar before editing.
- `.vscode/` is often in `.gitignore` by accident. It should usually be committed; `settings.json` and `extensions.json` are team artifacts.
- Renaming a setting key in a newer VS Code version leaves the old key as a harmless unknown; VS Code shows it underlined in yellow. Clean these up when you see them.

## References

- Settings documentation: https://code.visualstudio.com/docs/configure/settings
- Settings scope reference: https://code.visualstudio.com/docs/configure/settings#_settings-precedence


---

[Back to README](./README.md)
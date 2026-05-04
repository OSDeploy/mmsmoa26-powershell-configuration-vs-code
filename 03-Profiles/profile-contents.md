# Profile contents

## Purpose

Show attendees what is actually inside a profile so they can curate one intentionally.

## Why it matters

A profile is only as useful as what you put in it. A bloated profile defeats the isolation we are after; a sparse profile means switching to it gives you nothing.

## What goes in our PowerShell profile

| Resource    | What we ship                                                                                                                                                                                                                                                                                                                 |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Settings    | Formatter (OTBS), tabs=4, files.encoding=utf8bom, files.eol=`\r\n`, terminal default profile = PowerShell 7, telemetry off                                                                                                                                                                                                   |
| Keybindings | A few PowerShell-specific bindings (Run Selection, Format Document)                                                                                                                                                                                                                                                          |
| Snippets    | Function skeleton, Pester `Describe`, comment-based help block                                                                                                                                                                                                                                                               |
| Extensions  | `ms-vscode.powershell`, `github.copilot`, `github.copilot-chat`, `github.vscode-pull-request-github`, `github.vscode-github-actions`, `github.remotehub`, `editorconfig.editorconfig`, `streetsidesoftware.code-spell-checker`, `DavidAnson.vscode-markdownlint`, `tobysmith568.run-in-powershell`, `esbenp.prettier-vscode` |
| Tasks       | None at the profile level (tasks belong to workspaces)                                                                                                                                                                                                                                                                       |
| MCP servers | Optional - PSScriptAnalyzer or Pester MCP if used                                                                                                                                                                                                                                                                            |

## Demo steps

1. With the new profile active, run `Profiles: Show Contents`.
2. Walk through each tab: Settings, Keybindings, Snippets, Tasks, Extensions, UI State.
3. Show that the Extensions tab is empty initially - this is the "fresh install" baseline before section 04.

## Gotchas

- "UI State" includes things like panel layout and view visibility. A profile remembers the editor _shape_, not just the configuration.
- Workspace settings (`.vscode/settings.json` in a folder) override profile settings. Demonstrate this so attendees know it.

## References

- https://code.visualstudio.com/docs/configure/profiles#_profile-contents


---

[Back to README](./README.md)
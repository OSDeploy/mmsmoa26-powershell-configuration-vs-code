# 02 - Settings and Extensions

**Time:** 17 - 35 minutes (18 min)
**Owner:** David
**Learning objective:** Implement recommended settings, including formatting and security, as well as essential PowerShell extensions.

## Outcomes

By the end of this section attendees can:

1. Distinguish User, Workspace, and Profile settings.
2. Apply a recommended baseline of editor + PowerShell settings.
3. Configure Workspace Trust and other security-relevant settings.
4. Set up the PowerShell extension and the Integrated Console.
5. Format PowerShell with PSScriptAnalyzer and a chosen brace style.
6. Install a curated set of supporting extensions.
7. Add a few high-leverage snippets and keybindings.

## Subtopics

- [recommended-settings.md](./recommended-settings.md)
- [security-settings.md](./security-settings.md)
- [formatting.md](./formatting.md)
- [powershell-extension.md](./powershell-extension.md)
- [essential-extensions.md](./essential-extensions.md)
- [codelens.md](./codelens.md)
- [keybindings-and-snippets.md](./keybindings-and-snippets.md)

## Demo outline

1. Open Settings UI (`Ctrl+,`) and `Preferences: Open User Settings (JSON)` side by side.
2. Paste the recommended block from [recommended-settings.md](./recommended-settings.md). Highlight `files.encoding`, `files.eol`, `editor.formatOnSave`, `telemetry.telemetryLevel`.
3. Show Workspace Trust prompt by opening a folder you have not opened before.
4. Install the PowerShell extension (`ms-vscode.powershell`) live.
5. Open a `.ps1` file from `DemoRepo/`. Show the Integrated Console launches.
6. Place a breakpoint, hit `F5`, step through.
7. Right-click in editor -> Format Document. Switch `powershell.codeFormatting.preset` between `Custom`, `OTBS`, and `Stroustrup`.
8. Open the PSScriptAnalyzer view in the Problems panel.
9. Install GitHub PRs, GitHub Actions, GitHub Repositories, EditorConfig, Code Spell Checker live (queue them so they install in parallel).
10. Show a snippet expand: type `func` -> tab. Show a custom keybinding.

**Fallback:** if marketplace install fails, use a pre-staged extensions VSIX folder.

## Talking points

- Settings precedence: Default < User < Profile < Workspace < Folder.
- The PowerShell extension is the one extension you should not skip - everything else is taste.
- Workspace Trust is not theatre; it gates task auto-run and debug auto-attach in untrusted folders.
- Formatting is non-negotiable for shared modules. Pick a preset, commit a workspace setting, move on.

## References

- VS Code settings reference: https://code.visualstudio.com/docs/configure/settings
- PowerShell extension docs: https://code.visualstudio.com/docs/languages/powershell

[Back to root](../README.md)

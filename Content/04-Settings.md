# 04 - Settings

**Time:** 30 - 43 minutes (13 min)
**Owner:** David
**Learning objective:** Implement recommended settings, including formatting and security, for effective PowerShell work in VS Code.

---

## Section overview

### Outcomes

By the end of this section attendees can:

1. Distinguish User, Workspace, and Profile settings.
2. Apply a recommended baseline of editor + PowerShell settings.
3. Configure Workspace Trust and other security-relevant settings.
4. Set up the PowerShell extension and the Integrated Console.
5. Format PowerShell with PSScriptAnalyzer and a chosen brace style.
6. Add a few high-leverage snippets and keybindings.

**Settings precedence:** Default < User < Profile < Workspace < Folder

### Demo outline

1. Open Settings UI (`Ctrl+,`) and `Preferences: Open User Settings (JSON)` side by side.
2. Paste the recommended block from the Recommended settings section below. Highlight `files.encoding`, `files.eol`, `editor.formatOnSave`, `telemetry.telemetryLevel`.
3. Show Workspace Trust prompt by opening a folder you have not opened before.
4. Install the PowerShell extension (`ms-vscode.powershell`) live.
5. Open a `.ps1` file from `DemoRepo/`. Show the Integrated Console launches.
6. Place a breakpoint, hit `F5`, step through.
7. Right-click in editor -> Format Document. Switch `powershell.codeFormatting.preset` between `Custom`, `OTBS`, and `Stroustrup`.
8. Open the PSScriptAnalyzer view in the Problems panel.
9. Show a snippet expand: type `func` -> tab. Show a custom keybinding.

**Fallback:** if marketplace install fails, use a pre-staged extensions VSIX folder.

### Talking points

- Settings precedence: Default < User < Profile < Workspace < Folder.
- The PowerShell extension is the one extension you should not skip - everything else is taste.
- Workspace Trust is not theatre; it gates task auto-run and debug auto-attach in untrusted folders.
- Formatting is non-negotiable for shared modules. Pick a preset, commit a workspace setting, move on.

### References

- VS Code settings reference: https://code.visualstudio.com/docs/configure/settings
- PowerShell extension docs: https://code.visualstudio.com/docs/languages/powershell

---

## Recommended settings

### Purpose

Give attendees a defensible settings baseline they can paste into `settings.json`.

### Why it matters

Defaults are fine for casual editing; PowerShell module work needs deterministic encoding, line endings, and formatting. The same baseline shipped in [Profile/settings.json](Profile/settings.json).

### Settings (paste into User or Profile settings.json)

```json
{
  "editor.formatOnSave": true,
  "editor.formatOnPaste": false,
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "editor.rulers": [80, 120],
  "editor.renderWhitespace": "boundary",
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": "active",

  "files.encoding": "utf8bom",
  "files.eol": "\r\n",
  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,
  "files.autoSave": "onFocusChange",

  "[powershell]": {
    "editor.tabSize": 4,
    "editor.insertSpaces": true,
    "editor.semanticHighlighting.enabled": true,
    "files.encoding": "utf8bom"
  },

  "terminal.integrated.defaultProfile.windows": "PowerShell",
  "terminal.integrated.profiles.windows": {
    "PowerShell": {
      "source": "PowerShell",
      "icon": "terminal-powershell"
    }
  },

  "telemetry.telemetryLevel": "off",
  "update.mode": "start",
  "workbench.editor.enablePreview": false,
  "workbench.startupEditor": "none"
}
```

### Demo steps

1. `Preferences: Open User Settings (JSON)`.
2. Paste the block above.
3. Save. Reload not required.
4. Open a `.ps1` file from `DemoRepo/`, edit, save - format on save fires.
5. Show the file in `Get-Content -Path file.ps1 -Encoding Byte | Select-Object -First 3` to confirm UTF-8 BOM.

### Gotchas

- `"files.encoding": "utf8bom"` is critical for Windows PowerShell 5.1 compatibility. Without the BOM, PS 5.1 reads scripts as ANSI and corrupts non-ASCII characters.
- `"files.eol": "\r\n"` matches Windows tools; if your team is cross-platform, set per-language or rely on `.gitattributes`.
- `editor.formatOnPaste` is intentionally off - it surprises people pasting examples.

### References

- Settings reference: https://code.visualstudio.com/docs/configure/settings
- File encoding: https://code.visualstudio.com/docs/configure/settings#_files

---

## Security settings

### Purpose

Surface the settings that gate code execution and data exfiltration.

### Why it matters

VS Code can run tasks, debuggers, and extensions automatically when you open a folder. Workspace Trust is the gate. PowerShell adds Execution Policy on top. Telemetry and remote-content settings round out the basics.

### Settings

```json
{
  "security.workspace.trust.enabled": true,
  "security.workspace.trust.startupPrompt": "always",
  "security.workspace.trust.untrustedFiles": "prompt",
  "security.workspace.trust.banner": "always",

  "security.allowedUNCHosts": [],
  "security.promptForLocalFileProtocolHandling": true,

  "telemetry.telemetryLevel": "off",
  "redhat.telemetry.enabled": false,

  "powershell.scriptAnalysis.enable": true,
  "powershell.scriptAnalysis.settingsPath": "PSScriptAnalyzerSettings.psd1"
}
```

### Workspace Trust quick rules

| Action                 | Trusted | Untrusted |
| ---------------------- | ------- | --------- |
| Edit files             | Yes     | Yes       |
| Run tasks / debug      | Yes     | No        |
| Use most extensions    | Yes     | Limited   |
| Run PowerShell scripts | Yes     | Prompt    |

### PowerShell Execution Policy

Display, do not change live, the host policy:

```powershell
Get-ExecutionPolicy -List
```

Recommend `RemoteSigned` for CurrentUser. Do not recommend `Bypass` even for demos.

### Secrets handling

- Never paste secrets into `settings.json` (it syncs).
- Use `Microsoft.PowerShell.SecretManagement` + `Microsoft.PowerShell.SecretStore` for local secrets.
- Use `gh auth login` and Git Credential Manager - never store a PAT in plaintext.

### Demo steps

1. Open a folder you have never opened. Show the Workspace Trust modal.
2. Click "No, I don't trust the authors" and observe the disabled features.
3. Re-trust via `Workspaces: Manage Workspace Trust`.
4. Run `Get-ExecutionPolicy -List` in the integrated terminal.

### Gotchas

- Disabling Workspace Trust globally (`security.workspace.trust.enabled: false`) defeats the protection. Do not recommend.
- The `powershell.scriptAnalysis.settingsPath` is per-workspace - point it at a `PSScriptAnalyzerSettings.psd1` checked into the repo.

### References

- Workspace Trust: https://code.visualstudio.com/docs/editor/workspace-trust
- PowerShell about_Execution_Policies: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_execution_policies

---

## Formatting

### Purpose

Make every PowerShell file in the team look the same.

### Why it matters

Formatting arguments waste review cycles. Pick a preset, enforce it on save, and stop talking about it.

### Settings

```json
{
  "editor.formatOnSave": true,
  "[powershell]": {
    "editor.defaultFormatter": "ms-vscode.powershell"
  },
  "powershell.codeFormatting.preset": "OTBS",
  "powershell.codeFormatting.autoCorrectAliases": true,
  "powershell.codeFormatting.useCorrectCasing": true,
  "powershell.codeFormatting.trimWhitespaceAroundPipe": true,
  "powershell.codeFormatting.whitespaceAroundOperator": true,
  "powershell.codeFormatting.whitespaceAfterSeparator": true,
  "powershell.codeFormatting.alignPropertyValuePairs": true,
  "powershell.codeFormatting.useConstantStrings": true
}
```

### Brace presets

| Preset       | Looks like                                                            |
| ------------ | --------------------------------------------------------------------- |
| `Custom`     | Whatever your other settings say                                      |
| `Allman`     | Brace on next line (BSD style)                                        |
| `OTBS`       | One True Brace Style - opening brace on same line, `else` on new line |
| `Stroustrup` | Like OTBS but `else` on its own line                                  |

We recommend **OTBS** for new PowerShell modules. Match existing style if working in someone else's repo.

### PSScriptAnalyzer

The PowerShell extension uses PSScriptAnalyzer for both linting (squiggles in Problems panel) and formatting rules. To customize:

1. Add a `PSScriptAnalyzerSettings.psd1` to the workspace root.
2. Set `powershell.scriptAnalysis.settingsPath` in workspace settings.

Example `PSScriptAnalyzerSettings.psd1`:

```powershell
@{
    IncludeDefaultRules = $true
    Severity = @('Error','Warning','Information')
    ExcludeRules = @('PSUseShouldProcessForStateChangingFunctions')
    Rules = @{
        PSPlaceOpenBrace = @{
            Enable = $true
            OnSameLine = $true
            NewLineAfter = $true
            IgnoreOneLineBlock = $true
        }
        PSUseConsistentIndentation = @{
            Enable = $true
            IndentationSize = 4
            Kind = 'space'
        }
    }
}
```

### Demo steps

1. Open `DemoRepo/Public/Get-DemoStatus.ps1`.
2. Mangle the indentation, save - format on save restores it.
3. Toggle `powershell.codeFormatting.preset` from `OTBS` to `Stroustrup` and re-save to show the diff.
4. Add `PSScriptAnalyzerSettings.psd1` and watch the Problems panel update.

### Gotchas

- `useCorrectCasing` rewrites cmdlet casing on save. Some teams hate this; show the toggle.
- Formatting cannot fix logic. Show one PSScriptAnalyzer warning that formatting will not address (e.g., `PSAvoidUsingCmdletAliases`).

### References

- PSScriptAnalyzer: https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview
- PowerShell extension formatting: https://code.visualstudio.com/docs/languages/powershell#_formatting

---

## PowerShell extension

### Purpose

Install and tune the one extension that matters: `ms-vscode.powershell`.

### Why it matters

This extension brings the language server, the Integrated Console, debugging, IntelliSense, formatting, and PSScriptAnalyzer integration. Everything else is on top of this.

### Install

```powershell
code --install-extension ms-vscode.powershell
```

Or in the Extensions view, search "PowerShell" by Microsoft.

### Settings worth knowing

```json
{
  "powershell.powerShellDefaultVersion": "PowerShell (x64)",
  "powershell.integratedConsole.showOnStartup": false,
  "powershell.integratedConsole.focusConsoleOnExecute": false,
  "powershell.integratedConsole.suppressStartupBanner": true,
  "powershell.scriptAnalysis.enable": true,
  "powershell.codeFolding.showLastLine": true,
  "powershell.helpCompletion": "BlockComment",
  "powershell.debugging.createTemporaryIntegratedConsole": false
}
```

### Integrated Console

- Separate from the regular Integrated Terminal.
- Shares state with the editor (current `$_`, breakpoints, debug session).
- Switch to it with `PowerShell: Show Integrated Console`.

### Debugging

1. Open a `.ps1` file.
2. Click the gutter to set a breakpoint.
3. `F5` to run. Pick "Launch Current File" if prompted.
4. Use Variables, Watch, Call Stack views like any debugger.
5. Conditional breakpoints: right-click breakpoint -> Edit Breakpoint.

### Pester

- Test files matching `*.Tests.ps1` show inline "Run Tests" / "Debug Tests" links above each `Describe` and `It`.
- Run all tests via `Invoke-Pester` in the Integrated Console.
- See [DemoRepo/Tests/MyDemoModule.Tests.ps1](DemoRepo/Tests/MyDemoModule.Tests.ps1) during the demo.

### Demo steps

1. Install the extension live (or show it pre-installed in the starter profile).
2. Open `DemoRepo/MyDemoModule.psm1`. Show IntelliSense on a `Get-` cmdlet.
3. Set a breakpoint inside `Get-DemoStatus`. Hit `F5`. Step over.
4. Open the Pester test, click the inline "Run Tests" link, show passing output.
5. Generate comment-based help: place cursor above a function, type `##`, accept the snippet.

### Gotchas

- "PowerShell Preview" is a separate extension; do not run both at once.
- The Integrated Console can be confusing for users who expect it to be the regular terminal. Call it out.
- Module side effects in `.ps1` files run on `F5`. Wrap demos in `if (-not $args)` guards if needed.

### References

- https://code.visualstudio.com/docs/languages/powershell
- https://github.com/PowerShell/vscode-powershell

---

## CodeLens

### Purpose

Use VS Code's built-in CodeLens feature to surface contextual actions (run tests, references, debug) directly above PowerShell code without installing extra extensions.

### Why it matters

CodeLens is a core VS Code editor feature, not a marketplace extension. The PowerShell extension uses it to expose Pester "Run Tests" / "Debug Tests" links above each `Describe`, `Context`, and `It` block, and reference counts above functions. Knowing how to toggle it keeps the editor uncluttered for live demos and prevents the "where did my Run Tests link go?" moment.

### Settings / commands

```json
{
  "editor.codeLens": true,
  "editor.codeLensFontFamily": "",
  "editor.codeLensFontSize": 0,
  "powershell.pester.codeLens": true,
  "powershell.developer.codeLensTimeoutInMilliseconds": 5000
}
```

- `editor.codeLens` is the master switch; turn it off to hide all CodeLens entries everywhere.
- `powershell.pester.codeLens` controls just the Pester "Run / Debug Tests" links.
- Toggle live with the Command Palette: `View: Toggle CodeLens`.

### Demo steps

1. Open `DemoRepo/Tests/MyDemoModule.Tests.ps1`.
2. Point out the "Run Tests | Debug Tests" links above each `Describe` and `It`.
3. Click "Run Tests" - results appear in the Integrated Console.
4. Open `DemoRepo/Public/Get-DemoStatus.ps1`. Show the reference count CodeLens above the function name.
5. Run `View: Toggle CodeLens` from the Command Palette. The links disappear. Toggle back on.
6. Set `"editor.codeLens": false` in user settings to demonstrate the global off switch, then revert.

### Gotchas

- CodeLens for Pester only renders for files matching `*.Tests.ps1` and only after the PowerShell extension's language server has finished loading.
- Reference-count CodeLens can be slow on large files; the timeout is controlled by `powershell.developer.codeLensTimeoutInMilliseconds`.
- Some users find CodeLens visually noisy. Disable per-language with `"[powershell]": { "editor.codeLens": false }` if requested.
- CodeLens lines are not part of the file; they do not affect line numbers, formatting, or Git diffs.

### References

- VS Code CodeLens docs: https://code.visualstudio.com/docs/editor/editingevolved#_reference-information
- PowerShell extension settings: https://code.visualstudio.com/docs/languages/powershell
- Pester: https://pester.dev/

---

## Keybindings and snippets

### Purpose

Two small productivity multipliers for PowerShell authors.

### Why it matters

A handful of keybindings and snippets cover most of the boilerplate-heavy moments in PowerShell module work (function skeletons, `param` blocks, Pester scaffolds, comment-based help).

### Recommended keybindings

Open `Preferences: Open Keyboard Shortcuts (JSON)` and add:

```json
[
  {
    "key": "ctrl+f5",
    "command": "PowerShell.RunSelection",
    "when": "editorTextFocus && editorLangId == 'powershell'"
  },
  {
    "key": "ctrl+alt+f",
    "command": "editor.action.formatDocument",
    "when": "editorTextFocus && editorLangId == 'powershell'"
  },
  {
    "key": "ctrl+k ctrl+t",
    "command": "workbench.action.selectTheme"
  }
]
```

### Recommended snippets

Open `Preferences: Configure User Snippets` -> `powershell.json`. Or use the file we ship at [Profile/snippets/powershell.json](Profile/snippets/powershell.json).

Snippets included:

| Prefix   | Expands to                                                              |
| -------- | ----------------------------------------------------------------------- |
| `func`   | Advanced function skeleton with `[CmdletBinding()]`, `param`, `process` |
| `cbh`    | Comment-based help block                                                |
| `pester` | `Describe` / `Context` / `It` scaffold                                  |
| `psd1`   | Module manifest skeleton                                                |
| `try`    | try / catch / finally with `$ErrorActionPreference`                     |

### Demo steps

1. In a new `.ps1` file, type `func` -> Tab. Walk through the placeholders.
2. Above the function, type `cbh` -> Tab. Show the help block.
3. In a `*.Tests.ps1` file, type `pester` -> Tab.
4. Show `Ctrl+Alt+F` running the formatter.

### Gotchas

- Snippets are profile-scoped; switching profiles changes which snippets are available.
- Multi-cursor + snippet expansion behaves oddly; demo with a single cursor.
- The PowerShell extension also ships some built-in snippets (e.g., `function`); ours start with `func` to avoid the conflict.

### References

- Keybindings: https://code.visualstudio.com/docs/configure/keybindings
- User snippets: https://code.visualstudio.com/docs/editor/userdefinedsnippets

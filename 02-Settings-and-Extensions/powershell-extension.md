# PowerShell extension

## Purpose

Install and tune the one extension that matters: `ms-vscode.powershell`.

## Why it matters

This extension brings the language server, the Integrated Console, debugging, IntelliSense, formatting, and PSScriptAnalyzer integration. Everything else is on top of this.

## Install

```powershell
code --install-extension ms-vscode.powershell
```

Or in the Extensions view, search "PowerShell" by Microsoft.

## Settings worth knowing

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

## Integrated Console

- Separate from the regular Integrated Terminal.
- Shares state with the editor (current `$_`, breakpoints, debug session).
- Switch to it with `PowerShell: Show Integrated Console`.

## Debugging

1. Open a `.ps1` file.
2. Click the gutter to set a breakpoint.
3. `F5` to run. Pick "Launch Current File" if prompted.
4. Use Variables, Watch, Call Stack views like any debugger.
5. Conditional breakpoints: right-click breakpoint -> Edit Breakpoint.

## Pester

- Test files matching `*.Tests.ps1` show inline "Run Tests" / "Debug Tests" links above each `Describe` and `It`.
- Run all tests via `Invoke-Pester` in the Integrated Console.
- See [../DemoRepo/Tests/MyDemoModule.Tests.ps1](../DemoRepo/Tests/MyDemoModule.Tests.ps1) during the demo.

## Demo steps

1. Install the extension live (or show it pre-installed in the starter profile).
2. Open `DemoRepo/MyDemoModule.psm1`. Show IntelliSense on a `Get-` cmdlet.
3. Set a breakpoint inside `Get-DemoStatus`. Hit `F5`. Step over.
4. Open the Pester test, click the inline "Run Tests" link, show passing output.
5. Generate comment-based help: place cursor above a function, type `##`, accept the snippet.

## Gotchas

- "PowerShell Preview" is a separate extension; do not run both at once.
- The Integrated Console can be confusing for users who expect it to be the regular terminal. Call it out.
- Module side effects in `.ps1` files run on `F5`. Wrap demos in `if (-not $args)` guards if needed.

## References

- https://code.visualstudio.com/docs/languages/powershell
- https://github.com/PowerShell/vscode-powershell

# CodeLens

## Purpose

Use VS Code's built-in CodeLens feature to surface contextual actions (run tests, references, debug) directly above PowerShell code without installing extra extensions.

## Why it matters

CodeLens is a core VS Code editor feature, not a marketplace extension. The PowerShell extension uses it to expose Pester "Run Tests" / "Debug Tests" links above each `Describe`, `Context`, and `It` block, and reference counts above functions. Knowing how to toggle it keeps the editor uncluttered for live demos and prevents the "where did my Run Tests link go?" moment.

## Settings / commands

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

## Demo steps

1. Open `Demos/MyDemoModule/Tests/MyDemoModule.Tests.ps1`.
2. Point out the "Run Tests | Debug Tests" links above each `Describe` and `It`.
3. Click "Run Tests" - results appear in the Integrated Console.
4. Open `Demos/MyDemoModule/Public/Get-DemoStatus.ps1`. Show the reference count CodeLens above the function name.
5. Run `View: Toggle CodeLens` from the Command Palette. The links disappear. Toggle back on.
6. Set `"editor.codeLens": false` in user settings to demonstrate the global off switch, then revert.

## Gotchas

- CodeLens for Pester only renders for files matching `*.Tests.ps1` and only after the PowerShell extension's language server has finished loading.
- Reference-count CodeLens can be slow on large files; the timeout is controlled by `powershell.developer.codeLensTimeoutInMilliseconds`.
- Some users find CodeLens visually noisy. Disable per-language with `"[powershell]": { "editor.codeLens": false }` if requested.
- CodeLens lines are not part of the file; they do not affect line numbers, formatting, or Git diffs.

## References

- VS Code CodeLens docs: https://code.visualstudio.com/docs/editor/editingevolved#_reference-information
- PowerShell extension settings: https://code.visualstudio.com/docs/languages/powershell
- Pester: https://pester.dev/

[Back to README](./README.md)

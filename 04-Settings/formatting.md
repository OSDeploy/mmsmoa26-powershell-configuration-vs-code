# Formatting

## Purpose

Make every PowerShell file in the team look the same.

## Why it matters

Formatting arguments waste review cycles. Pick a preset, enforce it on save, and stop talking about it.

## Settings

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

## Brace presets

| Preset       | Looks like                                                            |
| ------------ | --------------------------------------------------------------------- |
| `Custom`     | Whatever your other settings say                                      |
| `Allman`     | Brace on next line (BSD style)                                        |
| `OTBS`       | One True Brace Style - opening brace on same line, `else` on new line |
| `Stroustrup` | Like OTBS but `else` on its own line                                  |

We recommend **OTBS** for new PowerShell modules. Match existing style if working in someone else's repo.

## PSScriptAnalyzer

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

## Demo steps

1. Open `Demos/MyDemoModule/Public/Get-DemoStatus.ps1`.
2. Mangle the indentation, save - format on save restores it.
3. Toggle `powershell.codeFormatting.preset` from `OTBS` to `Stroustrup` and re-save to show the diff.
4. Add `PSScriptAnalyzerSettings.psd1` and watch the Problems panel update.

## Gotchas

- `useCorrectCasing` rewrites cmdlet casing on save. Some teams hate this; show the toggle.
- Formatting cannot fix logic. Show one PSScriptAnalyzer warning that formatting will not address (e.g., `PSAvoidUsingCmdletAliases`).

## References

- PSScriptAnalyzer: https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview
- PowerShell extension formatting: https://code.visualstudio.com/docs/languages/powershell#_formatting


---

[Back to README](./README.md)
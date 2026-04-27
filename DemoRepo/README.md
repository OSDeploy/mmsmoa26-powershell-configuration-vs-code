# DemoRepo - MyDemoModule

A tiny PowerShell module used during the GitHub Integration and Copilot demos. It is intentionally minimal so that any change is easy to read in a diff on the projector.

## Structure

```
DemoRepo/
  MyDemoModule.psd1            # Module manifest
  MyDemoModule.psm1            # Module loader (dot-sources Public/Private)
  Public/
    Get-DemoStatus.ps1         # Exported function
    Get-DemoVersion.ps1        # Exported function
  Private/
    ConvertTo-DemoObject.ps1   # Internal helper
  Tests/
    MyDemoModule.Tests.ps1     # Pester 5 tests
  PSScriptAnalyzerSettings.psd1
  .gitignore
  .vscode/
    extensions.json            # Recommended extensions for this workspace
    settings.json              # Workspace settings (formatter, analyzer path)
```

## Quick start

```powershell
# From the DemoRepo folder
Import-Module .\MyDemoModule.psd1 -Force
Get-DemoVersion
Get-DemoStatus -ComputerName $env:COMPUTERNAME
```

## Run the tests

```powershell
Install-Module Pester -Scope CurrentUser -Force -SkipPublisherCheck
Invoke-Pester -Path .\Tests
```

## Used by

- [../05-GitHub-Integration/](../05-GitHub-Integration/) - clone, branch, commit, PR demo
- [../06-GitHub-Copilot/](../06-GitHub-Copilot/) - inline completions, chat, edit-mode demos

[Back to root](../README.md)

# Security settings

## Purpose

Surface the settings that gate code execution and data exfiltration.

## Why it matters

VS Code can run tasks, debuggers, and extensions automatically when you open a folder. Workspace Trust is the gate. PowerShell adds Execution Policy on top. Telemetry and remote-content settings round out the basics.

## Settings

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

## Workspace Trust quick rules

| Action | Trusted | Untrusted |
|--------|---------|-----------|
| Edit files | Yes | Yes |
| Run tasks / debug | Yes | No |
| Use most extensions | Yes | Limited |
| Run PowerShell scripts | Yes | Prompt |

## PowerShell Execution Policy

Display, do not change live, the host policy:

```powershell
Get-ExecutionPolicy -List
```

Recommend `RemoteSigned` for CurrentUser. Do not recommend `Bypass` even for demos.

## Secrets handling

- Never paste secrets into `settings.json` (it syncs).
- Use `Microsoft.PowerShell.SecretManagement` + `Microsoft.PowerShell.SecretStore` for local secrets.
- Use `gh auth login` and Git Credential Manager - never store a PAT in plaintext.

## Demo steps

1. Open a folder you have never opened. Show the Workspace Trust modal.
2. Click "No, I don't trust the authors" and observe the disabled features.
3. Re-trust via `Workspaces: Manage Workspace Trust`.
4. Run `Get-ExecutionPolicy -List` in the integrated terminal.

## Gotchas

- Disabling Workspace Trust globally (`security.workspace.trust.enabled: false`) defeats the protection. Do not recommend.
- The `powershell.scriptAnalysis.settingsPath` is per-workspace - point it at a `PSScriptAnalyzerSettings.psd1` checked into the repo.

## References

- Workspace Trust: https://code.visualstudio.com/docs/editor/workspace-trust
- PowerShell about_Execution_Policies: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_execution_policies


---

[Back to README](./README.md)
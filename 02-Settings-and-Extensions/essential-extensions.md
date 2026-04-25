# Essential extensions

## Purpose

A short, defensible list of extensions to install alongside the PowerShell extension.

## Why it matters

The marketplace is huge. Most attendees install too many extensions and slow VS Code to a crawl. This is the curated list we ship in the starter profile.

## The list

| ID | Name | Why |
|----|------|-----|
| `ms-vscode.powershell` | PowerShell | Required language support |
| `github.copilot` | GitHub Copilot | Inline AI completions (covered in section 04) |
| `github.copilot-chat` | GitHub Copilot Chat | Ask, edit, agent modes |
| `github.vscode-pull-request-github` | GitHub Pull Requests | Open and review PRs in-editor |
| `github.vscode-github-actions` | GitHub Actions | Watch workflow runs and read logs from the editor |
| `github.remotehub` | GitHub Repositories | Open and edit a remote GitHub repo without cloning |
| `editorconfig.editorconfig` | EditorConfig | Cross-editor formatting consistency |
| `streetsidesoftware.code-spell-checker` | Code Spell Checker | Catches typos in comments and strings |
| `DavidAnson.vscode-markdownlint` | markdownlint | Lints README and docs to catch broken Markdown |
| `tobysmith568.run-in-powershell` | Run in PowerShell | Right-click a `.ps1` to run it in a fresh PowerShell terminal |
| `esbenp.prettier-vscode` | Prettier | Formats JSON, YAML, and Markdown that ship alongside scripts |

## Install in bulk

```powershell
$Extensions = @(
    'ms-vscode.powershell',
    'github.copilot',
    'github.copilot-chat',
    'github.vscode-pull-request-github',
    'github.vscode-github-actions',
    'github.remotehub',
    'editorconfig.editorconfig',
    'streetsidesoftware.code-spell-checker',
    'DavidAnson.vscode-markdownlint',
    'tobysmith568.run-in-powershell',
    'esbenp.prettier-vscode'
)
foreach ($Ext in $Extensions) {
    code --install-extension $Ext
}
```

The same list lives in [../Profile/extensions.txt](../Profile/extensions.txt).

## Demo steps

1. Open Extensions view (`Ctrl+Shift+X`).
2. Show the Recommended tab if a workspace `.vscode/extensions.json` exists.
3. Run the bulk install in a terminal.
4. Reload window when prompted.

## Gotchas

- `github.copilot-chat` requires `github.copilot` to be signed in.
- `github.remotehub` opens a *virtual* workspace; the PowerShell Integrated Console will not start there. Use it for reading and small edits.
- Avoid extensions that overlap (e.g., multiple Git history viewers). Pick one.
- Theme/icon extensions are taste - keep them out of the recommended list if your team has a corporate brand.

## References

- Extension Marketplace: https://marketplace.visualstudio.com/vscode
- Workspace extension recommendations: https://code.visualstudio.com/docs/configure/extensions/extension-marketplace#_workspace-recommended-extensions

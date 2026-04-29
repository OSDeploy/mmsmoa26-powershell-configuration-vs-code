# 02 - Extensions

**Time:** 13 - 18 minutes (5 min) | **Owner:** David

Install a short, defensible list of extensions so every subsequent demo has the tools it needs.

---

## Section overview

**Why this section comes before Settings:**

Extensions that are not installed cannot be configured. Getting the extension list in first means the Settings section can immediately demo PSScriptAnalyzer, CodeLens, and the Integrated Console without interruption.

**By the end of this section you can:**

1. Install extensions individually and in bulk from the Extensions view.
2. Name the essential extensions for PowerShell work and explain why each is on the list.
3. Commit a `.vscode/extensions.json` file to recommend extensions to teammates.

**Demo outline:**

1. Press `Ctrl+Shift+X` to open the Extensions view.
2. Search for `ms-vscode.powershell`. Show the extension card; do NOT install yet.
3. Open the integrated terminal (`` Ctrl+` ``).
4. Paste and run the bulk install script below.
5. Return to the Extensions view. Press `Ctrl+Shift+X` and type `@installed` to show all installed extensions.
6. Reload the window when VS Code prompts.

**Fallback (no internet / slow conference Wi-Fi):** Switch to the pre-loaded profile that already has these extensions installed. Show the `@installed` list and the bulk script as reference only.

**Talking points:**

- This is the same list baked into the starter profile in `Profile/extensions.txt`. Import the profile instead of running the script if you want to skip the live install.
- The PowerShell extension is the only truly required one. Everything else is high-leverage but optional.
- Fewer extensions = faster startup. Resist the urge to install 40 extensions.

---

## Essential extensions

**The list:**

| ID                                      | Name                 | Why                                                           |
| --------------------------------------- | -------------------- | ------------------------------------------------------------- |
| `ms-vscode.powershell`                  | PowerShell           | Required language support                                     |
| `github.copilot`                        | GitHub Copilot       | Inline AI completions (covered in section 06)                 |
| `github.copilot-chat`                   | GitHub Copilot Chat  | Ask, edit, agent modes                                        |
| `github.vscode-pull-request-github`     | GitHub Pull Requests | Open and review PRs in-editor                                 |
| `github.vscode-github-actions`          | GitHub Actions       | Watch workflow runs and read logs from the editor             |
| `github.remotehub`                      | GitHub Repositories  | Open and edit a remote GitHub repo without cloning            |
| `editorconfig.editorconfig`             | EditorConfig         | Cross-editor formatting consistency                           |
| `streetsidesoftware.code-spell-checker` | Code Spell Checker   | Catches typos in comments and strings                         |
| `DavidAnson.vscode-markdownlint`        | markdownlint         | Lints README and docs to catch broken Markdown                |
| `tobysmith568.run-in-powershell`        | Run in PowerShell    | Right-click a `.ps1` to run it in a fresh PowerShell terminal |
| `esbenp.prettier-vscode`                | Prettier             | Formats JSON, YAML, and Markdown that ship alongside scripts  |

**Install in bulk:**

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

The same list lives in `Profile/extensions.txt` in the repo.

**Or install one by one from the terminal:**

```powershell
Get-Content Profile\extensions.txt | ForEach-Object { code --install-extension $_ }
```

**Demo steps:**

1. Open Extensions view (`Ctrl+Shift+X`).
2. Show the Recommended tab if a workspace `.vscode/extensions.json` exists.
3. Run the bulk install in a terminal.
4. Reload window when prompted.

**Gotchas:**

- `github.copilot-chat` requires `github.copilot` to be signed in.
- `github.remotehub` opens a virtual workspace; the PowerShell Integrated Console will not start there. Use it for reading and small edits.
- Avoid extensions that overlap (e.g., multiple Git history viewers). Pick one.
- Theme/icon extensions are taste - keep them out of the recommended list if your team has a corporate brand.

**References:**

- Extension Marketplace: https://marketplace.visualstudio.com/vscode
- Workspace extension recommendations: https://code.visualstudio.com/docs/configure/extensions/extension-marketplace#_workspace-recommended-extensions

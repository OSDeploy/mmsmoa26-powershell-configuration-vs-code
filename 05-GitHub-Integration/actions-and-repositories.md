# GitHub Actions and GitHub Repositories

## Purpose

Two GitHub-published extensions that round out the in-editor GitHub experience: monitor CI from the editor, and browse remote repos without cloning.

## Why it matters

- **GitHub Actions** lets you watch workflow runs and read logs without leaving VS Code. For PowerShell modules that test on Windows / Linux / multi-version PowerShell, this saves browser tab churn.
- **GitHub Repositories** mounts a remote repo as a virtual workspace. You can read, edit small things, and even commit without ever cloning to disk - useful on a fresh machine or a locked-down corporate laptop.

## Extensions

| ID                             | Name                | What it adds                                                       |
| ------------------------------ | ------------------- | ------------------------------------------------------------------ |
| `github.vscode-github-actions` | GitHub Actions      | Workflow runs, logs, secrets/vars browse, workflow YAML completion |
| `github.remotehub`             | GitHub Repositories | Open and edit a GitHub repo as a virtual workspace, no clone       |

Install:

```powershell
code --install-extension github.vscode-github-actions
code --install-extension github.remotehub
```

Both are in the starter profile.

## GitHub Actions in VS Code

- Sidebar: **GitHub Actions** view shows Workflows, recent Runs, secrets/vars (read-only by default).
- Click a run -> see jobs, steps, and live-streaming logs.
- Re-run a failed run from the run's context menu.
- Schema-aware editing for `.github/workflows/*.yml` (completion, validation).

### Settings worth knowing

```json
{
  "github-actions.workflows.pinned.workflows": [".github/workflows/ci.yml"],
  "github-actions.workflows.pinned.refresh.enabled": true,
  "github-actions.workflows.pinned.refresh.interval": 60
}
```

## GitHub Repositories (Remote Repositories)

- Command Palette -> `Remote Repositories: Open Remote Repository...`
- Pick `Open Repository from GitHub` -> search by name.
- VS Code opens a virtual workspace (status bar shows `github.com/owner/repo`).
- Read every file. Edit and commit small fixes. Open in Codespaces or `Continue Working On...` -> clone locally when the change gets bigger.

### Limits to call out

- No terminal, no debugger, no extension that needs the file system (PowerShell extension's Integrated Console will not run in a virtual workspace).
- Use it for reading and small edits, not for module development.

## Demo steps

1. **Actions:** Open the cloned session repo (or `Demos/MyDemoModule/`). Open the GitHub Actions view. Show the latest run with green checks.
2. Open `.github/workflows/ci.yml`. Show YAML completion (start typing `runs-on:` and let it suggest).
3. Click a step in a run -> show the streamed log inline.
4. **Repositories:** `Remote Repositories: Open Remote Repository...` -> pick `microsoft/PowerShell`. Show the read-only file tree open in seconds, no clone.
5. Edit a README locally just enough to show the commit prompt, then discard.

## Gotchas

- GitHub Actions extension requires the same GitHub sign-in used by Source Control / PRs.
- GitHub Repositories opens a _virtual_ workspace. Many extensions disable themselves; this is intentional, not a bug.
- For private repos, both extensions respect your permissions; if a feature is missing, check your token scopes on github.com.
- Editing a workflow file in a virtual workspace and committing triggers the workflow immediately - just like a normal commit.

## References

- GitHub Actions extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions
- GitHub Repositories (RemoteHub): https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub
- Virtual Workspaces: https://code.visualstudio.com/api/extension-guides/virtual-workspaces
- GitHub Actions docs: https://docs.github.com/en/actions

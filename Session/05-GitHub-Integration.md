# 05 - GitHub Integration

**Time:** 43 - 55 minutes (12 min)
**Owner:** Jeff
**Learning objective:** Integrate VS Code with GitHub for efficient cloning, branching, committing, and change review.

---

## Section overview

### Outcomes

By the end of this section attendees can:

1. Distinguish Git (local) from GitHub (remote service).
2. Authenticate VS Code to GitHub once and have it stick.
3. Clone a repo and open it in a profile-aware window.
4. Create a branch, commit, and push from the Source Control view.
5. Open and review a pull request without leaving VS Code.
6. Watch GitHub Actions workflow runs and browse remote repos without cloning.

### Demo outline

1. Show Accounts (bottom-left avatar) -> Sign in to GitHub. Browser hand-off.
2. `Git: Clone` -> pick the local `DemoRepo/` (or this session repo on GitHub).
3. Open in new window. Workspace Trust prompt -> Trust.
4. Source Control view: create a branch (`feature/add-status-message`).
5. Edit `MyDemoModule.psm1`. Stage hunk -> commit -> push (publish branch).
6. `GitHub Pull Requests: Create Pull Request`. Fill in title and description. Create as draft.
7. Switch to PR view, review files, leave a comment, mark ready for review.
8. Open the GitHub Actions view, click the most recent run, drill into a step's log.
9. `Remote Repositories: Open Remote Repository...` -> pick a public repo (e.g., `microsoft/PowerShell`) to show browsing without cloning.

**Fallback:** if marketplace or GitHub auth is unavailable, do the local Git half (init, branch, commit) without push/PR.

### Talking points

- Source Control in VS Code is Git; GitHub PRs is a separate extension that talks to the GitHub API.
- One sign-in covers Source Control auth, the PR extension, and Copilot if you use the same GitHub account.
- Git Credential Manager handles OAuth token refresh - do not paste a PAT into Git config.
- For PowerShell modules, branch-per-feature + PR is enough process for most teams. Do not over-engineer.

### References

- Source Control in VS Code: https://code.visualstudio.com/docs/sourcecontrol/overview
- GitHub Pull Requests extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github
- GitHub Actions extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions
- GitHub Repositories extension: https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub

---

## Git vs GitHub

### Purpose

Clear up a confusion that wastes the first 30 seconds of every Git conversation.

### Why it matters

Attendees will see two different things in VS Code: the **Source Control** view (Git) and the **GitHub** views (Pull Requests, Issues). They are not the same thing.

### The split

| Concept                           | What                                            | Where in VS Code              |
| --------------------------------- | ----------------------------------------------- | ----------------------------- |
| Git                               | Distributed version control                     | Source Control view, built in |
| GitHub                            | A hosted Git platform with PRs, issues, Actions | GitHub PRs extension          |
| GitLab / Azure DevOps / Bitbucket | Other hosted Git platforms                      | Their own extensions          |

### What VS Code can do without GitHub

- Init a repo
- Stage, commit, branch, merge, rebase
- Compare working tree to HEAD
- Push to any remote (including a file share)

### What you need GitHub for

- Pull requests
- Issues
- Actions
- Sharing with people who do not have your laptop

### Demo steps

None standalone; covered in the rest of the section.

### Gotchas

- "Source Control" sometimes shows GitHub-specific commands once the GitHub PRs extension is loaded. They are still GitHub features under the hood.
- A repo can have multiple remotes (e.g., a fork on GitHub plus an internal mirror). VS Code supports it; the UI just shows the active one.

### References

- https://docs.github.com/en/get-started/using-git

---

## Authentication and trust

### Purpose

Get signed in once, securely, and not think about it again.

### Why it matters

Auth failures are the most common reason a "quick demo" stops being quick. Set this up before walking on stage and it stays out of the way.

### Sign-in flow

1. Click the Accounts icon (avatar, bottom-left).
2. Choose `Sign in with GitHub to use GitHub features`.
3. Browser opens -> approve -> redirect back to VS Code.
4. The same token is used by Source Control auth (push/pull) and the GitHub PRs extension.

### Git Credential Manager

VS Code on Windows uses Git Credential Manager (GCM) shipped with Git for Windows. Verify:

```powershell
git config --global credential.helper
# Expect: manager
```

Do not paste a PAT into a `.gitconfig`. GCM handles OAuth token refresh automatically.

### Signed commits (optional but recommended)

```powershell
git config --global user.name  "David Segura"
git config --global user.email "david@example.com"
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey "$HOME\.ssh\id_ed25519.pub"
```

Then upload the public key to GitHub -> Settings -> SSH and GPG keys -> New SSH key (type: Signing).

### Workspace Trust on cloned repos

Cloning prompts for trust on first open. Trust the local clone of the session repo and `DemoRepo/`. Untrusted folders cannot run tasks or debug.

### Demo steps

1. Sign in to GitHub via Accounts.
2. Run `git config --global credential.helper` to show GCM.
3. (Pre-staged) show a signed commit on `github.com` with the green "Verified" badge.
4. Open a freshly cloned repo and trust it.

### Gotchas

- Corporate proxies break browser-based OAuth. Have a `gh auth login --with-token` fallback ready.
- Two accounts on the same machine? Sign out completely; do not stack accounts in the Accounts view.
- VS Code sometimes caches a stale token; `Developer: Reload Window` after sign-in fixes most issues.

### References

- VS Code authentication: https://code.visualstudio.com/docs/sourcecontrol/github#_authentication
- Git Credential Manager: https://github.com/GitCredentialManager/git-credential-manager
- Signed commits: https://docs.github.com/en/authentication/managing-commit-signature-verification

---

## Clone and open

### Purpose

Get a repo from GitHub onto disk and into VS Code with one command.

### Why it matters

The Command Palette `Git: Clone` flow is faster than the GitHub website -> Code -> copy URL -> terminal -> `git clone` dance.

### Settings / commands

| Command                  | What it does                                               |
| ------------------------ | ---------------------------------------------------------- |
| `Git: Clone`             | Prompts for URL or browses GitHub repos you have access to |
| `GitHub: Clone`          | Same, scoped to the signed-in GitHub account               |
| `Git: Clone (Recursive)` | Includes submodules                                        |
| `code <folder>`          | Open a folder from the terminal                            |

### Demo steps

1. `Ctrl+Shift+P` -> `Git: Clone`.
2. Type a few characters of the org name; pick this session's repo from the suggestion list.
3. Pick a parent folder (e.g., `C:\Code`).
4. When prompted "Open the cloned repository?", choose **Open in New Window**.
5. Workspace Trust prompt -> Trust the folder and parent.
6. Show the profile in the new window matches the one built in section 03.

### Gotchas

- The clone target path is remembered; subsequent clones default to the same parent folder.
- "Open in New Window" preserves the original window's profile context. "Open in Current Window" replaces it.
- HTTPS clone uses GCM; SSH clone uses your SSH agent. Pick one and stick with it.

### References

- https://code.visualstudio.com/docs/sourcecontrol/github#_cloning-a-repository

---

## Branching and committing

### Purpose

The day-to-day Git workflow inside VS Code: branch, edit, stage, commit, push.

### Why it matters

Most PowerShell module changes are a small branch, a few commits, a PR. Do that smoothly without the terminal and you stay focused on the code.

### Settings worth setting

```json
{
  "git.autofetch": true,
  "git.autofetchPeriod": 180,
  "git.confirmSync": false,
  "git.enableSmartCommit": false,
  "git.suggestSmartCommit": false,
  "git.branchProtection": ["main", "master"],
  "git.branchProtectionPrompt": "alwaysPrompt",
  "git.openRepositoryInParentFolders": "always",
  "git.postCommitCommand": "push"
}
```

### The flow

1. Pull `main`: Source Control view -> ... menu -> Pull.
2. Create a branch: `Git: Create Branch...` -> name `feature/add-status-message`.
3. Edit a file in `DemoRepo/`.
4. Source Control view shows the change. Hover the file -> `+` to stage. Or stage a single hunk from the diff editor.
5. Type a commit message in the Source Control input (`Ctrl+Enter` to commit).
6. With `git.postCommitCommand: push` set, the commit auto-pushes (publishing the branch on first push).

### Commit message tips

- Imperative mood: "Add status message" not "Added status message".
- First line under 72 chars; blank line; details below.
- Reference issues with `#123`.

### Demo steps

1. Create branch `feature/add-status-message`.
2. Edit `DemoRepo/MyDemoModule.psm1` to add a `Write-Verbose 'Status checked'` line.
3. Stage just that hunk from the diff editor.
4. Commit with message `Add status verbose message`.
5. Show the branch published on GitHub.

### Gotchas

- `git.enableSmartCommit` auto-stages everything when nothing is staged. Disable it; it surprises people.
- Branch protection prompt fires when you try to commit directly to `main`. Useful guardrail.
- `Ctrl+Enter` in the commit message box commits; `Enter` adds a newline. Easy to mix up.

### References

- Source Control overview: https://code.visualstudio.com/docs/sourcecontrol/overview

---

## Pull requests and review

### Purpose

Open and review a pull request without leaving VS Code.

### Why it matters

Switching to a browser to review a PR breaks flow. The GitHub Pull Requests extension brings PRs into the editor with diff, comments, and check status.

### Extension

- ID: `github.vscode-pull-request-github`
- Installed by the starter profile.

### Create a PR

1. After pushing your branch, the Source Control view shows a **Create Pull Request** button.
2. Click it -> a PR draft form opens in the editor.
3. Fill title and description. Add reviewers, assignees, labels.
4. Click **Create as Draft** for early work, or **Create** for ready-to-review.

### Review a PR

1. GitHub view (left sidebar, Octocat icon) -> select a PR from the list.
2. **Description** tab shows checks, conversation, status.
3. **Files Changed** opens diffs in the editor.
4. Add a comment on a line: hover the gutter -> `+` icon.
5. **Start Review** to batch comments. Submit as Comment, Approve, or Request Changes.
6. **Checkout** the PR locally to test it without leaving the window.

### Settings worth knowing

```json
{
  "githubPullRequests.pullBranch": "always",
  "githubPullRequests.fileListLayout": "tree",
  "githubPullRequests.defaultMergeMethod": "squash",
  "githubPullRequests.notifications": "pullRequests"
}
```

### Demo steps

1. From the pushed `feature/add-status-message` branch, create a PR titled "Add status verbose message".
2. Open the PR from the GitHub view.
3. Comment on the new line. Submit review.
4. Checkout the PR locally and run `Invoke-Pester` from the Integrated Console to show "test the PR" workflow.
5. Merge the PR (squash) and show the branch is auto-deleted.

### Gotchas

- The extension respects your account's permissions; if you cannot push to the repo, "Create PR" creates a fork PR.
- Draft PRs do not trigger required reviewers, but they do trigger Actions.
- Squash merge with a clean title keeps `main`'s history readable - prefer it for module repos.

### References

- https://github.com/microsoft/vscode-pull-request-github
- https://docs.github.com/en/pull-requests

---

## GitHub Actions and GitHub Repositories

### Purpose

Two GitHub-published extensions that round out the in-editor GitHub experience: monitor CI from the editor, and browse remote repos without cloning.

### Why it matters

- **GitHub Actions** lets you watch workflow runs and read logs without leaving VS Code. For PowerShell modules that test on Windows / Linux / multi-version PowerShell, this saves browser tab churn.
- **GitHub Repositories** mounts a remote repo as a virtual workspace. You can read, edit small things, and even commit without ever cloning to disk - useful on a fresh machine or a locked-down corporate laptop.

### Extensions

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

### GitHub Actions in VS Code

- Sidebar: **GitHub Actions** view shows Workflows, recent Runs, secrets/vars (read-only by default).
- Click a run -> see jobs, steps, and live-streaming logs.
- Re-run a failed run from the run's context menu.
- Schema-aware editing for `.github/workflows/*.yml` (completion, validation).

#### Settings worth knowing

```json
{
  "github-actions.workflows.pinned.workflows": [".github/workflows/ci.yml"],
  "github-actions.workflows.pinned.refresh.enabled": true,
  "github-actions.workflows.pinned.refresh.interval": 60
}
```

### GitHub Repositories (Remote Repositories)

- Command Palette -> `Remote Repositories: Open Remote Repository...`
- Pick `Open Repository from GitHub` -> search by name.
- VS Code opens a virtual workspace (status bar shows `github.com/owner/repo`).
- Read every file. Edit and commit small fixes. Open in Codespaces or `Continue Working On...` -> clone locally when the change gets bigger.

#### Limits to call out

- No terminal, no debugger, no extension that needs the file system (PowerShell extension's Integrated Console will not run in a virtual workspace).
- Use it for reading and small edits, not for module development.

### Demo steps

1. **Actions:** Open the cloned session repo (or `DemoRepo/`). Open the GitHub Actions view. Show the latest run with green checks.
2. Open `.github/workflows/ci.yml`. Show YAML completion (start typing `runs-on:` and let it suggest).
3. Click a step in a run -> show the streamed log inline.
4. **Repositories:** `Remote Repositories: Open Remote Repository...` -> pick `microsoft/PowerShell`. Show the read-only file tree open in seconds, no clone.
5. Edit a README locally just enough to show the commit prompt, then discard.

### Gotchas

- GitHub Actions extension requires the same GitHub sign-in used by Source Control / PRs.
- GitHub Repositories opens a _virtual_ workspace. Many extensions disable themselves; this is intentional, not a bug.
- For private repos, both extensions respect your permissions; if a feature is missing, check your token scopes on github.com.
- Editing a workflow file in a virtual workspace and committing triggers the workflow immediately - just like a normal commit.

### References

- GitHub Actions extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions
- GitHub Repositories (RemoteHub): https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub
- Virtual Workspaces: https://code.visualstudio.com/api/extension-guides/virtual-workspaces
- GitHub Actions docs: https://docs.github.com/en/actions

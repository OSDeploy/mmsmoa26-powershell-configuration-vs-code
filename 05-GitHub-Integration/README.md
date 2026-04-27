# 05 - GitHub Integration

**Time:** 43 - 55 minutes (12 min)
**Owner:** Jeff
**Learning objective:** Integrate VS Code with GitHub for efficient cloning, branching, committing, and change review.

## Outcomes

By the end of this section attendees can:

1. Distinguish Git (local) from GitHub (remote service).
2. Authenticate VS Code to GitHub once and have it stick.
3. Clone a repo and open it in a profile-aware window.
4. Create a branch, commit, and push from the Source Control view.
5. Open and review a pull request without leaving VS Code.
6. Watch GitHub Actions workflow runs and browse remote repos without cloning.

## Subtopics

- [git-vs-github.md](./git-vs-github.md)
- [auth-and-trust.md](./auth-and-trust.md)
- [clone-and-open.md](./clone-and-open.md)
- [branching-and-committing.md](./branching-and-committing.md)
- [pull-requests-and-review.md](./pull-requests-and-review.md)
- [actions-and-repositories.md](./actions-and-repositories.md)

## Demo outline

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

## Talking points

- Source Control in VS Code is Git; GitHub PRs is a separate extension that talks to the GitHub API.
- One sign-in covers Source Control auth, the PR extension, and Copilot if you use the same GitHub account.
- Git Credential Manager handles OAuth token refresh - do not paste a PAT into Git config.
- For PowerShell modules, branch-per-feature + PR is enough process for most teams. Do not over-engineer.

## References

- Source Control in VS Code: https://code.visualstudio.com/docs/sourcecontrol/overview
- GitHub Pull Requests extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github
- GitHub Actions extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions
- GitHub Repositories extension: https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub

[Back to root](../README.md)

# Pull requests and review

## Purpose

Open and review a pull request without leaving VS Code.

## Why it matters

Switching to a browser to review a PR breaks flow. The GitHub Pull Requests extension brings PRs into the editor with diff, comments, and check status.

## Extension

- ID: `github.vscode-pull-request-github`
- Installed by the starter profile.

## Create a PR

1. After pushing your branch, the Source Control view shows a **Create Pull Request** button.
2. Click it -> a PR draft form opens in the editor.
3. Fill title and description. Add reviewers, assignees, labels.
4. Click **Create as Draft** for early work, or **Create** for ready-to-review.

## Review a PR

1. GitHub view (left sidebar, Octocat icon) -> select a PR from the list.
2. **Description** tab shows checks, conversation, status.
3. **Files Changed** opens diffs in the editor.
4. Add a comment on a line: hover the gutter -> `+` icon.
5. **Start Review** to batch comments. Submit as Comment, Approve, or Request Changes.
6. **Checkout** the PR locally to test it without leaving the window.

## Settings worth knowing

```json
{
  "githubPullRequests.pullBranch": "always",
  "githubPullRequests.fileListLayout": "tree",
  "githubPullRequests.defaultMergeMethod": "squash",
  "githubPullRequests.notifications": "pullRequests"
}
```

## Demo steps

1. From the pushed `feature/add-status-message` branch, create a PR titled "Add status verbose message".
2. Open the PR from the GitHub view.
3. Comment on the new line. Submit review.
4. Checkout the PR locally and run `Invoke-Pester` from the Integrated Console to show "test the PR" workflow.
5. Merge the PR (squash) and show the branch is auto-deleted.

## Gotchas

- The extension respects your account's permissions; if you cannot push to the repo, "Create PR" creates a fork PR.
- Draft PRs do not trigger required reviewers, but they do trigger Actions.
- Squash merge with a clean title keeps `main`'s history readable - prefer it for module repos.

## References

- https://github.com/microsoft/vscode-pull-request-github
- https://docs.github.com/en/pull-requests


---

[Back to README](./README.md)
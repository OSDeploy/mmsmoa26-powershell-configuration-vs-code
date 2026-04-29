# Git vs GitHub

## Purpose

Clear up a confusion that wastes the first 30 seconds of every Git conversation.

## Why it matters

Attendees will see two different things in VS Code: the **Source Control** view (Git) and the **GitHub** views (Pull Requests, Issues). They are not the same thing.

## The split

| Concept | What | Where in VS Code |
|---------|------|------------------|
| Git | Distributed version control | Source Control view, built in |
| GitHub | A hosted Git platform with PRs, issues, Actions | GitHub PRs extension |
| GitLab / Azure DevOps / Bitbucket | Other hosted Git platforms | Their own extensions |

## What VS Code can do without GitHub

- Init a repo
- Stage, commit, branch, merge, rebase
- Compare working tree to HEAD
- Push to any remote (including a file share)

## What you need GitHub for

- Pull requests
- Issues
- Actions
- Sharing with people who do not have your laptop

## Demo steps

None standalone; covered in the rest of the section.

## Gotchas

- "Source Control" sometimes shows GitHub-specific commands once the GitHub PRs extension is loaded. They are still GitHub features under the hood.
- A repo can have multiple remotes (e.g., a fork on GitHub plus an internal mirror). VS Code supports it; the UI just shows the active one.

## References

- https://docs.github.com/en/get-started/using-git

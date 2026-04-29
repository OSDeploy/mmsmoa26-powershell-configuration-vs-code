# Branching and committing

## Purpose

The day-to-day Git workflow inside VS Code: branch, edit, stage, commit, push.

## Why it matters

Most PowerShell module changes are a small branch, a few commits, a PR. Do that smoothly without the terminal and you stay focused on the code.

## Settings worth setting

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

## The flow

1. Pull `main`: Source Control view -> ... menu -> Pull.
2. Create a branch: `Git: Create Branch...` -> name `feature/add-status-message`.
3. Edit a file in `Demos/MyDemoModule/`.
4. Source Control view shows the change. Hover the file -> `+` to stage. Or stage a single hunk from the diff editor.
5. Type a commit message in the Source Control input (`Ctrl+Enter` to commit).
6. With `git.postCommitCommand: push` set, the commit auto-pushes (publishing the branch on first push).

## Commit message tips

- Imperative mood: "Add status message" not "Added status message".
- First line under 72 chars; blank line; details below.
- Reference issues with `#123`.

## Demo steps

1. Create branch `feature/add-status-message`.
2. Edit `Demos/MyDemoModule/MyDemoModule.psm1` to add a `Write-Verbose 'Status checked'` line.
3. Stage just that hunk from the diff editor.
4. Commit with message `Add status verbose message`.
5. Show the branch published on GitHub.

## Gotchas

- `git.enableSmartCommit` auto-stages everything when nothing is staged. Disable; it surprises people.
- Branch protection prompt fires when you try to commit directly to `main`. Useful guardrail.
- `Ctrl+Enter` in the commit message box commits; `Enter` adds a newline. Easy to mix up.

## References

- Source Control overview: https://code.visualstudio.com/docs/sourcecontrol/overview

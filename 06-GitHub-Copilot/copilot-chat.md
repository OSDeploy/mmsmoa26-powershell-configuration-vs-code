# Copilot Chat: Ask, Edit, Agent

## Purpose

Use Chat for tasks bigger than a one-line completion.

## Why it matters

Inline completions handle "finish this line." Chat handles "explain this", "rewrite this", "add tests for this", "go fix this across the workspace."

## Modes

| Mode | What it does | When to use |
|------|--------------|-------------|
| Ask | Q&A about code, no edits | Explain, plan, brainstorm |
| Edit | Proposes edits to one or more files; you accept/reject | Targeted refactors |
| Agent | Plans, edits, runs commands, iterates | Larger multi-step tasks |

Open with `Ctrl+Alt+I` (chat panel) or `Ctrl+Shift+I` (inline chat).

## Useful slash commands

| Command | Purpose |
|---------|---------|
| `/explain` | Explain selected code |
| `/fix` | Suggest a fix for the diagnostic on the selection |
| `/tests` | Generate Pester tests |
| `/doc` | Add comment-based help / docstrings |
| `/new` | Scaffold a new file or project |
| `@workspace` | Scope to the open workspace (with indexing) |
| `@terminal` | Ask about the last terminal command |

## Demo steps

1. Open `MyDemoModule.psm1`. Select the public function. `Ctrl+Alt+I` -> `/explain`.
2. Switch to Edit mode (mode picker at top of chat). Prompt: "Add comment-based help to every public function in this file." Review the diff. Accept selectively.
3. Open `Tests/MyDemoModule.Tests.ps1`. `/tests` -> ask for a Pester test for `Get-DemoVersion`.
4. Switch to Agent mode. Prompt: "Add a `New-DemoStatus` cmdlet that returns a `[pscustomobject]` with version and timestamp, plus a Pester test, and update the module manifest's exports." Watch it propose, edit, test.
5. Reject one change to show the review flow.

## Gotchas

- Agent mode is the most powerful and the most likely to do unwanted work. Stage commits before running it so you can `git restore`.
- `@workspace` requires workspace indexing; first-run can take a while on large repos.
- Accepting an Edit proposal applies the changes; nothing is committed. You still own the commit.

## References

- https://code.visualstudio.com/docs/copilot/copilot-chat
- https://code.visualstudio.com/docs/copilot/copilot-edits


---

[Back to README](./README.md)
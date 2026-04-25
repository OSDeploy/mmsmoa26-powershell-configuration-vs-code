# Clone and open

## Purpose

Get a repo from GitHub onto disk and into VS Code with one command.

## Why it matters

The Command Palette `Git: Clone` flow is faster than the GitHub website -> Code -> copy URL -> terminal -> `git clone` dance.

## Settings / commands

| Command | What it does |
|---------|--------------|
| `Git: Clone` | Prompts for URL or browses GitHub repos you have access to |
| `GitHub: Clone` | Same, scoped to the signed-in GitHub account |
| `Git: Clone (Recursive)` | Includes submodules |
| `code <folder>` | Open a folder from the terminal |

## Demo steps

1. `Ctrl+Shift+P` -> `Git: Clone`.
2. Type a few characters of the org name; pick this session's repo from the suggestion list.
3. Pick a parent folder (e.g., `C:\Code`).
4. When prompted "Open the cloned repository?", choose **Open in New Window**.
5. Workspace Trust prompt -> Trust the folder and parent.
6. Show the profile in the new window matches the one we built in section 01.

## Gotchas

- The clone target path is remembered; subsequent clones default to the same parent folder.
- "Open in New Window" preserves the original window's profile context. "Open in Current Window" replaces it.
- HTTPS clone uses GCM; SSH clone uses your SSH agent. Pick one and stick with it.

## References

- https://code.visualstudio.com/docs/sourcecontrol/github#_cloning-a-repository

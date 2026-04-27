# Custom instructions, prompt files, AGENTS.md

## Purpose

Make Copilot follow your team's PowerShell conventions automatically.

## Why it matters

Without customization, every prompt has to re-state the rules ("PowerShell 7, OTBS, no aliases, comment-based help"). With customization, Copilot picks them up from files in the repo.

## Three customization layers

### 1. `.github/copilot-instructions.md`

A single repo-wide instructions file. Copilot Chat injects it into every chat in this workspace. This very repo uses one - see [../.github/copilot-instructions.md](../.github/copilot-instructions.md).

Good content for a PowerShell module:

```markdown
# Copilot instructions for MyModule

- Target PowerShell 7. Note PS 5.1 differences when relevant.
- Use advanced functions with [CmdletBinding()] and comment-based help.
- Avoid aliases (%, ?, gci, etc.).
- Format with OTBS.
- All public functions live under Public/, all private under Private/.
- Pester 5 tests live next to the function under Tests/.
- Files are UTF-8 with BOM. ASCII only in source.
```

### 2. Prompt files (`.github/prompts/*.prompt.md`)

Reusable prompts you invoke from chat with `/`. Example `.github/prompts/new-function.prompt.md`:

```markdown
---
mode: agent
---

Create a new advanced function in DemoRepo/Public.

Ask me for:
- function name (Verb-Noun)
- one-line synopsis
- pipeline behavior

Then generate the function with [CmdletBinding()], param block, comment-based help, and a matching Pester 5 test under DemoRepo/Tests/.
```

### 3. `AGENTS.md` and `.instructions.md`

- `AGENTS.md` (root) - guidance specifically for agentic runs (Copilot Agent mode, other agents).
- `*.instructions.md` files with `applyTo` frontmatter scope guidance to file globs.

## Demo steps

1. Open this repo's `.github/copilot-instructions.md`. Show how it shaped this very session's content.
2. Add a quick prompt file (`new-function.prompt.md`) live, save it, then run it from chat with `/new-function`.
3. Show that without the instructions file, Copilot defaults to a generic style; with it, output matches the team's rules.

## Gotchas

- Instruction files only apply to Copilot Chat (and agent runs), not inline completions.
- Long instruction files dilute focus; keep under ~200 lines.
- Don't put secrets, internal URLs, or PII in instruction files; they go to the model.

## References

- About Copilot custom instructions: https://docs.github.com/en/copilot/customizing-copilot/about-customizing-github-copilot-chat-responses
- VS Code prompt files: https://code.visualstudio.com/docs/copilot/copilot-customization

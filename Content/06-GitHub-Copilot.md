# 06 - GitHub Copilot

**Time:** 55 - 65 minutes (10 min) | **Owner:** Jeff

**Learning objective:** Set up GitHub Copilot for advanced PowerShell coding assistance.

---

## Section overview

**By the end of this section you can:**

1. Sign in to Copilot and pick a plan that fits.
2. Use inline completions while authoring PowerShell.
3. Use Copilot Chat in Ask, Edit, and Agent modes.
4. Write effective prompts for PowerShell tasks.
5. Customize Copilot with `copilot-instructions.md`, prompt files, and AGENTS.md.
6. Apply safety practices: review every diff, never trust generated secrets.

**Demo outline:**

1. Show Accounts -> Copilot status. Sign in if needed (auto if already signed into GitHub).
2. Open `DemoRepo/MyDemoModule.psm1`. Type a function comment and let Copilot complete a `Get-DemoVersion` body.
3. Open Copilot Chat (`Ctrl+Alt+I`). Ask: "Explain what this module does."
4. Use the `/tests` slash command in a Pester file to generate a new test.
5. Switch to Edit mode. Ask Copilot to add comment-based help to every public function. Review and accept the multi-file diff.
6. Open this repo's [../.github/copilot-instructions.md](../.github/copilot-instructions.md). Show how it scoped Copilot to use ASCII and the per-subtopic template throughout this very repo.
7. Open a prompt file (`.github/prompts/new-function.prompt.md` if shipped) and run it.

**Fallback:** if Copilot service is degraded, demo Ask mode against open files only and show the customization files statically.

**Talking points:**

- Copilot suggests; you decide. Treat output like a junior pair, not authority.
- Inline completions are great for boilerplate; Chat is great for explanation and refactors.
- Custom instructions are how you make Copilot match your team's PowerShell style.
- Workspace Trust gates Copilot Agent mode actions in untrusted folders.

**References:**

- Copilot in VS Code: https://code.visualstudio.com/docs/copilot/overview
- Plans: https://github.com/features/copilot/plans
- Custom instructions: https://docs.github.com/en/copilot/customizing-copilot/about-customizing-github-copilot-chat-responses

---

## Setup and licensing

**Purpose:** Get Copilot working in VS Code on the right account and plan.

**Why it matters:** Copilot is per-user, not per-machine. Picking the wrong account means missing org policies, shared instructions, or audit logs.

**Plans:**

| Plan       | Audience                     | Notes                                                    |
| ---------- | ---------------------------- | -------------------------------------------------------- |
| Free       | Anyone with a GitHub account | Limited monthly completions and chat                     |
| Pro        | Individuals                  | Full features, personal billing                          |
| Pro+       | Power individuals            | Higher limits, premium models                            |
| Business   | Teams                        | Org policy, content exclusions, no training on your code |
| Enterprise | Large orgs                   | Knowledge bases, fine-grained policy                     |

For the demos, Free or Pro is enough.

**Install:**

Both extensions are in the starter profile:

```powershell
code --install-extension github.copilot
code --install-extension github.copilot-chat
```

**Sign in:**

1. Click Accounts (avatar) -> `Sign in with GitHub to use GitHub Copilot`.
2. Authorize in browser.
3. Status bar shows the Copilot icon. Click it for status (active, paused, error).

**Org-managed accounts:**

If your GitHub user is part of an org with a Copilot subscription, that org's policies apply automatically: model availability, content exclusions, public-code filter, and so on. Verify on github.com -> Settings -> Copilot.

**Demo steps:**

1. Click the Copilot status bar icon -> show "Active".
2. Click `Manage Copilot` to show the settings panel.
3. Toggle `Editor: Enable Auto Completions` for the `powershell` language to show per-language control.

**Gotchas:**

- Two GitHub accounts? Sign out of the wrong one in Accounts before signing into Copilot.
- Free tier rate-limits silently fail. If completions stop, check the status icon.
- Some corporate networks block the Copilot websocket. Test before the session.

**References:**

- https://code.visualstudio.com/docs/copilot/setup
- https://docs.github.com/en/copilot/managing-copilot/managing-copilot-as-an-individual-subscriber

---

## Inline completions

**Purpose:** Use Copilot ghost text while typing PowerShell.

**Why it matters:** Most of the productivity gain from Copilot for module authors is boilerplate: parameter blocks, switch logic, comment-based help, repetitive object construction.

**Settings:**

```json
{
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "markdown": true,
    "powershell": true
  },
  "editor.inlineSuggest.enabled": true,
  "editor.inlineSuggest.showToolbar": "onHover"
}
```

**Keys to remember:**

| Key                | Action                      |
| ------------------ | --------------------------- |
| `Tab`              | Accept full suggestion      |
| `Ctrl+Right Arrow` | Accept next word            |
| `Esc`              | Dismiss                     |
| `Alt+]` / `Alt+[`  | Cycle alternate suggestions |
| `Ctrl+Enter`       | Open suggestions panel      |

**Demo steps:**

1. In `MyDemoModule.psm1`, type:

   ```powershell
   # Returns the current OS build number as a [System.Version]
   function Get-DemoOsBuild {
   ```

2. Pause. Copilot proposes a body. Review. Accept with `Tab`.
3. Add a `param([switch]$AsString)` and let Copilot extend the body.
4. Cycle alternate suggestions with `Alt+]` to show variation.

**Gotchas:**

- Suggestions are influenced by surrounding files and open editors. Curate what is open.
- Copilot will happily invent cmdlets. Verify with `Get-Command` before merging.
- The PowerShell extension's IntelliSense and Copilot ghost text can collide visually. Tune `editor.suggest` if needed.

**References:**

- https://code.visualstudio.com/docs/copilot/ai-powered-suggestions

---

## Copilot Chat: Ask, Edit, Agent

**Purpose:** Use Chat for tasks bigger than a one-line completion.

**Why it matters:** Inline completions handle "finish this line." Chat handles "explain this", "rewrite this", "add tests for this", "go fix this across the workspace."

**Modes:**

| Mode  | What it does                                           | When to use               |
| ----- | ------------------------------------------------------ | ------------------------- |
| Ask   | Q&A about code, no edits                               | Explain, plan, brainstorm |
| Edit  | Proposes edits to one or more files; you accept/reject | Targeted refactors        |
| Agent | Plans, edits, runs commands, iterates                  | Larger multi-step tasks   |

Open with `Ctrl+Alt+I` (chat panel) or `Ctrl+Shift+I` (inline chat).

**Useful slash commands:**

| Command      | Purpose                                           |
| ------------ | ------------------------------------------------- |
| `/explain`   | Explain selected code                             |
| `/fix`       | Suggest a fix for the diagnostic on the selection |
| `/tests`     | Generate Pester tests                             |
| `/doc`       | Add comment-based help / docstrings               |
| `/new`       | Scaffold a new file or project                    |
| `@workspace` | Scope to the open workspace (with indexing)       |
| `@terminal`  | Ask about the last terminal command               |

**Demo steps:**

1. Open `MyDemoModule.psm1`. Select the public function. `Ctrl+Alt+I` -> `/explain`.
2. Switch to Edit mode (mode picker at top of chat). Prompt: "Add comment-based help to every public function in this file." Review the diff. Accept selectively.
3. Open `Tests/MyDemoModule.Tests.ps1`. `/tests` -> ask for a Pester test for `Get-DemoVersion`.
4. Switch to Agent mode. Prompt: "Add a `New-DemoStatus` cmdlet that returns a `[pscustomobject]` with version and timestamp, plus a Pester test, and update the module manifest's exports." Watch it propose, edit, test.
5. Reject one change to show the review flow.

**Gotchas:**

- Agent mode is the most powerful and the most likely to do unwanted work. Stage commits before running it so you can `git restore`.
- `@workspace` requires workspace indexing; first-run can take a while on large repos.
- Accepting an Edit proposal applies the changes; nothing is committed. You still own the commit.

**References:**

- https://code.visualstudio.com/docs/copilot/copilot-chat
- https://code.visualstudio.com/docs/copilot/copilot-edits

---

## Effective PowerShell prompts

**Purpose:** Get useful PowerShell out of Copilot more often than not.

**Why it matters:** Generic prompts give generic code. PowerShell has strong conventions (`[CmdletBinding()]`, comment-based help, pipeline support, `ShouldProcess`) that Copilot will follow if you ask, and ignore if you do not.

**Prompt patterns that work:**

### 1. Specify the contract

```text
Write an advanced function Get-DemoStatus that:
- Has [CmdletBinding()]
- Accepts a -ComputerName string array from the pipeline by value and by property name
- Emits one [pscustomobject] per computer with properties Computer, Online, Build
- Uses Test-Connection for the Online check (PowerShell 7 syntax)
- Has comment-based help with .SYNOPSIS, .EXAMPLE, .OUTPUTS
- Targets PowerShell 7
```

### 2. Anchor on existing code

Open a representative file. Say: "Match the style of the surrounding functions in this file."

### 3. Ask for tests, not just code

"Also generate a Pester 5 test that mocks `Test-Connection`."

### 4. Constrain the output

"Return only the function. No prose. No markdown fences."

### 5. Iterate in small steps

Ask for a skeleton, accept it, then ask for the body. Easier to review than a 200-line drop.

**Anti-patterns:**

- "Write me a script that does X" with no details. Copilot will guess.
- Asking for security-sensitive code (credential handling, SAS tokens) without specifying SecretManagement.
- Mixing Windows PowerShell 5.1 idioms and PowerShell 7 idioms in the same prompt.

**Demo steps:**

1. In `DemoRepo/`, place the cursor in a new file. Use the contract prompt above (paste from a snippet).
2. Show the result, accept.
3. Ask for tests in a follow-up prompt.
4. Ask Copilot to "Refactor to use the pipeline `process` block." Compare diffs.

**Gotchas:**

- Copilot may invent cmdlets (`Test-OnlineFast`, `Get-WindowsVersion`). Verify everything with `Get-Command`.
- Aliases sneak in (`%`, `?`, `gci`). Add "no aliases" to the prompt if your style forbids them.
- Comment-based help quality varies; treat it as a draft.

**References:**

- about_Functions_Advanced: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_functions_advanced
- about_Comment_Based_Help: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_comment_based_help

---

## Custom instructions, prompt files, AGENTS.md

**Purpose:** Make Copilot follow your team's PowerShell conventions automatically.

**Why it matters:** Without customization, every prompt has to re-state the rules ("PowerShell 7, OTBS, no aliases, comment-based help"). With customization, Copilot picks them up from files in the repo.

### 1. `.github/copilot-instructions.md`

A single repo-wide instructions file. Copilot Chat injects it into every chat in this workspace. This repo uses one - see [../.github/copilot-instructions.md](../.github/copilot-instructions.md).

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

**Demo steps:**

1. Open this repo's `.github/copilot-instructions.md`. Show how it shaped this very session's content.
2. Add a quick prompt file (`new-function.prompt.md`) live, save it, then run it from chat with `/new-function`.
3. Show that without the instructions file, Copilot defaults to a generic style; with it, output matches the team's rules.

**Gotchas:**

- Instruction files only apply to Copilot Chat (and agent runs), not inline completions.
- Long instruction files dilute focus; keep under ~200 lines.
- Do not put secrets, internal URLs, or PII in instruction files; they go to the model.

**References:**

- About Copilot custom instructions: https://docs.github.com/en/copilot/customizing-copilot/about-customizing-github-copilot-chat-responses
- VS Code prompt files: https://code.visualstudio.com/docs/copilot/copilot-customization

---

## Safety and review

**Purpose:** Use Copilot without shipping a vulnerability or a hallucination.

**Why it matters:** Copilot generates plausible code. Plausible is not the same as correct or secure.

**Rules of the road:**

1. Read every diff before accepting.
2. Run tests after every Edit/Agent acceptance.
3. Never paste real secrets into a prompt; the prompt is sent to the service.
4. Treat Copilot output as authored by an unknown contributor - PR and review apply.
5. Verify every cmdlet exists with `Get-Command`.
6. Verify external commands and modules; Copilot will invent module names.

**Settings worth knowing:**

```json
{
  "github.copilot.advanced": {
    "length": 500
  },
  "github.copilot.chat.localeOverride": "en",
  "github.copilot.editor.enableCodeActions": true
}
```

**Org-level controls (Business / Enterprise):**

- **Public code filter** - blocks suggestions that match public code.
- **Content exclusions** - exclude paths or repos from being sent.
- **Audit logs** - who used Copilot, when.
- **Model picker policy** - restrict which models can be used.

Verify on github.com -> your org -> Settings -> Copilot.

**PowerShell-specific risks:**

- **Execution policy bypass suggestions** - reject `-ExecutionPolicy Bypass` in any output.
- **Plain-text credentials** - reject; demand SecretManagement.
- **`Invoke-Expression`** - usually a smell; reject unless you can justify it.
- **Hardcoded PATs / connection strings** - reject; use environment variables or a secret store.
- **Outdated cmdlets** - PS 7 deprecated some, e.g., `WMI` cmdlets vs `CIM`. Check.

**Demo steps:**

1. Ask Copilot: "Write me a function that downloads a file using a PAT." Show the diff. Reject the plaintext PAT pattern. Re-prompt requiring `SecretManagement`.
2. Show `Workspace Trust` gating Agent mode in an untrusted folder.
3. Open the org Copilot settings page (browser tab) so attendees see what to look for.

**Gotchas:**

- Copilot Chat history is retained per-account; do not paste customer data into prompts.
- "Suggestions matching public code" filter applies to inline completions, not chat output.
- Reviewing big agent-mode diffs is hard; keep tasks small.

**References:**

- Responsible use of Copilot: https://docs.github.com/en/copilot/responsible-use-of-github-copilot-features
- Content exclusions: https://docs.github.com/en/copilot/managing-copilot/managing-copilot-for-your-organization/excluding-content-from-github-copilot

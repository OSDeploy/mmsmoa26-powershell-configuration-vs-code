# Master PowerShell Configuration in VS Code

**MMS 2026 at MOA -- Monday, May 4, 2026, 3:00 PM - 4:45 PM CDT -- Cedar Room**
**Speakers:** David Segura and Jeff Scripter (Recast Software)
**Session repo:** https://mms2026atmoa.sched.com/event/2HHGJ/master-powershell-configuration-in-vs-code

---

## What you will leave with

1. A customizable VS Code profile built for PowerShell work.
2. A recommended settings baseline with formatting and security covered.
3. GitHub integration -- clone, branch, commit, and review PRs without leaving VS Code.
4. GitHub Copilot configured and scoped to your PowerShell style.

---

## Session roadmap

### 00 - Introduction (0-5 min)

- Frames the session as a fresh-install playbook, not a tips list.
- The deliverable is a ready-to-import starter profile plus four repeatable habits.

### 01 - VS Code First Run (5-13 min)

- Five UI regions: Activity Bar, Side Bar, Editor, Panel, Status Bar.
- Command Palette (`Ctrl+Shift+P`) is the fastest path to any command.
- Integrated terminal ships with VS Code; switch to `pwsh` as the default shell.

### 02 - Extensions (13-18 min)

- Install via the Extensions view or a one-shot bulk script from `Samples/extensions.txt`.
- Core list: `ms-vscode.powershell`, `github.copilot`, `github.vscode-pull-request-github`,
  `github.vscode-github-actions`, `github.remotehub`, `DavidAnson.vscode-markdownlint`.
- Fewer extensions means faster startup. The PowerShell extension is the only required one.

### 03 - Profiles (18-30 min)

- A profile bundles settings, extensions, snippets, and keybindings into an isolated configuration.
- Create one profile for PowerShell work; leave Default untouched.
- Export to `.code-profile`, import on another machine, or sync via Settings Sync.
- Launch a profile from the CLI: `code --profile "PowerShell"`.

### 04 - Settings (30-43 min)

- Settings precedence: Default < User < Profile < Workspace < Folder.
- Essential keys: `files.encoding`, `files.eol`, `editor.formatOnSave`, `telemetry.telemetryLevel`.
- Workspace Trust gates task auto-run and debug auto-attach in untrusted folders -- not theatre.
- Pick a PSScriptAnalyzer formatting preset (`OTBS`, `Stroustrup`, or `Custom`), commit it to the
  workspace, and stop debating braces.

### 05 - GitHub Integration (43-55 min)

- Git is the local tool; GitHub is the remote service. The PR extension bridges them inside VS Code.
- One sign-in (bottom-left Accounts icon) covers Source Control, the PR extension, and Copilot.
- Workflow: `Git: Clone` -> branch -> edit -> stage hunks -> commit -> push -> Create Pull Request.
- GitHub Repositories lets you browse any public repo without cloning it locally.

### 06 - GitHub Copilot (55-65 min)

- Inline completions handle boilerplate; Chat explains and refactors; Edit applies multi-file diffs.
- Write better prompts: include the function signature, desired parameter names, and error handling style.
- `.github/copilot-instructions.md` scopes Copilot to your team's PowerShell conventions globally.
- Always review every diff before accepting. Treat output like a junior pair, not authority.

### 07 - Wrap-Up + Q&A (65-105 min)

- Recap of the four learning objectives; how to grab the starter profile and demo repo.
- 37 minutes of open Q&A.

---

## Four key takeaways

1. **Profiles isolate.** Build one for PowerShell. Do not pollute Default.
2. **Settings and extensions are a baseline, not a buffet.** Paste the recommended block.
   Install the essential extensions. Stop tinkering.
3. **GitHub lives in the editor.** Source Control + GitHub PRs + GitHub Actions + GitHub
   Repositories cover 95% of the workflow without leaving VS Code.
4. **Copilot is a junior pair.** Use inline for boilerplate, Chat for explanation, Edit for
   refactors, Agent for plans. Review every diff. Customize via `.github/copilot-instructions.md`.

---

## Your deliverables (in `Samples/`)

| File                               | Purpose                                                                |
| ---------------------------------- | ---------------------------------------------------------------------- |
| `Samples/Pwsh GitHub.code-profile` | Import this profile to get the full setup instantly                    |
| `Samples/settings.json`            | Recommended settings block -- paste into your User or Profile settings |
| `Samples/extensions.txt`           | Extension IDs for bulk install                                         |
| `Samples/snippets/powershell.json` | Starter PowerShell snippets                                            |
| `Demos/MyDemoModule/`              | Sample module used in the GitHub and Copilot demos                     |

---

## One habit change -- pick one and start tomorrow

- Move your PowerShell work into a dedicated profile.
- Turn on `editor.formatOnSave` for `[powershell]`.
- Open your next PR review inside VS Code instead of the browser.
- Add a `.github/copilot-instructions.md` to your team's main module repo.

---

## Key references

**VS Code**

- Profiles: https://code.visualstudio.com/docs/configure/profiles
- Settings: https://code.visualstudio.com/docs/configure/settings
- Workspace Trust: https://code.visualstudio.com/docs/editor/workspace-trust
- PowerShell in VS Code: https://code.visualstudio.com/docs/languages/powershell

**PowerShell**

- PSScriptAnalyzer: https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview
- Pester: https://pester.dev/

**GitHub**

- Source Control in VS Code: https://code.visualstudio.com/docs/sourcecontrol/overview
- Pull Requests extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github
- GitHub Actions extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions

**GitHub Copilot**

- Copilot in VS Code: https://code.visualstudio.com/docs/copilot/overview
- Custom instructions: https://docs.github.com/en/copilot/customizing-copilot/about-customizing-github-copilot-chat-responses

# 07 - Wrap-Up

**Time:** 65 - 68 minutes (3 min content), then 37 minutes Q&A | **Owner:** Both

---

## Section overview

**Objectives:**

- Recap what was covered.
- Tell attendees how to grab the starter profile and demo repo.
- Open the floor.

**Wrap-up script:**

1. "Recap of what we covered" - point at the four key learning objectives.
2. "How to take it home" - QR code or short URL to this repo.
3. "Where to find us" - speaker contact slides.
4. "Open for questions" - hand to whoever is moderating.

**Q&A management:**

- Roam with mics in a 105-minute slot; no one wants to wait 30 minutes for an answer.
- Park questions you cannot answer and respond on GitHub Issues post-event.
- Watch for the same question twice - good signal to address it broadly.

---

## Key takeaways

A one-slide summary attendees can photograph.

### The four

1. **Profiles isolate.** Build one for PowerShell. Do not pollute Default.
2. **Settings + extensions are a baseline, not a buffet.** Paste the recommended block. Install the eleven extensions. Stop tinkering.
3. **GitHub lives in the editor.** Source Control + GitHub PRs + GitHub Actions + GitHub Repositories cover 95% of the workflow.
4. **Copilot is a junior pair.** Use inline for boilerplate, Chat for explanation, Edit for refactors, Agent for plans. Review every diff. Customize via `.github/copilot-instructions.md`.

### The deliverables

- Starter profile: `Profile/mmsmoa26.code-profile`
- Recommended settings: `Profile/settings.json`
- Extension list: `Profile/extensions.txt`
- Snippets: `Profile/snippets/powershell.json`
- Demo repo: `DemoRepo/`

### The one habit change

Pick **one** of these and start tomorrow:

- Move your PowerShell work into a dedicated profile.
- Turn on `editor.formatOnSave` for `[powershell]`.
- Open your next PR review inside VS Code instead of the browser.
- Add a `.github/copilot-instructions.md` to your team's main module repo.

---

## Resources

### This session

- Repository: https://github.com/OSDeploy/mmsmoa26-powershell-configuration-vs-code
- Sched event: https://mms2026atmoa.sched.com/event/2HHGJ/master-powershell-configuration-in-vs-code
- Starter profile: [../Profile/](../Profile/)
- Demo repo: [../DemoRepo/](../DemoRepo/)

### VS Code

- Profiles: https://code.visualstudio.com/docs/configure/profiles
- Settings reference: https://code.visualstudio.com/docs/configure/settings
- Settings Sync: https://code.visualstudio.com/docs/configure/settings-sync
- Workspace Trust: https://code.visualstudio.com/docs/editor/workspace-trust
- Source Control: https://code.visualstudio.com/docs/sourcecontrol/overview
- PowerShell language: https://code.visualstudio.com/docs/languages/powershell
- markdownlint extension: https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint
- Run in PowerShell extension: https://marketplace.visualstudio.com/items?itemName=tobysmith568.run-in-powershell
- Prettier extension: https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode

### PowerShell

- Docs hub: https://learn.microsoft.com/powershell/
- about_Execution_Policies: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_execution_policies
- about_Functions_Advanced: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_functions_advanced
- PSScriptAnalyzer: https://learn.microsoft.com/powershell/utility-modules/psscriptanalyzer/overview
- Pester: https://pester.dev/
- SecretManagement: https://learn.microsoft.com/powershell/utility-modules/secretmanagement/overview

### GitHub

- VS Code GitHub integration: https://code.visualstudio.com/docs/sourcecontrol/github
- Pull Requests extension: https://github.com/microsoft/vscode-pull-request-github
- GitHub Actions extension: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-github-actions
- GitHub Repositories extension: https://marketplace.visualstudio.com/items?itemName=GitHub.remotehub
- GitHub Actions docs: https://docs.github.com/en/actions
- Git Credential Manager: https://github.com/GitCredentialManager/git-credential-manager

### GitHub Copilot

- Copilot in VS Code: https://code.visualstudio.com/docs/copilot/overview
- Plans and pricing: https://github.com/features/copilot/plans
- Custom instructions: https://docs.github.com/en/copilot/customizing-copilot/about-customizing-github-copilot-chat-responses
- Responsible use: https://docs.github.com/en/copilot/responsible-use-of-github-copilot-features

### Speaker links

- David Segura on Sched: https://mms2026atmoa.sched.com/speaker/david_segura.27tenlxt
- Jeff Scripter on Sched: https://mms2026atmoa.sched.com/speaker/jeff_scripter.28jia85t
- OSDCloud: https://www.osdcloud.com/
- Recast Software: https://www.recastsoftware.com/

---

## Starter profile distribution

### Option 1 - Import the .code-profile file

1. Clone or download this repo: https://github.com/OSDeploy/mmsmoa26-powershell-configuration-vs-code
2. In VS Code, `Profiles: Import Profile...`.
3. Pick `Profile/mmsmoa26.code-profile`.
4. Window reloads into the new profile. Done.

### Option 2 - Import via URL

1. We will publish a Gist of the profile and put the URL on the wrap-up slide.
2. `Profiles: Import Profile...` -> paste URL.

### Option 3 - Build it yourself

If you do not want to import a binary:

1. Create a fresh profile (`Profiles: Create Profile...`).
2. Open `Profile/settings.json` and copy into your User Settings (JSON).
3. Bulk install extensions:

   ```powershell
   Get-Content Profile\extensions.txt | ForEach-Object { code --install-extension $_ }
   ```

4. Copy `Profile/snippets/powershell.json` into `%APPDATA%\Code\User\snippets\powershell.json` (or per-profile equivalent).

### Verifying the profile

```powershell
code --list-extensions
# Expect to see: ms-vscode.powershell, github.copilot, github.copilot-chat,
# github.vscode-pull-request-github, github.vscode-github-actions,
# github.remotehub, editorconfig.editorconfig, streetsidesoftware.code-spell-checker,
# DavidAnson.vscode-markdownlint, tobysmith568.run-in-powershell, esbenp.prettier-vscode
```

Open `DemoRepo/` and confirm:

- PowerShell extension activates (status bar shows the version).
- Format-on-save works on a `.ps1` file.
- Source Control view shows the demo repo's Git status.

### Updating

This profile is a starting point. Fork it, edit `Profile/`, re-export, share with your team. PRs welcome on the session repo if you spot a real improvement.

---

## Q&A prep

Questions we expect, with one-line answers ready. Use to seed the room if it is quiet.

### Profiles

1. **Q:** Can I have one profile per project? **A:** Yes - right-click the workspace name and pick "Use Profile."
2. **Q:** Do profiles sync across machines? **A:** Yes, via Settings Sync. Each profile syncs independently.
3. **Q:** Where are profiles stored on disk? **A:** `%APPDATA%\Code\User\profiles\<id>` on Windows.
4. **Q:** Can I rename the Default profile? **A:** No. Create a new one and switch.

### Settings and extensions

5. **Q:** Why UTF-8 with BOM and not plain UTF-8? **A:** Windows PowerShell 5.1 reads BOM-less files as ANSI and corrupts non-ASCII characters.
6. **Q:** Should I commit `.vscode/settings.json`? **A:** Commit team-shared settings (formatter, encoding); keep personal preferences in User settings.
7. **Q:** Allman vs OTBS? **A:** Pick one and enforce it; no business reason to prefer one.
8. **Q:** What about the PowerShell Preview extension? **A:** Do not run both. Stick with stable unless you need a preview feature.
9. **Q:** PSScriptAnalyzer rule I disagree with? **A:** Override in `PSScriptAnalyzerSettings.psd1` checked into the repo.

### GitHub integration

10. **Q:** PAT vs OAuth? **A:** OAuth via GCM. Do not paste PATs into Git config.
11. **Q:** SSH vs HTTPS? **A:** Either; pick one and stick with it. HTTPS + GCM is the lower-friction default on Windows.
12. **Q:** Can I monitor CI without leaving VS Code? **A:** Yes - the GitHub Actions extension shows runs, jobs, and live logs in the sidebar.
13. **Q:** How do I review a PR locally? **A:** GitHub PRs view -> right-click PR -> Checkout. Run tests in the Integrated Console.
14. **Q:** Multiple GitHub accounts? **A:** Sign out in Accounts before signing in to the other; do not stack.

### Copilot

15. **Q:** Does Copilot train on my code? **A:** Pro/Business/Enterprise: no. Free: see current terms.
16. **Q:** Best way to make Copilot use my team's style? **A:** `.github/copilot-instructions.md` in the repo.
17. **Q:** Inline completions stopped working. **A:** Check the status bar icon, then `Developer: Reload Window`. Free tier rate-limits silently.
18. **Q:** Agent mode safety? **A:** Stage commits before invoking; review every diff; keep tasks small.
19. **Q:** Can Copilot run my Pester tests? **A:** Yes via Agent mode in a trusted workspace.
20. **Q:** What model is it using? **A:** Click the model picker in chat. Availability depends on plan and org policy.

### Defer and follow up

For deeper questions (custom MCP servers, internal model routing, large-org policy), capture the question and follow up via GitHub Issues on the session repo.

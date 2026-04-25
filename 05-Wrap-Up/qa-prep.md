# Q&A prep

Questions we expect, with one-line answers ready. Use to seed the room if it is quiet.

## Profiles

1. **Q:** Can I have one profile per project? **A:** Yes - right-click the workspace name and pick "Use Profile."
2. **Q:** Do profiles sync across machines? **A:** Yes, via Settings Sync. Each profile syncs independently.
3. **Q:** Where are profiles stored on disk? **A:** `%APPDATA%\Code\User\profiles\<id>` on Windows.
4. **Q:** Can I rename the Default profile? **A:** No. Create a new one and switch.

## Settings and extensions

5. **Q:** Why UTF-8 with BOM and not plain UTF-8? **A:** Windows PowerShell 5.1 reads BOM-less files as ANSI and corrupts non-ASCII characters.
6. **Q:** Should I commit `.vscode/settings.json`? **A:** Commit team-shared settings (formatter, encoding); keep personal preferences in User settings.
7. **Q:** Allman vs OTBS? **A:** Pick one and enforce it; no business reason to prefer one.
8. **Q:** What about the PowerShell Preview extension? **A:** Don't run both. Stick with stable unless you need a preview feature.
9. **Q:** PSScriptAnalyzer rule I disagree with? **A:** Override in `PSScriptAnalyzerSettings.psd1` checked into the repo.

## GitHub integration

10. **Q:** PAT vs OAuth? **A:** OAuth via GCM. Don't paste PATs into Git config.
11. **Q:** SSH vs HTTPS? **A:** Either; pick one and stick with it. HTTPS + GCM is the lower-friction default on Windows.
12. **Q:** Can I monitor CI without leaving VS Code? **A:** Yes - the GitHub Actions extension shows runs, jobs, and live logs in the sidebar.
13. **Q:** How do I review a PR locally? **A:** GitHub PRs view -> right-click PR -> Checkout. Run tests in the Integrated Console.
14. **Q:** Multiple GitHub accounts? **A:** Sign out in Accounts before signing in to the other; do not stack.

## Copilot

15. **Q:** Does Copilot train on my code? **A:** Pro/Business/Enterprise: no. Free: see current terms.
16. **Q:** Best way to make Copilot use my team's style? **A:** `.github/copilot-instructions.md` in the repo.
17. **Q:** Inline completions stopped working. **A:** Check the status bar icon, then `Developer: Reload Window`. Free tier rate-limits silently.
18. **Q:** Agent mode safety? **A:** Stage commits before invoking; review every diff; small tasks only.
19. **Q:** Can Copilot run my Pester tests? **A:** Yes via Agent mode in a trusted workspace.
20. **Q:** What model is it using? **A:** Click the model picker in chat. Availability depends on plan and org policy.

## Defer-and-follow-up

For deeper questions (custom MCP servers, internal model routing, large-org policy), capture the question and follow up via GitHub Issues on the session repo.

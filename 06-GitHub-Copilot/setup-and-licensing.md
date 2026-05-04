# Setup and licensing

## Purpose

Get Copilot working in VS Code on the right account and plan.

## Why it matters

Copilot is per-user, not per-machine. Picking the wrong account means missing org policies, shared instructions, or audit logs.

## Plans (overview)

| Plan | Audience | Notes |
|------|----------|-------|
| Free | Anyone with a GitHub account | Limited monthly completions and chat |
| Pro | Individuals | Full features, personal billing |
| Pro+ | Power individuals | Higher limits, premium models |
| Business | Teams | Org policy, content exclusions, no training on your code |
| Enterprise | Large orgs | Knowledge bases, fine-grained policy |

For the demo, Free or Pro is enough.

## Install

Both extensions are in the starter profile:

```powershell
code --install-extension github.copilot
code --install-extension github.copilot-chat
```

## Sign in

1. Click Accounts (avatar) -> `Sign in with GitHub to use GitHub Copilot`.
2. Authorize in browser.
3. Status bar shows the Copilot icon. Click it for status (active, paused, error).

## Org-managed accounts

If your GitHub user is part of an org with a Copilot subscription, that org's policies apply automatically: model availability, content exclusions, public-code filter, and so on. Verify on github.com -> Settings -> Copilot.

## Demo steps

1. Click the Copilot status bar icon -> show "Active".
2. Click `Manage Copilot` to show the settings panel.
3. Toggle `Editor: Enable Auto Completions` for the `powershell` language to show per-language control.

## Gotchas

- Two GitHub accounts? Sign out of the wrong one in Accounts before signing into Copilot.
- Free tier rate-limits silently fail. If completions stop, check the status icon.
- Some corporate networks block the Copilot websocket. Test before the session.

## References

- https://code.visualstudio.com/docs/copilot/setup
- https://docs.github.com/en/copilot/managing-copilot/managing-copilot-as-an-individual-subscriber


---

[Back to README](./README.md)
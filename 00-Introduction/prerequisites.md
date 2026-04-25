# Prerequisites for follow-along

Attendees who want to follow along on a laptop should install these before the session. Watching only is also fine.

## Required

- Windows 11 (Windows 10 22H2 works; macOS / Linux work but demos are Windows)
- Visual Studio Code (stable channel) - https://code.visualstudio.com/
- PowerShell 7.x - `winget install --id Microsoft.PowerShell`
- Git for Windows - `winget install --id Git.Git`
- A GitHub account - https://github.com/join

## Recommended

- GitHub Copilot subscription (Free tier works for the demos) - https://github.com/features/copilot
- Windows Terminal - `winget install --id Microsoft.WindowsTerminal`
- A Nerd Font (for terminal icons) - https://www.nerdfonts.com/

## One-shot install (PowerShell, run as admin or with --scope user)

```powershell
winget install --id Microsoft.PowerShell --source winget
winget install --id Microsoft.VisualStudioCode --source winget
winget install --id Git.Git --source winget
winget install --id Microsoft.WindowsTerminal --source winget
```

## Verify

```powershell
$PSVersionTable.PSVersion       # Expect 7.x
code --version                   # Expect a build number
git --version                    # Expect git version 2.x
```

## Sign-ins to have ready

- GitHub credentials (browser sign-in works fine; have 2FA device handy)
- Microsoft / GitHub account that owns your Copilot subscription, if any

## Things you do NOT need

- Admin rights on a corporate machine - all demos work with user-scoped installs.
- An existing PowerShell module to publish - we use `DemoRepo/` from this session.
- Azure or any cloud account.

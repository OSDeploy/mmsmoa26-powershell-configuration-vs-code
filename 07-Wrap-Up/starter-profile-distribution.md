# Starter profile distribution

## Purpose

Show attendees three ways to pick up the starter profile.

## Option 1 - Import the .code-profile file

1. Clone or download this repo.
2. In VS Code, `Profiles: Import Profile...`.
3. Pick `Samples/mmsmoa26.code-profile`.
4. Window reloads into the new profile. Done.

## Option 2 - Import via URL

1. We will publish a Gist of the profile and put the URL on the wrap-up slide.
2. `Profiles: Import Profile...` -> paste URL.

## Option 3 - Build it yourself

If you do not want to import a binary:

1. Create a fresh profile (`Profiles: Create Profile...`).
2. Open `Samples/settings.json` and copy into your User Settings (JSON).
3. Bulk install extensions:

   ```powershell
   Get-Content Samples\extensions.txt | ForEach-Object { code --install-extension $_ }
   ```

4. Copy `Samples/snippets/powershell.json` into `%APPDATA%\Code\User\snippets\powershell.json` (or per-profile equivalent).

## Verifying the profile

```powershell
code --list-extensions
# Expect to see ms-vscode.powershell, github.copilot, github.copilot-chat,
# github.vscode-pull-request-github, github.vscode-github-actions,
# github.remotehub, editorconfig.editorconfig, streetsidesoftware.code-spell-checker,
# DavidAnson.vscode-markdownlint, tobysmith568.run-in-powershell, esbenp.prettier-vscode
```

Open `Demos/MyDemoModule/` and confirm:

- PowerShell extension activates (status bar shows the version).
- Format-on-save works on a `.ps1` file.
- Source Control view shows the demo repo's Git status.

## Updating

This profile is a starting point. Fork it, edit `Samples/`, re-export, share with your team. PRs welcome on the session repo if you spot a real improvement.

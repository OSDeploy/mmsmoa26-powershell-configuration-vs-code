# Starter VS Code profile

Source-of-truth assets for the `mmsmoa26` profile we ship at the session.

## Files

- `settings.json` - paste into User or Profile `settings.json`.
- `extensions.txt` - one extension ID per line.
- `snippets/powershell.json` - PowerShell snippets for the profile.
- `mmsmoa26.code-profile` - exported VS Code profile (generated at prep time, not checked in until a stable build exists).

## Build the .code-profile from scratch

1. From a clean VS Code, `Profiles: Create Profile...` named `mmsmoa26`.
2. Paste `settings.json` into the profile's User Settings (JSON).
3. Install extensions:

   ```powershell
   Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
   ```

4. Copy `snippets/powershell.json` into the profile snippets directory (or use `Configure User Snippets` -> `powershell.json`).
5. `Profiles: Export Profile...` -> save as `mmsmoa26.code-profile` next to this README.

## Re-import on another machine

`Profiles: Import Profile...` -> select `mmsmoa26.code-profile` (or paste a published Gist URL).

## Update workflow

When changing settings during prep:

1. Edit `settings.json` in this folder (source of truth).
2. Apply the same edits in your live VS Code profile.
3. Re-export `mmsmoa26.code-profile` from VS Code over the existing one.
4. Commit both.

## What we deliberately leave out

- Personal sign-ins (Copilot, GitHub, Settings Sync).
- Theme and font choices that vary by attendee taste.
- Workspace-level settings (those go in repos, not in a profile).

[Back to root](../README.md)

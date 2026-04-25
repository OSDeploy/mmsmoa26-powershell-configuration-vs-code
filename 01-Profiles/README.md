# 01 - Profiles

**Time:** 5 - 17 minutes (12 min)
**Owner:** David
**Learning objective:** Create and manage customized VS Code profiles designed for effective PowerShell work.

## Why this section comes first

Profiles isolate everything else we are about to configure (settings, extensions, snippets, keybindings, UI state). Building a dedicated PowerShell profile means our recommended settings will not fight with someone else's TypeScript or .NET workflow on the same machine.

## Outcomes

By the end of this section attendees can:

1. Explain what a VS Code profile is and what it contains.
2. Create a new profile from a fresh install.
3. Switch between profiles per workspace or per window.
4. Export a profile to a `.code-profile` file and import one.
5. Sync a profile across machines with Settings Sync.

## Subtopics

- [what-are-profiles.md](./what-are-profiles.md)
- [creating-profiles.md](./creating-profiles.md)
- [profile-contents.md](./profile-contents.md)
- [import-export-sync.md](./import-export-sync.md)
- [starter-profile-walkthrough.md](./starter-profile-walkthrough.md)

## Demo outline

1. Open VS Code with the **Default** profile selected (status bar, bottom-left gear icon).
2. Command Palette (`Ctrl+Shift+P`) -> `Profiles: Create Profile...` -> **From Template** -> name it `PowerShell-MMSMOA`.
3. Show the profile switcher (gear -> Profiles) and switch back and forth.
4. Show profile contents in `Profiles: Show Contents`.
5. Import the shipped profile from [../Profile/](../Profile/) via `Profiles: Import Profile...`.
6. Open a workspace and right-click the workspace name -> **Use Profile** to pin it.
7. Toggle `Settings Sync` and show the per-resource opt-out for profiles.

**Fallback if internet is down:** import the local `.code-profile` file instead of using a Settings Sync demo.

## Talking points

- Pre-profiles, every PowerShell author maintained a wall of settings that conflicted with other languages. Profiles end that.
- A profile is not a workspace; a profile is the editor configuration that a workspace uses.
- Profiles support Settings Sync, but each profile syncs independently.
- The shipped starter profile in `Profile/` is exactly what you would build live - we just give it to you.

## Gotchas

- The Default profile is special; deleting it is not allowed. Customize a copy.
- Profile changes apply immediately to the active window only; other windows must reload to pick up profile-scoped extension changes.
- `code --profile "Name"` launches a window with a specific profile from the CLI.

## References

- VS Code Profiles: https://code.visualstudio.com/docs/configure/profiles
- Settings Sync: https://code.visualstudio.com/docs/configure/settings-sync

[Back to root](../README.md)

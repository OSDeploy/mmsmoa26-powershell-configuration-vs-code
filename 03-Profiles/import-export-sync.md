# Import, export, and sync

## Purpose

Move a profile between machines or share one with a team.

## Why it matters

Building a profile once and re-using it everywhere is the whole point. Two paths: a portable file (`.code-profile`) or live sync via your GitHub / Microsoft account.

## Settings / commands

| Action | How |
|--------|-----|
| Export to file | `Profiles: Export Profile...` -> save `.code-profile` |
| Export as Gist | `Profiles: Export Profile...` -> sign in -> publish |
| Import from file | `Profiles: Import Profile...` -> pick file |
| Import from URL | `Profiles: Import Profile...` -> paste Gist URL |
| Settings Sync on/off | `Settings Sync: Turn On/Off` |
| Per-resource opt-out | Settings Sync gear -> uncheck Profiles, Snippets, etc. |

## Demo steps

1. From the active `PowerShell-MMSMOA` profile, run `Profiles: Export Profile...`.
2. Save as `mmsmoa26.code-profile` to the Desktop.
3. Delete the profile (`Profiles: Delete Profile...`).
4. Run `Profiles: Import Profile...` and select the file. Confirm it returns identical.
5. Show `Settings Sync: Turn On` -> sign in with GitHub -> show the resource picker.
6. Note: profiles sync independently; switching profiles does not change which sync account is in use.

## Gotchas

- Exporting includes extension IDs but not extension secrets (e.g., GitHub auth tokens). Sign-ins do not transfer.
- A `.code-profile` file is JSON; you can read it. Do not commit one with sensitive workspace paths in the UI state.
- Settings Sync conflicts: if two machines edit settings.json at the same time, VS Code prompts to merge.

## References

- https://code.visualstudio.com/docs/configure/profiles#_import-export-profiles
- https://code.visualstudio.com/docs/configure/settings-sync


---

[Back to README](./README.md)
# Creating a profile

## Purpose

Walk through creating a dedicated PowerShell profile from scratch.

## Why it matters

You only get the isolation benefits of profiles if you actually create one and use it. The default profile is shared by every workspace until you say otherwise.

## Settings / commands

| Action | How |
|--------|-----|
| Create profile | `Ctrl+Shift+P` -> `Profiles: Create Profile...` |
| Switch profile (current window) | gear icon (bottom-left) -> Profiles -> pick |
| Open new window with profile | `Profiles: Open Profile in New Window` |
| Launch from CLI | `code --profile "PowerShell-MMSMOA"` |
| Pin a profile to a workspace | right-click workspace name -> Use Profile |
| Delete a profile | `Profiles: Delete Profile...` |

## Demo steps

1. Start with VS Code on the Default profile.
2. `Ctrl+Shift+P` -> `Profiles: Create Profile...`
3. Choose **From Template** -> there is no PowerShell template, so pick **None** and name it `PowerShell-MMSMOA`.
4. Optional: choose an icon (terminal icon is a good fit).
5. Click **Create**. The window reloads into the new profile.
6. Confirm the profile name in the bottom-left gear menu.
7. Open a workspace folder and verify the profile follows: right-click the folder name in the Explorer title -> `Use Profile`.

## Gotchas

- Creating a profile **From Current Profile** copies extensions and settings - convenient but defeats the "fresh start" pitch. For the demo, start clean.
- The "Profiles" entry in the gear menu is hidden if your status bar is collapsed; expand it.

## References

- https://code.visualstudio.com/docs/configure/profiles#_create-a-profile


---

[Back to README](./README.md)
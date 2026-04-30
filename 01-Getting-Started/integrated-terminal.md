# Integrated Terminal

## Purpose

Open the integrated terminal and select PowerShell 7 as the shell so every subsequent demo runs in the right environment.

## Why it matters

The integrated terminal is where attendees will run PowerShell commands, invoke PSScriptAnalyzer, run Pester, and use the Git CLI throughout the session. Getting it pointed at `pwsh` (PowerShell 7) instead of `cmd` or Windows PowerShell 5.1 before anything else saves confusion and copy-paste failures later.

## Opening the terminal

```text
Ctrl+`                  (backtick - toggle terminal Panel open/closed)
Ctrl+Shift+`            (new terminal instance)
Terminal > New Terminal  (menu)
> Terminal: Create New Terminal  (Command Palette)
```

## Shell picker

The `+` dropdown next to the terminal tabs opens the shell picker. VS Code auto-detects installed shells:

- PowerShell 7 (`pwsh.exe`) - preferred for this session
- Windows PowerShell 5.1 (`powershell.exe`)
- Command Prompt (`cmd.exe`)
- Git Bash
- WSL distributions (if installed)

## Setting the default shell

Method 1 - via Command Palette:

```text
> Terminal: Select Default Profile
```

Select **PowerShell** (the entry pointing to `pwsh.exe`, not `Windows PowerShell`).

Method 2 - via settings.json:

```json
{
  "terminal.integrated.defaultProfile.windows": "PowerShell"
}
```

Confirm it is `pwsh` and not `powershell` by checking the path shown in the picker. The PowerShell 7 entry typically shows `C:\Program Files\PowerShell\7\pwsh.exe`.

## Verifying the shell version

After opening a terminal, confirm you are in PowerShell 7:

```powershell
$PSVersionTable.PSVersion
```

Expected output:

```text
Major  Minor  Patch  PreReleaseLabel BuildLabel
-----  -----  -----  --------------- ----------
7      5      0
```

If you see `5.1`, the wrong shell profile is selected. Open the shell picker and choose the entry with `pwsh.exe` in the path.

## Multiple terminal instances

- The terminal tab bar supports multiple named instances. Click `+` to add one.
- Rename a terminal instance: right-click its tab > Rename.
- Split the terminal pane horizontally: click the split icon next to `+`.
- Useful during demos: one terminal for commands, one terminal showing output logs.

## Terminal profiles (named shortcuts)

Custom terminal profiles can be defined in settings for repeated use:

```json
{
  "terminal.integrated.profiles.windows": {
    "PowerShell 7 (No Profile)": {
      "path": "pwsh",
      "args": ["-NoProfile"]
    }
  }
}
```

Section 04 uses this pattern when showing PSScriptAnalyzer runs that must be profile-clean.

## Demo steps

1. Press `Ctrl+backtick`. If a terminal is not already open, one starts.
2. Check the shell name in the terminal tab and in the prompt. If it is not `pwsh`, open the `+` dropdown and select PowerShell (the `pwsh.exe` entry).
3. Run `$PSVersionTable.PSVersion` and confirm major version 7.
4. Press `Ctrl+Shift+backtick` to open a second terminal. Show two tabs side by side.
5. Close the second terminal with `exit` or by clicking the trash icon on its tab.

## Gotchas

- `PowerShell` in the shell picker can map to either 5.1 or 7 depending on install order. Always confirm by checking the path or running `$PSVersionTable`.
- Conference machines may have execution policy set to `Restricted` for Windows PowerShell 5.1 but not for pwsh. If commands fail with a policy error, confirm you are in `pwsh`.
- The first terminal open after VS Code starts may be slow (5-10 seconds) while the PowerShell extension initializes. This is normal; subsequent terminals are faster.
- `Ctrl+backtick` is a toggle: if the terminal Panel is focused it hides it; if the editor is focused it shows/focuses the terminal. Attendees sometimes get confused when it hides the terminal instead of creating a new one.

## References

- Integrated terminal docs: https://code.visualstudio.com/docs/terminal/basics
- Terminal profiles: https://code.visualstudio.com/docs/terminal/profiles

# 01 - VS Code First Run

**Time:** 5 - 13 minutes (8 min) | **Owner:** Jeff

Orient attendees to the VS Code interface so every demo in the rest of the session makes sense.

---

## Section overview

**Why this section exists:**

Many attendees use VS Code daily but have never had a guided tour. Without a shared vocabulary (Activity Bar, Command Palette, integrated terminal) the rest of the demos lose half the audience. Eight minutes here saves thirty minutes of confusion later.

**By the end of this section you can:**

- Name the five main UI regions and say what lives in each.
- Open any command by name using the Command Palette.
- Open a folder and understand what a `.code-workspace` file is.
- Reach the Settings UI and `settings.json` directly.
- Find and install an extension from the Extensions view.
- Open the integrated terminal and change its shell.

**Demo outline:**

1. Open VS Code to the Welcome tab. Point out the five UI regions (30 sec).
2. Hit `Ctrl+Shift+P`, type "Open Folder", press Enter. Open `DemoRepo/`. (30 sec)
3. Show the Explorer view populate in the Side Bar.
4. Hit `Ctrl+Shift+P`, type "Preferences: Open Settings (UI)". Walk the search bar. (30 sec)
5. Hit `Ctrl+Shift+P`, type "Preferences: Open User Settings (JSON)". Show raw JSON. (20 sec)
6. Click the Extensions icon (or `Ctrl+Shift+X`). Search for "PowerShell". Do not install yet - that is section 02. (20 sec)
7. Open the integrated terminal (`` Ctrl+` ``). Show the shell picker. Switch to pwsh if not already there. (30 sec)

Total: ~4 minutes of live demo; 4 minutes of narration.

**Fallback (no projector / no keyboard):** Walk through the same steps verbally using the slide diagrams of each UI region. Attendees follow on their own laptops.

---

## UI orientation

**Purpose:** Name and locate the five main regions of the VS Code window.

```text
+-----+-------------------+-------------------------------+
|     |                   |                               |
|  A  |   Side Bar (B)    |       Editor Area (C)         |
|  c  |                   |                               |
|  t  |  Explorer         |  Open files / editor groups   |
|  i  |  Search           |  Split panes, diff view       |
|  v  |  Source Control   |  Markdown preview             |
|  i  |  Run and Debug    |                               |
|  t  |  Extensions       |                               |
|  y  |  (and more)       |                               |
|     |                   |                               |
|  B  +-------------------+-------------------------------+
|  a  |         Panel (D)                                 |
|  r  |  Terminal  Problems  Output  Debug Console        |
+-----+---------------------------------------------------+
|            Status Bar (E)                               |
|  Branch  Errors  Warnings  Language  Encoding  Line     |
+---------------------------------------------------------+
```

### Activity Bar (A)

- Vertical strip on the far left.
- Click an icon to show/hide that view in the Side Bar.
- Default icons: Explorer, Search, Source Control, Run and Debug, Extensions.
- Extensions add their own icons here (GitHub Copilot Chat, Remote Explorer, etc.).
- Right-click any icon to rearrange or hide it.

### Side Bar (B)

- The panel that opens when you click an Activity Bar icon.
- Context-sensitive: shows file tree for Explorer, results for Search, commit tools for Source Control.
- Can be moved to the right (`View > Appearance > Move Side Bar Right`) if it crowds the editor.

### Editor Area (C)

- Where files open. Each file gets a tab.
- Supports split panes: drag a tab to the side, or use `Ctrl+\`.
- Diff view: right-click a file in Source Control and choose "Open Changes."
- Markdown preview: `Ctrl+Shift+V` while a `.md` file is active.

### Panel (D)

- Horizontal strip at the bottom.
- Default tabs: Terminal, Problems, Output, Debug Console.
- Toggle: `` Ctrl+` `` opens/focuses the Terminal tab; `Ctrl+J` toggles the whole Panel.
- Can be moved to the side (`View > Appearance > Move Panel`).

### Status Bar (E)

- Single line at the very bottom.
- Left side: Git branch, sync status, error/warning counts.
- Right side: language mode, file encoding, line ending, cursor position.
- Click almost anything on the Status Bar to open a related picker or setting.
- Turns orange when a Remote or Dev Container is active.

**Gotchas:**

- The Activity Bar can be hidden (`View > Appearance > Activity Bar`). If you do not see it, you probably hid it accidentally.
- `Ctrl+B` toggles the Side Bar - useful shortcut but it surprises people when hit by accident.

**References:**

- VS Code user interface overview: https://code.visualstudio.com/docs/getstarted/userinterface

---

## Command Palette

**Purpose:** Find and run any VS Code command by name, reducing reliance on memorizing menu paths.

**Why it matters:** VS Code has hundreds of commands. Menus expose a fraction of them. The Command Palette exposes all of them, is searchable, and shows the bound keyboard shortcut. It is the fastest way to do anything in VS Code.

**Opening the Command Palette:**

```text
Ctrl+Shift+P    (all commands, prefixed with >)
Ctrl+P          (file quick-open; type > to switch to commands)
F1              (same as Ctrl+Shift+P)
```

The `>` prefix is what distinguishes "run a command" from "open a file." Remove the `>` and the same box becomes a file fuzzy-finder.

**Key navigation patterns:**

| Input                    | Result                                            |
| ------------------------ | ------------------------------------------------- |
| `>` then a command name  | Find and run any command                          |
| `>ext install`           | Open Extensions: Install Extensions               |
| `>settings`              | Open Settings UI or settings.json                 |
| `>shell`                 | Select default shell for integrated terminal      |
| `>profile`               | Profile commands (create, switch, export, import) |
| `@`                      | Go to a symbol in the current file                |
| `:` followed by a number | Go to line number                                 |
| `?`                      | Show all quick-open help prefixes                 |

**Finding keyboard shortcuts:** Every entry in the Command Palette shows its bound shortcut on the right side. To see and edit all bindings: `Ctrl+K Ctrl+S` or `> Preferences: Open Keyboard Shortcuts`.

**Demo steps:**

1. Press `Ctrl+Shift+P`. Type "close" and observe how results filter as you type.
2. Press `Escape`. Press `Ctrl+P`. Type a filename from `DemoRepo/` (e.g., `Get-DemoStatus`). Press Enter to open it.
3. In the quick-open box, type `>` - notice it switches to command mode. Type "Format Document" and show the shortcut listed on the right.
4. Press `Escape`. Press `Ctrl+Shift+P`. Type "profile" and show the profile commands used in section 03.

**Gotchas:**

- Corporate machines sometimes remap `Ctrl+Shift+P` to a system shortcut. `F1` is a reliable fallback.
- The palette is case-insensitive and does fuzzy matching; partial words work fine.

**References:**

- Command Palette docs: https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette
- Keyboard shortcuts reference (Windows): https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf

---

## Opening a folder or workspace

**Purpose:** Show the two units of work in VS Code - a single folder and a multi-root workspace file.

**Why it matters:** VS Code behaves differently depending on what is open. A `.code-workspace` file gives you multiple roots and allows workspace-scoped settings that override user settings.

**Opening a folder:**

```text
File > Open Folder...            (menu)
Ctrl+K Ctrl+O                    (keyboard)
code .                           (from a terminal in the target directory)
code C:\path\to\folder           (from any terminal)
```

**Workspace files (.code-workspace):**

A `.code-workspace` file is a JSON file that VS Code understands as a multi-root workspace definition.

```json
{
  "folders": [{ "path": "." }, { "path": "../SharedModules" }],
  "settings": {
    "editor.formatOnSave": true
  }
}
```

- Open it with `File > Open Workspace from File...` or by double-clicking it in Explorer.
- Settings inside `"settings"` are scoped to this workspace and override user settings.
- VS Code shows "(Workspace)" in the title bar when a `.code-workspace` file is active.

**Trusting a folder:**

When VS Code opens a folder for the first time it asks whether you trust the workspace. This gates execution of tasks, extensions, and launch configurations.

- Click **Yes, I trust the authors** for your own folders and known repositories.
- Restrict mode disables most extension features; do not leave a work folder in restricted mode.
- Trust settings are stored globally so they persist across restarts.

**Demo steps:**

1. Press `Ctrl+K Ctrl+O`. Navigate to `DemoRepo/` and click **Select Folder**.
2. If the trust prompt appears, click **Yes, I trust the authors**.
3. Show the Explorer Side Bar populated with the module files.
4. From the integrated terminal, `cd` to the repo root and run `code DemoRepo/`. Show the same result from the command line.

**Gotchas:**

- `code .` only works if VS Code's `code` command is on the PATH. On Windows it is added automatically by the installer.
- Opening a parent folder that contains many nested folders can make the Explorer slow on first load. Open the specific module folder, not a large drive root.

**References:**

- Multi-root workspaces: https://code.visualstudio.com/docs/editor/multi-root-workspaces
- Workspace trust: https://code.visualstudio.com/docs/editor/workspace-trust

---

## Accessing settings

**Purpose:** Show the two ways to open and edit VS Code settings and explain the three scopes.

**Why it matters:** Attendees who do not know the difference between User and Workspace settings will be confused when a setting they change appears to have no effect because a narrower scope is overriding it.

**Two ways to open settings:**

```text
Ctrl+,                                        (Settings UI)
> Preferences: Open User Settings (JSON)      (Command Palette - User scope)
> Preferences: Open Workspace Settings (JSON) (Command Palette - Workspace scope)
```

**The three scopes:**

| Scope     | File location                                 | Wins over |
| --------- | --------------------------------------------- | --------- |
| User      | `%APPDATA%\Code\User\settings.json` (Windows) | Default   |
| Workspace | `.vscode/settings.json` in the open folder    | User      |
| Profile   | Stored inside the active profile              | Baseline  |

Narrower scope wins. A Workspace `settings.json` entry overrides the same User setting.

**Profile scope:** When a profile is active, VS Code uses that profile's `settings.json` as the User-level baseline. Opening `Preferences: Open User Settings (JSON)` while a profile is active edits the profile's settings, not the global defaults.

**Workspace scope example:**

```json
{
  "editor.formatOnSave": true,
  "powershell.scriptAnalysis.settingsPath": "PSScriptAnalyzerSettings.psd1",
  "files.encoding": "utf8bom"
}
```

**Demo steps:**

1. Press `Ctrl+,`. In the search box, type "format on save". Show the checkbox.
2. Click the **Open Settings (JSON)** icon (top-right of the Settings UI). Show the raw JSON.
3. Press `Ctrl+Shift+P`. Type "Open Workspace Settings (JSON)". Show the `.vscode/settings.json` file.
4. Point out the scope tabs at the top of the Settings UI: User, Workspace.

**Gotchas:**

- "User settings" when a profile is active means "this profile's settings," not the global defaults. Confirm the active profile in the Status Bar before editing.
- `.vscode/` should usually be committed; `settings.json` and `extensions.json` are team artifacts.

**References:**

- Settings documentation: https://code.visualstudio.com/docs/configure/settings
- Settings scope reference: https://code.visualstudio.com/docs/configure/settings#_settings-precedence

---

## Extensions view

**Purpose:** Show attendees where extensions live, how to find them, and how to install, disable, or uninstall them.

**Why it matters:** Extensions are how VS Code becomes a PowerShell IDE. This sets up section 02 and the conversation about profile-scoped extensions in section 03.

**Opening the Extensions view:**

```text
Ctrl+Shift+X                    (keyboard shortcut)
Activity Bar > Extensions icon  (fourth icon by default)
> Extensions: Focus on Extensions View  (Command Palette)
```

**Anatomy of the Extensions view:**

- **Search box** - type to search the Marketplace.
- **Installed** - extensions present in the active profile.
- **Recommended** - suggestions based on files in the open folder.
- **Marketplace results** - returned when you search.

**Installing an extension:**

1. Search for it by name or ID (e.g., `ms-vscode.powershell`).
2. Click the **Install** button on the card.
3. Using the ID (publisher.name format) is more reliable than the display name:

```powershell
# Install from the terminal (VS Code CLI)
code --install-extension ms-vscode.powershell
```

**Workspace recommendations (.vscode/extensions.json):**

```json
{
  "recommendations": ["ms-vscode.powershell", "DavidAnson.vscode-markdownlint"]
}
```

VS Code shows these in the **Recommended** section and prompts the user to install them.

**Extensions are installed per profile.** An extension installed while the Default profile is active is not present in a dedicated PowerShell profile. This keeps profiles lightweight and focused. Section 03 covers this in detail.

**Demo steps:**

1. Press `Ctrl+Shift+X`. Point out the Installed and Recommended sections.
2. In the search box, type `ms-vscode.powershell`. Show the PowerShell extension card.
3. Do NOT install it yet - that happens in section 02.
4. Type `@installed` in the search box to filter to installed extensions only.
5. Click the gear icon on any installed extension to show the options: Disable, Uninstall, Extension Settings.

**Gotchas:**

- Extension search requires an internet connection. Have extension cards pre-loaded in a browser tab as a fallback.
- The Marketplace can be slow on conference Wi-Fi. Show the extension ID so attendees can search at home if the demo stalls.

**References:**

- Extension Marketplace docs: https://code.visualstudio.com/docs/editor/extension-marketplace
- Workspace recommended extensions: https://code.visualstudio.com/docs/configure/extensions/extension-marketplace#_workspace-recommended-extensions

---

## Integrated terminal

**Purpose:** Open the integrated terminal and select PowerShell 7 as the shell.

**Why it matters:** The integrated terminal is where you will run PowerShell commands, invoke PSScriptAnalyzer, run Pester, and use the Git CLI throughout the session. Getting it pointed at `pwsh` before anything else saves confusion and copy-paste failures later.

**Opening the terminal:**

```text
Ctrl+`                  (backtick - toggle terminal Panel open/closed)
Ctrl+Shift+`            (new terminal instance)
Terminal > New Terminal  (menu)
```

**Setting the default shell:**

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

The PowerShell 7 entry typically shows `C:\Program Files\PowerShell\7\pwsh.exe`.

**Verifying the shell version:**

```powershell
$PSVersionTable.PSVersion
```

Expected:

```text
Major  Minor  Patch  PreReleaseLabel BuildLabel
-----  -----  -----  --------------- ----------
7      5      0
```

If you see `5.1`, the wrong shell profile is selected. Open the shell picker and choose the entry with `pwsh.exe`.

**Custom terminal profile (for profile-clean runs):**

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

**Demo steps:**

1. Press `` Ctrl+` ``. If a terminal is not already open, one starts.
2. Check the shell name in the terminal tab. If it is not `pwsh`, open the `+` dropdown and select PowerShell.
3. Run `$PSVersionTable.PSVersion` and confirm major version 7.
4. Press `` Ctrl+Shift+` `` to open a second terminal. Show two tabs side by side.
5. Close the second terminal with `exit` or by clicking the trash icon on its tab.

**Gotchas:**

- The terminal can be hidden (`Ctrl+J`). If attendees cannot see it, that shortcut toggles it back.
- `` Ctrl+` `` is blocked on some non-US keyboard layouts. Use `Terminal > New Terminal` as a fallback.
- PowerShell profile scripts run on terminal open; `-NoProfile` skips them for clean timing demos.

**References:**

- Integrated terminal docs: https://code.visualstudio.com/docs/terminal/basics
- Terminal profiles: https://code.visualstudio.com/docs/terminal/profiles

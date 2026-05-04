# Opening a Folder or Workspace

## Purpose

Show the two units of work in VS Code - a single folder and a multi-root workspace file - so attendees can open the right thing for the rest of the demos.

## Why it matters

VS Code behaves differently depending on what is open. A folder gives you one root in the Explorer. A `.code-workspace` file gives you multiple roots and allows workspace-scoped settings that override user settings. Most PowerShell authors work with single folders, but knowing `.code-workspace` exists avoids confusion when they encounter one.

## Opening a folder

Three equivalent methods:

```text
File > Open Folder...            (menu)
Ctrl+K Ctrl+O                    (keyboard)
code .                           (from a terminal in the target directory)
code C:\path\to\folder           (from any terminal)
```

The folder becomes the workspace root. VS Code remembers recently opened folders under `File > Open Recent`.

## Workspace files (.code-workspace)

A `.code-workspace` file is a JSON file that VS Code understands as a multi-root workspace definition.

Minimal example:

```json
{
  "folders": [{ "path": "." }, { "path": "../SharedModules" }],
  "settings": {
    "editor.formatOnSave": true
  }
}
```

Key points:

- Open it with `File > Open Workspace from File...` or by double-clicking it in Explorer.
- Settings inside `"settings"` are scoped to this workspace and override user settings.
- Each folder gets its own root in the Explorer Side Bar.
- VS Code shows "(Workspace)" in the title bar when a `.code-workspace` file is active.

## Trusting a folder

When VS Code opens a folder for the first time it asks whether you trust the workspace. This gates execution of tasks, extensions, and launch configurations.

- Click **Yes, I trust the authors** for your own folders and known repositories.
- Restrict mode disables most extension features; do not leave a work folder in restricted mode.
- Trust settings are stored globally (not in the folder) so they persist across restarts.

## Demo steps

1. Press `Ctrl+K Ctrl+O`. Navigate to `Demos/MyDemoModule/` and click **Select Folder**.
2. If the trust prompt appears, click **Yes, I trust the authors**.
3. Show the Explorer Side Bar populated with the module files.
4. Close the folder (`File > Close Folder`).
5. From the integrated terminal, `cd` to the repo root and run `code Demos/MyDemoModule/`. Show the same result from the command line.

## Gotchas

- `code .` only works if VS Code's `code` command is on the PATH. On Windows it is added automatically by the installer; on macOS run `Shell Command: Install 'code' command in PATH` from the Command Palette.
- Opening a parent folder that contains many nested folders can make the Explorer slow on first load. Open the specific module folder, not a large drive root.
- A `.code-workspace` file with relative paths breaks if the file is moved. Use relative paths from the workspace file location, not from a drive root.

## References

- Multi-root workspaces: https://code.visualstudio.com/docs/editor/multi-root-workspaces
- Workspace trust: https://code.visualstudio.com/docs/editor/workspace-trust


---

[Back to README](./README.md)
# UI Orientation

## Purpose

Name and locate the five main regions of the VS Code window so attendees share a vocabulary for the rest of the session.

## Why it matters

Demo instructions like "click the Extensions icon in the Activity Bar" are meaningless to someone who cannot find the Activity Bar. A 60-second tour eliminates that friction for the entire session.

## The five regions

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
- Toggle: `Ctrl+backtick` opens/focuses the Terminal tab; `Ctrl+J` toggles the whole Panel.
- Can be moved to the side (`View > Appearance > Move Panel`).

### Status Bar (E)

- Single line at the very bottom.
- Left side: Git branch, sync status, error/warning counts.
- Right side: language mode, file encoding, line ending, cursor position.
- Click almost anything on the Status Bar to open a related picker or setting.
- Turns orange when a Remote or Dev Container is active.

## Demo steps

1. Open VS Code. If no folder is open, the Status Bar is purple/blue.
2. Point to each region by hovering the mouse and naming it.
3. Click each Activity Bar icon once to show its Side Bar view, then click again to collapse.
4. Open a file; split the editor with `Ctrl+\`; close the second group with `Ctrl+W`.
5. Press `Ctrl+J` to hide the Panel; press again to show it.

## Gotchas

- The Activity Bar can be hidden (`View > Appearance > Activity Bar`). If an attendee does not see it, they have probably hidden it accidentally.
- `Ctrl+B` toggles the Side Bar - useful shortcut but it surprises people when they hit it by accident.
- The Panel and Side Bar positions reset to defaults when a new profile is created. Show the final desired layout after profiling.

## References

- VS Code user interface overview: https://code.visualstudio.com/docs/getstarted/userinterface


---

[Back to README](./README.md)
# Keybindings and snippets

## Purpose

Two small productivity multipliers for PowerShell authors.

## Why it matters

A handful of keybindings and snippets cover most of the boilerplate-heavy moments in PowerShell module work (function skeletons, `param` blocks, Pester scaffolds, comment-based help).

## Recommended keybindings

Open `Preferences: Open Keyboard Shortcuts (JSON)` and add:

```json
[
  {
    "key": "ctrl+f5",
    "command": "PowerShell.RunSelection",
    "when": "editorTextFocus && editorLangId == 'powershell'"
  },
  {
    "key": "ctrl+alt+f",
    "command": "editor.action.formatDocument",
    "when": "editorTextFocus && editorLangId == 'powershell'"
  },
  {
    "key": "ctrl+k ctrl+t",
    "command": "workbench.action.selectTheme"
  }
]
```

## Recommended snippets

Open `Preferences: Configure User Snippets` -> `powershell.json`. Or use the file we ship at [../Samples/snippets/powershell.json](../Samples/snippets/powershell.json).

Snippets included:

- `func` - advanced function skeleton with `[CmdletBinding()]`, `param`, `process`
- `cbh` - comment-based help block
- `pester` - `Describe` / `Context` / `It` scaffold
- `psd1` - module manifest skeleton
- `try` - try / catch / finally with `$ErrorActionPreference`

## Demo steps

1. In a new `.ps1` file, type `func` -> Tab. Walk through the placeholders.
2. Above the function, type `cbh` -> Tab. Show the help block.
3. In a `*.Tests.ps1` file, type `pester` -> Tab.
4. Show `Ctrl+Alt+F` running the formatter.

## Gotchas

- Snippets are profile-scoped; switching profiles changes which snippets are available.
- Multi-cursor + snippet expansion behaves oddly; demo with a single cursor.
- The PowerShell extension also ships some built-in snippets (e.g., `function`); ours start with `func` to avoid the conflict.

## References

- Keybindings: https://code.visualstudio.com/docs/configure/keybindings
- User snippets: https://code.visualstudio.com/docs/editor/userdefinedsnippets


---

[Back to README](./README.md)
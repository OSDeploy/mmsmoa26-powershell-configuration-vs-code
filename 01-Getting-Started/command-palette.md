# Command Palette

## Purpose

Teach attendees to find and run any VS Code command by name, reducing reliance on memorizing menu paths.

## Why it matters

VS Code has hundreds of commands. Menus expose a fraction of them. The Command Palette exposes all of them, is searchable, and shows the bound keyboard shortcut alongside each command. It is the fastest way to do anything in VS Code and the single most useful thing a new user can learn.

## Opening the Command Palette

```text
Ctrl+Shift+P    (all commands, prefixed with >)
Ctrl+P          (file quick-open; type > to switch to commands)
F1              (same as Ctrl+Shift+P)
```

The `>` prefix in the input box is what distinguishes "run a command" from "open a file." Remove the `>` and the same box becomes a file fuzzy-finder.

## Key navigation patterns

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

## Finding keyboard shortcuts

Every entry in the Command Palette shows its bound keyboard shortcut on the right side. This is the fastest way to discover shortcuts without reading documentation.

To see and edit all bindings: `Ctrl+K Ctrl+S` or `> Preferences: Open Keyboard Shortcuts`.

## Demo steps

1. Press `Ctrl+Shift+P`. Type "close" and observe how results filter as you type.
2. Press `Escape`. Press `Ctrl+P`. Type a filename from `Demos/MyDemoModule/` (e.g., `Get-DemoStatus`). Press Enter to open it.
3. In the quick-open box, type `>` - notice it switches to command mode. Type "Format Document" and show the shortcut listed on the right.
4. Press `Escape`. Press `Ctrl+Shift+P`. Type "profile" and show the profile commands we will use in the next section.

## Gotchas

- Corporate machines sometimes remap `Ctrl+Shift+P` to a system shortcut. `F1` is a reliable fallback.
- When demonstrating, type slowly. Attendees need time to follow along on their own keyboards.
- The palette is case-insensitive and does fuzzy matching; partial words work fine.

## References

- Command Palette docs: https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette
- Keyboard shortcuts reference (Windows): https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf


---

[Back to README](./README.md)
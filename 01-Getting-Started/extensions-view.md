# Extensions View

## Purpose

Show attendees where extensions live, how to find them, and how to install, disable, or uninstall them - without yet installing anything specific.

## Why it matters

Extensions are how VS Code becomes a PowerShell IDE. Before section 02 walks through the essential extensions, attendees need to know how to reach the Extensions view and what the search results mean. This also sets up the conversation about profile-scoped extensions in section 03.

## Opening the Extensions view

```text
Ctrl+Shift+X                    (keyboard shortcut)
Activity Bar > Extensions icon  (fourth icon by default)
> Extensions: Focus on Extensions View  (Command Palette)
```

## Anatomy of the Extensions view

The Side Bar splits into:

- **Search box** at the top - type to search the Marketplace.
- **Installed** - extensions present in the active profile.
- **Recommended** - suggestions based on files in the open folder.
- **Marketplace results** - returned when you search.

Each extension card shows: name, publisher, download count, rating, and a brief description.

## Installing an extension

1. Search for it by name or ID (e.g., `ms-vscode.powershell`).
2. Click the **Install** button on the card.
3. The extension downloads, installs, and often activates immediately.
4. Some extensions require a window reload; VS Code prompts if needed.

Using the ID (publisher.name format) is more reliable than the display name in demos and scripts:

```powershell
# Install from the terminal (VS Code CLI)
code --install-extension ms-vscode.powershell
```

## Recommended extensions (.vscode/extensions.json)

A repository can suggest extensions to anyone who opens it:

```json
{
  "recommendations": ["ms-vscode.powershell", "DavidAnson.vscode-markdownlint"]
}
```

VS Code shows these in the **Recommended** section of the Extensions view and prompts the user to install them.

## Extension scopes and profiles

Extensions are installed per profile. An extension installed while the Default profile is active is not present in a dedicated PowerShell profile (and vice versa). This is a feature, not a bug - it keeps profiles lightweight and focused.

Section 03 covers this in detail.

## Demo steps

1. Press `Ctrl+Shift+X`. Point out the Installed and Recommended sections.
2. In the search box, type `ms-vscode.powershell`. Show the PowerShell extension card.
3. Do NOT install it yet - that happens in section 02 where we explain why each extension matters.
4. Type `@installed` in the search box to filter to installed extensions only. Show what is present in the current profile.
5. Click the gear icon on any installed extension to show the options: Disable, Uninstall, Extension Settings.

## Gotchas

- Extension search requires an internet connection. Have the extension cards pre-loaded in a browser tab as a fallback.
- The Marketplace can be slow on conference Wi-Fi. Show the extension ID so attendees can search at home if the demo stalls.
- Extensions installed as dependencies of another extension appear in the list but are managed by their parent. Do not uninstall them directly.

## References

- Extension Marketplace docs: https://code.visualstudio.com/docs/editor/extension-marketplace
- Extensions: recommended by workspace: https://code.visualstudio.com/docs/editor/extension-marketplace#_workspace-recommended-extensions


---

[Back to README](./README.md)
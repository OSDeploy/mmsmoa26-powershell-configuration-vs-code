# How To: Open Markdown Files in Preview by Default

By default, VS Code opens `.md` files in the text editor. This guide shows how to open them directly in the built-in Markdown preview instead.

## Steps

1. Open the Command Palette (`Ctrl+Shift+P`) and run **Preferences: Open User Settings (JSON)**.

2. Add the following settings:

```json
"workbench.editorAssociations": {
    "*.md": "vscode.markdown.preview.editor"
},
"markdown.preview.openMarkdownLinks": "inPreview"
```

3. Save the file. All `.md` files will now open in preview mode automatically.

## What Each Setting Does

| Setting | Purpose |
|---|---|
| `workbench.editorAssociations` | Maps `*.md` files to the built-in Markdown preview editor instead of the text editor |
| `markdown.preview.openMarkdownLinks` | Ensures links within the preview that target other `.md` files also open in preview (not the editor) |

## Notes

- To temporarily open a Markdown file in the text editor, right-click the file in the Explorer and choose **Open With... > Text Editor**.
- To toggle between preview and source at any time, use `Ctrl+Shift+V` (open preview) or click the preview icon in the editor toolbar.
- Workspace-level overrides can be placed in `.vscode/settings.json` to apply only to a specific project.

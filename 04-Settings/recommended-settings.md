# Recommended settings

## Purpose

Give attendees a defensible settings baseline they can paste into `settings.json`.

## Why it matters

Defaults are fine for casual editing; PowerShell module work needs deterministic encoding, line endings, and formatting. The same baseline shipped in [../Samples/settings.json](../Samples/settings.json).

## Settings (paste into User or Profile settings.json)

```json
{
  "editor.formatOnSave": true,
  "editor.formatOnPaste": false,
  "editor.tabSize": 4,
  "editor.insertSpaces": true,
  "editor.rulers": [80, 120],
  "editor.renderWhitespace": "boundary",
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": "active",

  "files.encoding": "utf8bom",
  "files.eol": "\r\n",
  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,
  "files.autoSave": "onFocusChange",

  "[powershell]": {
    "editor.tabSize": 4,
    "editor.insertSpaces": true,
    "editor.semanticHighlighting.enabled": true,
    "files.encoding": "utf8bom"
  },

  "terminal.integrated.defaultProfile.windows": "PowerShell",
  "terminal.integrated.profiles.windows": {
    "PowerShell": {
      "source": "PowerShell",
      "icon": "terminal-powershell"
    }
  },

  "telemetry.telemetryLevel": "off",
  "update.mode": "start",
  "workbench.editor.enablePreview": false,
  "workbench.startupEditor": "none"
}
```

## Demo steps

1. `Preferences: Open User Settings (JSON)`.
2. Paste the block above.
3. Save. Reload not required.
4. Open a `.ps1` file from `Demos/MyDemoModule/`, edit, save - format on save fires.
5. Show the file in `Get-Content -Path file.ps1 -Encoding Byte | Select-Object -First 3` to confirm UTF-8 BOM.

## Gotchas

- `files.encoding": "utf8bom"` is critical for Windows PowerShell 5.1 compatibility. Without the BOM, PS 5.1 reads scripts as ANSI and corrupts non-ASCII characters.
- `files.eol": "\r\n"` matches Windows tools; if your team is cross-platform, set per-language or rely on `.gitattributes`.
- `editor.formatOnPaste` is intentionally off - it surprises people pasting examples.

## References

- Settings reference: https://code.visualstudio.com/docs/configure/settings
- File encoding: https://code.visualstudio.com/docs/configure/settings#_files

# Inline completions

## Purpose

Use Copilot ghost text while typing PowerShell.

## Why it matters

Most of the productivity gain from Copilot for module authors is boilerplate: parameter blocks, switch logic, comment-based help, repetitive object construction.

## Settings

```json
{
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "markdown": true,
    "powershell": true
  },
  "editor.inlineSuggest.enabled": true,
  "editor.inlineSuggest.showToolbar": "onHover"
}
```

## Keys to remember

| Key | Action |
|-----|--------|
| `Tab` | Accept full suggestion |
| `Ctrl+Right Arrow` | Accept next word |
| `Esc` | Dismiss |
| `Alt+]` / `Alt+[` | Cycle alternate suggestions |
| `Ctrl+Enter` | Open suggestions panel |

## Demo steps

1. In `MyDemoModule.psm1`, type:

   ```powershell
   # Returns the current OS build number as a [System.Version]
   function Get-DemoOsBuild {
   ```

2. Pause. Copilot proposes a body. Review. Accept with `Tab`.
3. Add a `param([switch]$AsString)` and let Copilot extend the body.
4. Cycle alternate suggestions with `Alt+]` to show variation.

## Gotchas

- Suggestions are influenced by surrounding files and open editors. Curate what is open.
- Copilot will happily invent cmdlets. Verify with `Get-Command` before merging.
- The PowerShell extension's IntelliSense and Copilot ghost text can collide visually. Tune `editor.suggest` if needed.

## References

- https://code.visualstudio.com/docs/copilot/ai-powered-suggestions

# Effective PowerShell prompts

## Purpose

Get useful PowerShell out of Copilot more often than not.

## Why it matters

Generic prompts give generic code. PowerShell has strong conventions (advanced functions, `[CmdletBinding()]`, comment-based help, pipeline support, `ShouldProcess`) that Copilot will follow if you ask, and ignore if you do not.

## Prompt patterns that work

### 1. Specify the contract

```
Write an advanced function Get-DemoStatus that:
- Has [CmdletBinding()]
- Accepts a -ComputerName string array from the pipeline by value and by property name
- Emits one [pscustomobject] per computer with properties Computer, Online, Build
- Uses Test-Connection for the Online check (PowerShell 7 syntax)
- Has comment-based help with .SYNOPSIS, .EXAMPLE, .OUTPUTS
- Targets PowerShell 7
```

### 2. Anchor on existing code

Open a representative file. Say: "Match the style of the surrounding functions in this file."

### 3. Ask for tests, not just code

"Also generate a Pester 5 test that mocks `Test-Connection`."

### 4. Constrain the output

"Return only the function. No prose. No markdown fences."

### 5. Iterate in small steps

Ask for a skeleton, accept it, then ask for the body. Easier to review than a 200-line drop.

## Anti-patterns

- "Write me a script that does X" with no details. Copilot will guess.
- Asking for security-sensitive code (credential handling, SAS tokens) without specifying SecretManagement.
- Mixing Windows PowerShell 5.1 idioms and PowerShell 7 idioms in the same prompt.

## Demo steps

1. In `Demos/MyDemoModule/`, place the cursor in a new file. Use the contract prompt above (paste from a snippet).
2. Show the result, accept.
3. Ask for tests in a follow-up prompt.
4. Ask Copilot to "Refactor to use the pipeline `process` block." Compare diffs.

## Gotchas

- Copilot may invent cmdlets (`Test-OnlineFast`, `Get-WindowsVersion`). Verify everything with `Get-Command`.
- Aliases sneak in (`%`, `?`, `gci`). Add "no aliases" to the prompt if your style forbids them.
- Comment-based help quality varies; treat it as a draft.

## References

- about_Functions_Advanced: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_functions_advanced
- about_Comment_Based_Help: https://learn.microsoft.com/powershell/module/microsoft.powershell.core/about/about_comment_based_help

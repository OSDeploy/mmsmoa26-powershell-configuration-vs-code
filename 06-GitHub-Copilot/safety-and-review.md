# Safety and review

## Purpose

Use Copilot without shipping a vulnerability or a hallucination.

## Why it matters

Copilot generates plausible code. Plausible is not the same as correct or secure.

## Rules of the road

1. Read every diff before accepting.
2. Run tests after every Edit/Agent acceptance.
3. Never paste real secrets into a prompt; the prompt is sent to the service.
4. Treat Copilot output as authored by an unknown contributor - PR and review apply.
5. Verify every cmdlet exists with `Get-Command`.
6. Verify external commands and modules; Copilot will invent module names.

## Settings worth knowing

```json
{
  "github.copilot.advanced": {
    "length": 500
  },
  "github.copilot.chat.localeOverride": "en",
  "github.copilot.editor.enableCodeActions": true
}
```

## Org-level controls (Business / Enterprise)

- **Public code filter** - blocks suggestions that match public code.
- **Content exclusions** - exclude paths or repos from being sent.
- **Audit logs** - who used Copilot, when.
- **Model picker policy** - restrict which models can be used.

Verify on github.com -> your org -> Settings -> Copilot.

## PowerShell-specific risks

- **Execution policy bypass suggestions** - reject `-ExecutionPolicy Bypass` in any output.
- **Plain-text credentials** - reject; demand SecretManagement.
- **`Invoke-Expression`** - usually a smell; reject unless you can justify it.
- **Hardcoded PATs / connection strings** - reject; use environment variables or a secret store.
- **Outdated cmdlets** - PS 7 deprecated some, e.g., `WMI` cmdlets vs `CIM`. Check.

## Demo steps

1. Ask Copilot: "Write me a function that downloads a file using a PAT." Show the diff. Reject the plaintext PAT pattern. Re-prompt requiring `SecretManagement`.
2. Show `Workspace Trust` gating Agent mode in an untrusted folder.
3. Open the org Copilot settings page (browser tab) so attendees see what to look for.

## Gotchas

- Copilot Chat history is retained per-account; do not paste customer data into prompts.
- "Suggestions matching public code" filter applies to inline completions, not chat output.
- Reviewing big agent-mode diffs is hard; keep tasks small.

## References

- Responsible use of Copilot: https://docs.github.com/en/copilot/responsible-use-of-github-copilot-features
- Content exclusions: https://docs.github.com/en/copilot/managing-copilot/managing-copilot-for-your-organization/excluding-content-from-github-copilot


---

[Back to README](./README.md)
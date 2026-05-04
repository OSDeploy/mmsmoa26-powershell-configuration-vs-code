# Starter profile walkthrough

## Purpose

Show attendees the profile we built for them and how to load it.

## Why it matters

This is the "walk away with a customizable starter profile" deliverable from the session description.

## Where it lives

[../Samples/](../Samples/) in this repo:

- `settings.json` - source-of-truth settings
- `extensions.txt` - one extension ID per line
- `snippets/powershell.json` - PowerShell snippets
- `mmsmoa26.code-profile` - exported binary (generated at prep time)
- `README.md` - how to (re)build the export

## Demo steps

1. From a fresh VS Code window, `Profiles: Import Profile...`.
2. Select `mmsmoa26.code-profile` from the cloned repo (or paste the Gist URL we put on the slide).
3. The window reloads into a profile named `mmsmoa26`. Confirm the name in the gear menu.
4. Open `Demos/MyDemoModule/` (see [../Demos/MyDemoModule/](../Demos/MyDemoModule/)) so the profile is in use against a real workspace.
5. Show the Extensions view: PowerShell, Copilot, GitHub PRs, GitHub Actions, GitHub Repositories, etc. all installed.
6. Open `MyDemoModule.psm1` to confirm syntax highlighting, formatting, and the Integrated Console all work without further setup.

## Gotchas

- Importing creates a new profile; it does not overwrite an existing one. Rename or delete the old one if you want a clean slate.
- Extension installs may take 30 - 60 seconds on first import. Pre-import before the session if you can.
- The starter profile assumes PowerShell 7 is installed. The terminal default profile points at `pwsh.exe`.

## References

- [../Samples/README.md](../Samples/README.md)


---

[Back to README](./README.md)
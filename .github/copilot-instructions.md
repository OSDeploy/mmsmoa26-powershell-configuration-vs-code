# Copilot Instructions — MMSMOA 2026: Master PowerShell Configuration in VS Code

These instructions guide GitHub Copilot (and any AI assistant) when working in this repository. The repo contains the materials for a single conference session.

## Conference

- Event: MMS 2026 at MOA (Mall of America)
- Session title: Master PowerShell Configuration in VS Code
- Session URL: https://mms2026atmoa.sched.com/event/2HHGJ/master-powershell-configuration-in-vs-code
- Date / time: Monday, May 4, 2026, 3:00 PM - 4:45 PM CDT
- Room: Cedar
- Format: 60 minutes presentation + live demos, followed by 45 minutes of Q&A (105 minutes total)

## Speakers

- **David Segura** - Senior Software Engineer, Recast Software. Microsoft MVP (PowerShell). Known for OSDCloud, the OSD PowerShell module, and OSDBuilder. Community focus is Windows OS Deployment.
- **Jeff Scripter** - Staff Engineer, Recast Software. Focus areas include Windows and AI integration.

## Session description (from Sched)

A practical, fresh-install approach to configuring VS Code for PowerShell work. Covers profiles, recommended settings, essential extensions, GitHub integration, and GitHub Copilot setup. Attendees walk away with a customizable starter profile, synchronized settings, trusted remotes, and a strategic path to enhance PowerShell editing, version control, and AI-assisted code authoring.

## Learning objectives (must be covered)

1. Create and manage customized VS Code profiles designed for effective PowerShell work.
2. Implement recommended settings, including formatting and security, as well as essential PowerShell extensions.
3. Integrate VS Code with GitHub for efficient cloning, branching, committing, and change review.
4. Set up GitHub Copilot for advanced PowerShell coding assistance.

These map 1:1 to folders `03-Profiles/`, `04-Settings/`, `05-GitHub-Integration/`, and `06-GitHub-Copilot/`.

## Repository layout

```
.github/                      # Copilot instructions (this file)
00-Introduction/              # 5 min intro
01-VS-Code-First-Run/         # 8 min UI orientation and first-run essentials
02-Extensions/                # 5 min essential extensions list and bulk install
03-Profiles/                  # Learning objective 1
04-Settings/                  # Learning objective 2
05-GitHub-Integration/        # Learning objective 3
06-GitHub-Copilot/            # Learning objective 4
07-Wrap-Up/                   # 3 min wrap + Q&A prep
Samples/                      # Shippable starter VS Code profile assets
Demos/                        # Sample PowerShell module used in the GitHub demo
Presentation/                 # IGNORED - slide placeholders, do not edit
README.md                     # Full session outline
```

Each section folder has a `README.md` (objectives, timing, demo outline, talking points) and one Markdown file per subtopic.

## Scope guardrails

- **Ignore `Presentation/`.** Treat its contents as opaque placeholders. Do not read, edit, or reference them.
- Do not invent attendees, sponsors, or other sessions.
- Do not change the session title, learning objectives, or timing without an explicit request.
- Do not generate slides; this repo holds outlines, talking points, demo scripts, and reusable configuration only.

## Content style

- Audience: IT pros and Windows admins who use PowerShell daily and want a stronger VS Code workflow. Assume PowerShell fluency, not VS Code fluency.
- Tone: practical, concise, demo-driven. Prefer numbered steps over prose.
- Per-subtopic Markdown template: `Purpose`, `Why it matters`, `Settings / commands`, `Demo steps`, `Gotchas`, `References`.
- Keep individual subtopic files short (roughly one printed page).
- Use Markdown only. No emojis. No marketing language.
- Use ASCII characters only in `.md`, `.ps1`, and `.psm1` files (avoid em-dashes, smart quotes, non-breaking spaces). PowerShell 5.1 reads files without a BOM as ANSI and corrupts multi-byte UTF-8.
- Use fenced code blocks with a language tag (` ```powershell `, ` ```json `, ` ```text `).

## Technical targets

- Primary: Windows 11 with PowerShell 7.x.
- Secondary: call out Windows PowerShell 5.1 differences when they affect attendees (encoding, module compatibility, ISE migration).
- VS Code: stable channel. Use Insiders only when a feature requires it and label it clearly.
- Extensions referenced by ID (e.g., `ms-vscode.powershell`, `github.copilot`, `github.vscode-pull-request-github`, `github.vscode-github-actions`, `github.remotehub`, `DavidAnson.vscode-markdownlint`, `tobysmith568.run-in-powershell`, `esbenp.prettier-vscode`).
- Settings shown as JSON snippets from `settings.json` so attendees can paste them.

## Demo conventions

- Every demo must work from a fresh VS Code profile so it can be reproduced in the room.
- List demo steps as a numbered checklist. Include the exact command, menu path, or keybinding.
- Note expected outcome and a fallback if the demo fails (no internet, sign-in prompt, etc.).
- For GitHub demos, use the in-repo `Demos/MyDemoModule/` scaffold; do not depend on private repos.

## Linking

- Use workspace-relative Markdown links between section READMEs and their subtopic files.
- Section READMEs link back to root `README.md`.
- Cite official Microsoft / GitHub docs in `References` sections; avoid blog links unless authored by a speaker or a recognized maintainer.

## When asked to add or change content

1. Confirm which learning objective and section the change belongs to.
2. Update the section `README.md` table of contents if a subtopic file is added or removed.
3. Keep timing in section READMEs consistent with the master timing table in the root `README.md`.
4. Do not introduce new top-level folders without an explicit request.

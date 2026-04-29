# 00 - Introduction

**Time:** 0 - 5 minutes | **Owner:** David

Set the stage: who we are, why this session, and what attendees will walk away with.

---

## Section overview

**Objectives:**

- Introduce the speakers and their context.
- Frame the session as a fresh-install playbook for PowerShell + VS Code.
- Confirm the agenda and the deliverable starter profile.
- Surface prerequisites for hands-on follow-along.

**Talking points:**

1. Welcome to MMS at MOA. Thank attendees for choosing this session over a competing slot.
2. Quick speaker intros (45 seconds each).
3. Why this session exists: every PowerShell author re-invents their VS Code setup; we will give you ours.
4. The pitch: by the end you have (a) a starter profile you can import, (b) a settings baseline you can defend, (c) a working GitHub flow, (d) Copilot configured for PowerShell.
5. Show the agenda slide.
6. Call out the format: 60 minutes content, 45 minutes Q&A. We will not rush.
7. Prereqs callout for hands-on attendees. It is fine to just watch.

**Demo:** None. Have VS Code already open on the projector with the starter profile loaded so attendees see the destination state.

---

## Conference and session metadata

| Field         | Value                                                                                 |
| ------------- | ------------------------------------------------------------------------------------- |
| Event         | MMS 2026 at MOA                                                                       |
| Session title | Master PowerShell Configuration in VS Code                                            |
| Session ID    | 2HHGJ                                                                                 |
| Date          | Monday, May 4, 2026                                                                   |
| Time          | 3:00 PM - 4:45 PM CDT                                                                 |
| Duration      | 105 minutes (60 content + 45 Q&A)                                                     |
| Room          | Cedar                                                                                 |
| Speakers      | David Segura, Jeff Scripter                                                           |
| Sched URL     | https://mms2026atmoa.sched.com/event/2HHGJ/master-powershell-configuration-in-vs-code |

**Session description:**

> A practical, fresh-install approach. Start from a fresh installation to master profiles, recommended settings, essential extensions, GitHub integration, and GitHub Copilot setup. Attendees will walk away with a customizable starter profile, synchronized settings, trusted remotes, and a strategic path to enhance PowerShell editing, version control, and AI-assisted code authoring, equipped with resources for easy replication.

**What you will learn:**

- Create and manage customized VS Code profiles designed for effective PowerShell work.
- Implement recommended settings, including formatting and security, as well as essential PowerShell extensions.
- Integrate VS Code with GitHub for efficient cloning, branching, committing, and change review.
- Set up GitHub Copilot for advanced PowerShell coding assistance.

---

## Agenda

| #   | Section            | Time     | Minutes | Lead  |
| --- | ------------------ | -------- | ------- | ----- |
| 00  | Introduction       | 0 - 5    | 5       | David |
| 01  | VS Code First Run  | 5 - 13   | 8       | Jeff  |
| 02  | Extensions         | 13 - 18  | 5       | David |
| 03  | Profiles           | 18 - 30  | 12      | David |
| 04  | Settings           | 30 - 43  | 13      | David |
| 05  | GitHub Integration | 43 - 55  | 12      | Jeff  |
| 06  | GitHub Copilot     | 55 - 65  | 10      | Jeff  |
| 07  | Wrap-Up            | 65 - 68  | 3       | Both  |
| --  | Q&A                | 68 - 105 | 37      | Both  |

**Pacing notes:**

- Hard transition at minute 43 to keep enough time for GitHub + Copilot demos.
- If running long, sacrifice the GitHub Repositories demo in section 05 first, then the Copilot Edit-mode multi-file demo in section 06.
- If running short, expand the Copilot custom-instructions demo in section 06 - it is the one attendees rarely have seen.
- Q&A starts no later than minute 70. If the room is quiet, seed with the prepared questions in [../07-Wrap-Up/qa-prep.md](../07-Wrap-Up/qa-prep.md).

---

## Speakers

### David Segura

- Senior Software Engineer, Recast Software
- Microsoft MVP - PowerShell
- Community focus: Windows OS deployment
- Best known for: OSDCloud, the OSD PowerShell module, OSDBuilder
- Sched: https://mms2026atmoa.sched.com/speaker/david_segura.27tenlxt

### Jeff Scripter

- Staff Engineer, Recast Software
- Focus areas: Windows, AI integration
- Sched: https://mms2026atmoa.sched.com/speaker/jeff_scripter.28jia85t

### Proposed speaker split

| Section               | Lead  |
| --------------------- | ----- |
| 00 Introduction       | Jeff  |
| 01 VS Code First Run  | Jeff  |
| 02 Extensions         | Jeff  |
| 03 Profiles           | David |
| 04 Settings           | David |
| 05 GitHub Integration | David |
| 06 GitHub Copilot     | Jeff  |
| 07 Wrap-Up + Q&A      | Jeff  |

Confirm the split during dry run. Either presenter can take any section if needed.

---

## Prerequisites

Attendees who want to follow along on a laptop should install these before the session. Watching only is also fine.

### Required

- Windows 11 (Windows 10 22H2 works; macOS / Linux work but demos are Windows)
- Visual Studio Code (stable channel) - https://code.visualstudio.com/
- PowerShell 7.x - `winget install --id Microsoft.PowerShell`
- Git for Windows - `winget install --id Git.Git`
- A GitHub account - https://github.com/join

### Recommended

- GitHub Copilot subscription (Free tier works for the demos) - https://github.com/features/copilot
- Windows Terminal - `winget install --id Microsoft.WindowsTerminal`
- A Nerd Font (for terminal icons) - https://www.nerdfonts.com/

### One-shot install (PowerShell, run as admin or with --scope user)

```powershell
winget install --id Microsoft.PowerShell --source winget
winget install --id Microsoft.VisualStudioCode --source winget
winget install --id Git.Git --source winget
winget install --id Microsoft.WindowsTerminal --source winget
```

### Verify

```powershell
$PSVersionTable.PSVersion       # Expect 7.x
code --version                   # Expect a build number
git --version                    # Expect git version 2.x
```

### Sign-ins to have ready

- GitHub credentials (browser sign-in works fine; have 2FA device handy)
- Microsoft / GitHub account that owns your Copilot subscription, if any

### Things you do NOT need

- Admin rights on a corporate machine - all demos work with user-scoped installs.
- An existing PowerShell module to publish - we use `DemoRepo/` from this session.
- Azure or any cloud account.

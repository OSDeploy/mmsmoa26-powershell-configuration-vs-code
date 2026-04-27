# Authentication and trust

## Purpose

Get signed in once, securely, and not think about it again.

## Why it matters

Auth failures are the most common reason a "quick demo" stops being quick. Set this up before walking on stage and it stays out of the way.

## Sign-in flow

1. Click the Accounts icon (avatar, bottom-left).
2. Choose `Sign in with GitHub to use GitHub features`.
3. Browser opens -> approve -> redirect back to VS Code.
4. The same token is used by Source Control auth (push/pull) and the GitHub PRs extension.

## Git Credential Manager

VS Code on Windows uses Git Credential Manager (GCM) shipped with Git for Windows. Verify:

```powershell
git config --global credential.helper
# Expect: manager
```

Do not paste a PAT into a `.gitconfig`. GCM handles OAuth token refresh automatically.

## Signed commits (optional but recommended)

```powershell
git config --global user.name  "David Segura"
git config --global user.email "david@example.com"
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey "$HOME\.ssh\id_ed25519.pub"
```

Then upload the public key to GitHub -> Settings -> SSH and GPG keys -> New SSH key (type: Signing).

## Workspace Trust on cloned repos

Cloning prompts for trust on first open. Trust the local clone of the session repo and `DemoRepo/`. Untrusted folders cannot run tasks or debug.

## Demo steps

1. Sign in to GitHub via Accounts.
2. Run `git config --global credential.helper` to show GCM.
3. (Pre-staged) show a signed commit on `github.com` with the green "Verified" badge.
4. Open a freshly cloned repo and trust it.

## Gotchas

- Corporate proxies break browser-based OAuth. Have a `gh auth login --with-token` fallback ready.
- Two accounts on the same machine? Sign out completely; do not stack accounts in the Accounts view.
- VS Code sometimes caches a stale token; `Developer: Reload Window` after sign-in fixes most issues.

## References

- VS Code authentication: https://code.visualstudio.com/docs/sourcecontrol/github#_authentication
- Git Credential Manager: https://github.com/GitCredentialManager/git-credential-manager
- Signed commits: https://docs.github.com/en/authentication/managing-commit-signature-verification

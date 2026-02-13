# dotfiles

Personal macOS bootstrap setup.

Clean. Minimal. Reproducible.

---

## 🚀 One-line install

Run this on a fresh macOS machine:

curl -fsSL https://raw.githubusercontent.com/vlipatov/dotfiles/master/bootstrap.sh | bash

---

## 🧱 What gets installed

- Homebrew
- Brew packages (see `Brewfile`)
- mise (HOME install)
- Oh My Zsh
- Powerlevel10k
- Zsh plugins
- tmux
- tmux plugins (TPM)
- SSH key (if missing)
- Git config (if empty)

---

## 🔧 After first install

1. Restart your terminal
2. Run `tmux`
3. Press `C-a`, then `I` (uppercase i) to install tmux plugins

---

## 🔐 GitHub setup (first time only)

### Add SSH key to GitHub

Show your public key:

`cat ~/.ssh/id_ed25519.pub`

Add it here:

GitHub → Settings → SSH and GPG keys → New SSH key

Official docs:  
https://docs.github.com/en/authentication/connecting-to-github-with-ssh

### Authenticate GitHub CLI (optional)

Run:

`gh auth login`

Official docs:  
https://docs.github.com/en/github-cli/github-cli/quickstart

### Personal Access Tokens (if needed)

https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

---

## 🧠 Keybindings

| Keys | Action |
|------|--------|
| `← →` | move by character |
| `Shift + ← →` | move by word |
| `Option + ← →` | switch tmux panes |
| `Command + ← →` | switch tmux windows |
| `C-a` | tmux prefix |

---

## 🔁 Updating

- `cd ~/dotfiles`
- `git pull`
- `bash install.sh`

---

Minimal. Transparent. Deterministic.

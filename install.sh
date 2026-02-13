#!/usr/bin/env bash
set -e

echo "==> Installing Xcode CLI tools"
xcode-select --install 2>/dev/null || true

echo "==> Installing Homebrew (if needed)"
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing Brew packages"
brew bundle --file="$HOME/dotfiles/Brewfile"

echo "==> Installing mise (HOME version)"
if [ ! -x "$HOME/.local/bin/mise" ]; then
  curl https://mise.run | sh
fi

echo "==> Installing Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "==> Linking dotfiles"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "==> Installing Zsh plugins"
mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$HOME/.oh-my-zsh/custom/themes"

[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] || \
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] || \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ] || \
git clone https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

echo "==> Installing TPM"
[ -d "$HOME/.tmux/plugins/tpm" ] || \
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

echo "==> Setting git config (if empty)"
git config --global user.name >/dev/null 2>&1 || git config --global user.name "Vadim Lipatov"
git config --global user.email >/dev/null 2>&1 || git config --global user.email "you@example.com"

echo "==> Generating SSH key (if missing)"
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -C "you@example.com" -f "$HOME/.ssh/id_ed25519" -N ""
fi

echo "==> Done."
echo "Restart terminal."
echo "Run: tmux  →  press C-a + I"


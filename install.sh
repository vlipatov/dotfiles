#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"

# zsh
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
[ -f "$DOTFILES_DIR/.zprofile" ] && ln -sf "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

# tmux
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# git
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# brew
which brew >/dev/null && brew bundle --file="$DOTFILES_DIR/Brewfile"

# nvm and pyenv (manually set versions)
if command -v nvm >/dev/null; then
  nvm install $(cat "$DOTFILES_DIR/config/nvm/default-node-version")
fi

if command -v pyenv >/dev/null; then
  pyenv install -s $(cat "$DOTFILES_DIR/config/pyenv/default-python-version")
  pyenv global $(cat "$DOTFILES_DIR/config/pyenv/default-python-version")
fi

# Install Tmux Plugins via TPM
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing Tmux plugins..."
  "$HOME/.tmux/plugins/tpm/bin/install_plugins"
else
  echo "TPM not found. Skipping Tmux plugins installation."
fi

echo "✅ Dotfiles installed!"


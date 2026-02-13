#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/vlipatov/dotfiles.git"
TARGET_DIR="$HOME/dotfiles"

if [ ! -d "$TARGET_DIR" ]; then
  git clone "$REPO_URL" "$TARGET_DIR"
fi

cd "$TARGET_DIR"
bash install.sh


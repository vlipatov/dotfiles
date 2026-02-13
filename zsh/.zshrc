# -----------------------------
# Powerlevel10k instant prompt
# -----------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------
# Homebrew (Apple Silicon)
# -----------------------------
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# -----------------------------
# Oh My Zsh
# -----------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# -----------------------------
# Mise (version manager)
# -----------------------------
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# -----------------------------
# Aliases
# -----------------------------
alias ll="eza -la"
alias gs="git status"
alias gc="git commit"
alias gp="git push"

# -----------------------------
# Powerlevel10k config
# -----------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(/Users/vadimlipatov/.local/bin/mise activate zsh)"

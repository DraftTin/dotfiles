# Environment
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"
. "$HOME/.cargo/env"
export CMAKE_ROOT="/Applications/CMake.app/Contents/bin"
export PATH=$CMAKE_ROOT:$HOME/.local/bin:$PATH

export PATH=$HOME/development/flutter/bin:$PATH
export PATH=$HOME/.pub-cache/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
alias invs='nvim $(fzf -m --preview="cat {}")'

# Alias for nvim
alias v="nvim"

# Vim-mode
set -o vi
export KEYTIMEOUT=20

# Fix delete/backspace in vi insert mode
bindkey -v '^?' backward-delete-char
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^U' backward-kill-line
bindkey -v 'jk' vi-cmd-mode

# Kitty shortcuts
alias icat="kitten icat"

# Shell prompt
PROMPT='%1~ %# '

# Machine-specific config
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

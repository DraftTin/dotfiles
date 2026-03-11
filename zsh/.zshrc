# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ningyuheng/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ningyuheng/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ningyuheng/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ningyuheng/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "/Users/ningyuheng/.ghcup/env" ] && source "/Users/ningyuheng/.ghcup/env"
. "$HOME/.cargo/env"
export CMAKE_ROOT="/Applications/CMake.app/Contents/bin"
export PATH=$CMAKE_ROOT:$HOME/.local/bin:$PATH
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/


export PATH=/Users/ningyuheng/development/flutter/bin:$PATH

export PATH=$HOME/.pub-cache/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# fastfetch
fastfetch

# shortcuts
iCloud="/Users/ningyuheng/Library/Mobile Documents/com~apple~CloudDocs"

# change shell prompts
PROMPT='%1~ %# '

# Add shortcut for creating daily note
ObsidianVault="/Users/ningyuheng/Library/Mobile\ Documents/com~apple~CloudDocs/ObsidianVault"
alias dn="$ObsidianVault/scripts/create-daily-note.sh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"


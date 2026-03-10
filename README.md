# Dotfiles

Personal config files for nvim, tmux, and Claude Code.

## Structure

```
dotfiles/
  nvim/             → ~/.config/nvim
  tmux/             → ~/.tmux.conf (tmux/tmux.conf)
  claude/           → ~/.claude/settings.json
```

## Setup on a new machine

```bash
git clone https://github.com/DraftTin/dotfiles.git ~/dotfiles

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
mkdir -p ~/.claude && ln -s ~/dotfiles/claude/settings.json ~/.claude/settings.json
```

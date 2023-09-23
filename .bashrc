# ~/.bashrc
# Executed for non-login shells.
# Created by: Ethan Baik
# Date: 2022.06.15

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -x "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

VISUAL=/usr/bin/nvim
export EDITOR=$VISUAL

# Tab-Completion Behavior
# first TAB shows all matching, subsequent TAB cycles
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'

source /usr/share/autojump/autojump.sh
colorscript random

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND="fd --type file"
export FZF_DEFAULT_OPTS="--reverse --border --inline-info"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

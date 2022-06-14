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

VISUAL=/usr/bin/vim
EDITOR=$VISUAL

# Tab-Completion Behavior
# first TAB shows all matching, subsequent TAB cycles
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'

# ~/.bashrc
# Executed for non-login shells.
# Created by: Ethan Baik
# Date: 2022.04.12

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

# command history options
# ignore duplicate lines & lines starting with space
HISTCONTROL=ignoreboth:erasedups

HISTSIZE=1000
HISTFILESIZE=2000

# append to history rather than overwrite
shopt -s histappend

# Source external alias & functions files
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# modify tab-completion behavior
# first TAB shows all matching, subsequent TAB cycles
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'
bind 'set menu-complete-display-prefix on'

# ~/.bashrc.d/history.bashrc
# bash history file
# Created by: Ethan Baik
# Date: 2022.06.14

# Command History Options
# ignore duplicate lines & lines starting with space
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="ls:ll:cd ~:cd ..:cd -:pwd:clear:exit:h:history:vim:tmux"

HISTSIZE=1000
HISTFILESIZE=2000

# append to history rather than overwrite
shopt -s histappend

PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

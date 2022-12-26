# ~/.bashrc.d/aliases.bashrc
# bash aliases file
# Created by: Ethan Baik
# Date: 2022.05.15

# enable color support of ls & grep
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b_)"
#    alias ls='ls -F --color=auto'
#    #alias dir='dir --color=auto'
#    #alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi

# ls
#alias ls='ls -F'
#alias ll='ls -lahF'
#alias la='ls -AF'

# exa replacement for ls
alias ls='exa -F'
alias la='exa -aF'
alias ll='exa -lhaF --git'

alias h='history 100'   # show only recent history

alias gh='history | grep -i'    # search history
alias psg='ps -e | grep -i'     # search processes

alias clear='clear -x'  # prevent clearing of scroll buffer (like ctrl-l)
alias cls='clear'

# Dotfiles git alias
alias dtf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Trash Alias
alias rm='echo "Use the trash command instead."; false'

# Interactive Move/Copy
alias mv='mv -i'
alias cp='cp -i'

# Application Aliases
alias ytdlp='yt-dlp'

# Weather from wttr.in
alias wttr='curl wttr.in/Bundang-gu?nqF'

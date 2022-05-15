# ~/.bash_aliases
# bash aliases file
# Created by: Ethan Baik
# Date: 2022.04.12

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
alias ll='ls -lahF'
alias la='ls -AF'
alias l='ls -CF'

alias h='history 100'   # show only recent history
alias gh='history | grep -i'

alias psg='ps -e | grep -i'

alias cls='clear'

# Dotfiles git alias
alias dtf='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Trash Alias
alias rm='echo "Use the trash command instead."; false'

# Application Aliases
alias ytdlp='yt-dlp'
## Python Virtual Env Application Aliases
#alias streamlink='~/.virtualenvs/strmlnk/bin/streamlnk'
#alias ytdlp='~/.virtualenvs/ytdlp/bin/yt-dlp'

# Weather from wttr.in
alias wttr='curl wttr.in/Bundang-gu?nqF'

# ~/.bashrc.d/prompt.bashrc
# bash prompt file
# Created by: Ethan Baik
# Date: 2022.06.07

# PS1 Prompt Customization
. ~/.git-prompt.sh              # enable git branch names
GIT_PS1_SHOWDIRTYSTATE=true     # + staged, * unstaged
GIT_PS1_SHOWUPSTREAM=auto       # = nodiff, > ahead, < behind

# ethan@fedora ~/Documents$ cd ..
#PS1="\[\033[01;32m\]\u@\h \[\033[01;35m\]\w\[\033[00m\]\$ "

#✔ ethan@fedora:~/Documents (main)
#$ cd ..
#PS1='`if [ \$? = 0 ]; then echo "\[\033[01;32m\]✔ "; else echo "\[\033[01;31m\]✘ "; fi`\[\033[01;34m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w \[\033[00m\]$(__git_ps1 "(%s)")\n\$ '

# ✔ ethan@fedora:~/Documents (main) *colored
# $ cd ..
#PS1='`if [ \$? = 0 ]; then echo "\[\e[01;32m\] ✔ "; else echo "\[\e[01;31m\] ✘ "; fi`\[\e[01;34m\]\u@\h\[\e[00m\]:\[\e[01;35m\]\w \[\e[00m\]`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[33m\]" || echo "\[\e[31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)")\[\e[00m\]\n \$ '

#
# ┌───(ethan)───(~/Documents)
# └> $ cd ..
#PS1='\n \[\e[0;34m\]┌───(\[\e[01;35m\]\u\[\e[00;34m\])───(\[\e[01;32m\]\w\[\e[00;34m\])`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo '\[\e[33m\]' || echo '\[\e[31m\]'``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo '\[\e[32m\]'`$(__git_ps1 '(%s)')\n \[\e[00;34m\]└> \[\e[00m\]\$ '

#
# ┌───(ethan)───(~/Documents)───(master) *colored
# └> $ cd ..
#PS1='\n \[\e[00;34m\]┌───(\[\e[01;35m\]\u\[\e[00;34m\])───(\[\e[01;32m\]\w\[\e[00;34m\])$(__git_ps1 "───(`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[01;33m\]" || echo "\[\e[01;31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[01;32m\]"`%s\[\e[00;34m\])")\n └> \[\e[00m\]\$ '
#
# ┌─(✔)───(ethan)───(~/Documents)───(master) *colored
# └> $ cd ..
PS1='\n \[\e[00;34m\]┌─(`if [ \$? = 0 ]; then echo "\[\e[01;32m\]✔"; else echo "\[\e[01;31m\]✘"; fi`\[\e[00;34m\])───(\[\e[01;35m\]\u\[\e[00;34m\])───(\[\e[01;32m\]\w\[\e[00;34m\])$(__git_ps1 "───(\[\e[01;34m\] `[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[01;33m\]" || echo "\[\e[01;31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[01;32m\]"`%s\[\e[00;34m\])")\n └> \[\e[00m\]\$ '

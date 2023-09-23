#!/bin/bash

tac ~/.bash_history | awk '!x[$0]++' > /tmp/tmphist && \
    tac /tmp/tmphist > ~/.bash_history

#tac ~/.bash_history | awk '!x[$0]++' | tac > ~/.bash_history.new && \
#    mv ~/.bash_history.new ~/.bash_history

# Using $HISTFILE instead of ~/.bash_history does not work
# unless export HISTFILE=~/.bash_history is included in .bashrc

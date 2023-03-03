# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

if [ "$PS1" ]; then
  export PS1='[\u@\h](\w) \$ '
fi

export EDITOR=vim

function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gm='git merge --no-ff'
alias gl='git log --oneline --all --graph --decorate'


# $FreeBSD$
#
# .shrc - bourne shell startup file 
#
# This file will be used if the shell is invoked for interactive use and
#
# see also sh(1), environ(7).
#


# file permissions: rwxr-xr-x
#
# umask	022

# Uncomment this to enable the builtin vi(1) command line editor in sh(1),
# e.g. ESC to go into visual mode.
# set -o vi


# some useful aliases
alias h='fc -l'
alias j='jobs -l'
alias m="$PAGER"
alias ls='ls -aFG'
alias ll='ls -lo'
alias l='ls -l'
alias g='egrep -i'
alias vi="vim"
 
# # be paranoid
# alias cp='cp -ip'
# alias mv='mv -i'
# alias rm='rm -i'


# # set prompt: ``username@hostname$ '' 
# PS1="`whoami`@`hostname | sed 's/\..*//'`"
# case `id -u` in
# 	0) PS1="${PS1}# ";;
# 	*) PS1="${PS1}$ ";;
# esac

# search path for cd(1)
# CDPATH=:$HOME

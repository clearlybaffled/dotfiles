# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -AFh --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  else
    alias ls="ls -AFh"

fi
alias ll='ls -l'

# some useful aliases
alias h='fc -l'
alias j='jobs -l'
alias m="$PAGER"
alias l='ls -l'
alias g='egrep -i'
alias vi="vim"
 
# # be paranoid
# alias cp='cp -ip'
# alias mv='mv -i'
# alias rm='rm -i'


# GIT aliases
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gm='git merge --no-ff'
alias gl='git log --oneline --all --graph --decorate'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ztoff="sudo zerotier-cli leave 6ab565387aef04e0"
alias zton="sudo zerotier-cli join 6ab565387aef04e0"

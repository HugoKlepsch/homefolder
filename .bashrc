export TERM=xterm-256color

# So that less can display emoji
export LESSCHARSET=utf-8
alias less='less -r'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s globstar

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    export PS1="\[\033[38;5;14m\]\t\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\
\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\] \
\$? \[$(tput sgr0)\]\[\033[38;5;208m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\
\[$(tput sgr0)\] \\$ \[$(tput sgr0)\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -G'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#env vars
export VISUAL="vim"

# some more ls aliases
alias ll='ls -lh -G'
alias lh='ls -lh -G'
alias la='ls -alh -G'

function editconflicts() {
  vim -p $( git diff --name-only --diff-filter=U | xargs )
}

cdls(){
  if [[ -z "${1}" ]]; then
    cd ~
  else
    cd "${1}"
  fi

  RET=$?
  if [[ ${RET} -ne 1 ]]; then
    ll
  fi
}

alias cd='cdls'
alias l='ls -CF'
alias vi='vim'
alias vim='vim'
alias dong='printf "\a"'

# Docker garbo
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# Git aliases
alias gl='git log --color --pretty=format:"%C(auto)%h %Cred %<(20,trunc)%an %Creset%C(auto)%s %Cgreen(%cr,%ar) %Creset%C(auto)%d"'
alias gs='git status'
alias gd='git diff'

alias resetswap='sudo swapoff -a && sudo swapon -a'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

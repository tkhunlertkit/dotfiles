#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[$(tput setaf 6)\]\u: \[$(tput bold)\]\[$(tput setaf 5)\][\W/] \[$(tput sgr0)\]\[$(tput setaf 3)\]\$ \[$(tput setaf 7)\]'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

alias ls='ls --color=auto'
LS_COLORS=$LS_COLORS:'di=1;34:ex=1;35:ln=0;94'; export LS_COLORS

export KDEWM=/usr/bin/i3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
xautolock -time 5 -locker "$HOME/.config/.myscript/lock"

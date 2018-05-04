#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PS1='\[$(tput setaf 6)\]\u: \[$(tput bold)\]\[$(tput setaf 5)\][\W/] \[$(tput sgr0)\]\[$(tput setaf 3)\]\$ \[$(tput setaf 7)\]'

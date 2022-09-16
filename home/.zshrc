eval `ssh-agent -s`

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
alias pac='sudo pacman'
alias dnuke='docker stop $(docker ps -aq) && docker system prune -af'
alias get='sudo apt-get'
alias mount_smb_genomic='sudo mount -t cifs -o username=Genome03,password=Geno@2984 //smb.isilon-genome.bumrungrad.org/GenomeLab /mnt/smb_genomics'
alias nf='ls | wc'
alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias lg='ll | grep'
alias lr='ll -tr'
start_jupyter() {
    cd /home/$1 && conda activate karn && sudo runuser -l $1 -c '/home/tkhunlertkit/anaconda3/envs/karn/bin/jupyter-lab'
}
mount_smb_genomic_rw() {
    echo -n 'Are you sure to mount smb_genomics as read/write? [yN]: '
    read ans
    if [ "$ans" = "y" ]
    then
        sudo mount -t cifs -o username=Genome02,password=Geno@2539 //smb.isilon-genome.bumrungrad.org/GenomeLab /mnt/smb_genomics
    fi
}
dr() {
    du -sh $1 | sort -hr
}
killp() {
    ps aux | grep -i $1 | tr -s ' ' | cut -d ' ' -f2 | head -n 1 | xargs kill -9
}

LS_COLORS=$LS_COLORS:'di=1;34:ex=1;35:ln=0;94:ow=01;04;34'; export LS_COLORS

#if [[ -z $DISPLAY && $XDG_VTNR -le 3 && $SSH_CLIENT ]]; then
#  exec startx
#fi

export VIRTUAL_ENV_DISABLE_PROMPT=0
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export https_proxy=http://tanawatk:%404HanArinism%24%29%21@10.104.0.11:8080
export http_proxy=http://tanawatk:%404HanArinism%24%29%21@10.104.0.11:8080
export ftp_proxy=http://tanawatk:%404HanArinism%24%29%21@10.104.0.11:8080
export TERM=xterm-256color
export PATH="$PATH:/opt/mssql-tools/bin"
export EDITOR='nvim'
# export PATH=$HOME/.local/bin
# eval output=$( ssh-agent ) && eval $output && ssh-add

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tkhunlertkit/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tkhunlertkit/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tkhunlertkit/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tkhunlertkit/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

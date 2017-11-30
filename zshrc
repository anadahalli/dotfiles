# oh-my-zsh
ZSH_THEME="robbyrussell"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git git-extras vi-mode archlinux systemd python history-substring-search
         pip extract fasd virtualenvwrapper tmux sudo docker-compose)

export ZSH=/home/ashwath/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export PATH=$HOME/.local/bin:$PATH

export KEYTIMEOUT=1
export DISABLE_AUTO_TITLE='true'

workon_cwd

# vi mode
bindkey -v
bindkey '^[[Z' reverse-menu-complete

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias sshconfig="vim ~/.ssh/config"
alias tmuxconfig="vim ~/.tmux.conf"

alias zshupdate="source ~/.zshrc"

alias p="ps -ef | grep"
alias k="kill -9"

alias vi="vim"
alias v="f -e vim"

alias t="tmux"
alias tm="tmuxp load"

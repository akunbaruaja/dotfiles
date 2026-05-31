# Custom aliases

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ll="ls -alFh"
alias la="ls -A"
alias lt="ls -lt --head 20"

# Git shortcuts
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline -20"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias gpl="git pull"
alias gst="git stash"

# Docker
alias dk="docker"
alias dc="docker compose"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias dlogs="docker logs -f"

# Python
alias py="python3"
alias pip="pip3"
alias venv="python3 -m venv"
alias activate="source .venv/bin/activate"

# Misc
alias reload="source ~/.zshrc"
alias myip="curl -s ifconfig.me"
alias ports="netstat -tuln"
alias df="df -h"
alias du="du -h"
alias mkdir="mkdir -pv"
alias grep="grep --color=auto"
alias path='echo $PATH | tr ":" "\n"'

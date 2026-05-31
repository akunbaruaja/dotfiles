# ~/.zshrc — Main zsh configuration

# ---- Oh My Zsh ----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    docker
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
)

source $ZSH/oh-my-zsh.sh

# ---- Custom config ----
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"

# ---- History ----
HISTSIZE=50000
SAVEHIST=50000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# ---- Completion ----
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ---- Vi mode (optional) ----
# bindkey -v
# export KEYTIMEOUT=1

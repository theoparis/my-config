fpath=(~/.zfunc $fpath)
plugins=(lxd-completion-zsh)

## fzf search for a folder, then cd into it
function f() {
    if [ ${1:-""} != "" ]; then
        ls $1 | fzf | read f && cd "$1/$f"
    else
        ls | fzf | read f && cd $f
    fi
}

function gen-pass() {
    tr -cd '[:alnum:]' < /dev/urandom | fold -w${1:-"32"} | head -n1
}

# Exports
export PATH="$PATH:/usr/lib/jvm/java-16-openjdk/bin:$HOME/my-config/scripts/bin:/usr/local/go/bin"
export EDITOR="nvim"
export TERMINAL="kitty"
export TERM="xterm-256color"
export NVM_DIR="$HOME/.nvm"
export SXHKD_SHELL="$SHELL"

# Loading
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Plugins
# Download Znap, if it's not there yet.
[[ -f ~/.znap/zsh-snap/znap.zsh ]] ||
    git clone https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap

source ~/.znap/zsh-snap/znap.zsh  # Start Znap

znap source endaaman/lxd-completion-zsh
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source marlonrichert/zsh-autocomplete

zstyle ':znap:*' git-maintenance off
zstyle ':autocomplete:*' min-input 1 min-delay 1
zstyle ':autocomplete:*' async off

# Projects Folder For Quick Navigation
export DEV_FOLDER="$HOME/dev"

[[ -f ~/.config/zsh/user.zsh ]] && source ~/.config/zsh/user.zsh

[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi


# Aliases
alias rpy="rustpython"
alias d="f $DEV_FOLDER"
alias L="sudo -E n"
alias l="n -Rdae"
alias ll="exa -a --time-style=hide"
alias lll="exa -la"
alias trm="trash"
alias s="doas"
alias pwease="s"
# Git aliases
alias g="git"
alias gbr="fzf-git-branch"
alias gps="git push"
alias gpl="git pull"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gst="git status"
alias gdf="git diff"
alias gad="git add"
alias gch="fzf-git-checkout"
alias gchb="git checkout -b"
alias gl="git log --abbrev-commit --date=local --name-status --pretty --color --decorate --graph"
alias gw="git worktree"
alias gwa="git worktree add"
alias gro="xdg-open $(git remote get-url origin)"

# curl speed test for a site
function wst() {
    curl -s -w 'Testing Website Response Time for :%{url_effective}\n\nLookup Time:\t\t%{time_namelookup}\nConnect Time:\t\t%{time_connect}\nAppCon Time:\t\t%{time_appconnect}\nRedirect Time:\t\t%{time_redirect}\nPre-transfer Time:\t%{time_pretransfer}\nStart-transfer Time:\t%{time_starttransfer}\n\nTotal Time:\t\t%{time_total}\n' -o /dev/null $1
}

function batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff $1
}

function sftpu() {
    localFile="$1"
    remotePath="$2"

    sftp ${remotePath} <<< "put ${localFile}"
}

# lm-sensors get specific sensor
function sensor() {
    sensors | grep $1 | cut -f2- -d: | tr -d ' 	'
}

function change-extension() {
  foreach f (**/*.$1)
    mv $f $f:r.$2
  end
}

function genMacAddr() {
    echo $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//')
}

## fzf search for a folder, then cd into it
function f() {
    if [ ${1:-""} != "" ]; then
        ls $1 | fzf | read f && cd "$1/$f"
    else
        ls | fzf | read f && cd $f
    fi
}

function gen-pass() {
    tr -cd '[:alnum:]' < /dev/urandom | fold -w${1:-"32"} | head -n1
}

fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65%             --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export VULKAN_SDK="$HOME/vukan"

# Load functions
#for file in ~/.zfunc/*; do
#    source "$file"
#done

export DENO_INSTALL="$HOME/.deno"
export HISTFILE="~/.zsh_history"
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
export KUBECONFIG="$HOME/.kubeconfig"
export GOPATH=$HOME/go
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin"

setxkbmap -option caps:escape

# 256 color support
alias tmux="tmux -2 -u"  # for 256color

export DOCKER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"
export PATH="$PATH:$(go env GOROOT)/misc/wasm"

function emsource() {
    source "$HOME/emsdk/emsdk_env.sh"
}

# Compinit for shell autocompletion
autoload -U compinit
compinit

<<<<<<< Updated upstream
# Load starship prompt (https://starship.rs)
autoload -U colors
||||||| constructed merge base
# OPS config
if [ -f "$OPS_DIR/scripts/bash_completion.sh" ]; then
	source "$OPS_DIR/scripts/bash_completion.sh"
fi



#eval "$(thefuck --alias)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#zprof

# Wasmer
export WASMER_DIR="/home/theo/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

alias luamake=/mnt/data/projects/lua-language-server/3rd/luamake/luamake
=======
# OPS config
if [ -f "$OPS_DIR/scripts/bash_completion.sh" ]; then
	source "$OPS_DIR/scripts/bash_completion.sh"
fi

. /home/theo/.nix-profile/etc/profile.d/nix.sh

#eval "$(thefuck --alias)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#zprof

# Wasmer
export WASMER_DIR="/home/theo/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
alias luamake=/mnt/data/projects/lua-language-server/3rd/luamake/luamake
>>>>>>> Stashed changes

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# OPS config
export OPS_DIR="$HOME/.ops"
export PATH="$HOME/.ops/bin:$PATH"
if [ -f "$OPS_DIR/scripts/bash_completion.sh" ]; then
    source "$OPS_DIR/scripts/bash_completion.sh"
fi

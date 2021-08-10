# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Functions
fpath=( ~/.zfunc "${fpath[@]}" )

## fzf search for a folder, then cd into it
function f() {
    if [ ${1:-""} != "" ]; then
        ls $1 | fzf | read f && cd "$1/$f"
    else
        ls | fzf | read f && cd $f
    fi
}

# Exports
export PATH="$PATH:~/.local/bin"
export EDITOR="nvim"
export TERMINAL="alacritty"
export NVM_DIR="$HOME/.nvm"

# Loading
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Plugins
# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

znap source romkatv/powerlevel10k
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source Aloxaf/fzf-tab

# Projects Folder For Quick Navigation
export DEV_FOLDER="$HOME/dev"

[[ -f ~/.config/zsh/user.zsh ]] && source ~/.config/zsh/user.zsh

# Aliases
alias d="f $DEV_FOLDER"
alias nnn="nnn -Rdae"
alias ll="nnn"
alias N="sudo -E nnn"
alias l="ls -l"
alias trm="trash"
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
alias gl="git log --graph --abbrev-commit --date=local --name-status"
alias gw="git worktree"
alias gwa="git worktree add"
alias gro="xdg-open $(git remote get-url origin)"

# lm-sensors get specific sensor
function sensor() {
    sensors | grep $1 | cut -f2- -d: | tr -d ' 	'
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

#!/bin/zsh

# aliases
# 256 color support
alias tmux="tmux -2 -u" # for 256color

alias d='f $DEV_FOLDER'
alias rm="rm -i"
alias mv="mv -n"
alias cp="cp -n"
alias s="doas"
alias l="xplr"
alias sedit="doasedit"
alias pwease="s"
alias pweasedit="sedit"
alias nmp="ncmpcpp"
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
alias gl="git log --abbrev-commit --date=local --name-status --pretty   --color --decorate --graph"
alias gw="git worktree"
alias gwa="git worktree add"
alias gro='xdg-open $(git remote get-url origin)'

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

